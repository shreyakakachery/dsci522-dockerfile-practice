FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

USER root

RUN mamba install -c conda-forge conda-lock

USER ${NB_UID}

COPY conda-lock.yml /tmp/conda-lock.yml

RUN conda-lock install --name myenv /tmp/conda-lock.yml && \
    echo "conda activate myenv" >> ~/.bashrc    