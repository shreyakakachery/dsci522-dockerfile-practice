FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy lock file into image
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Install packages from lock file
RUN mamba install --yes --file /tmp/conda-linux-64.lock && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
