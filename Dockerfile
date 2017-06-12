FROM continuumio/anaconda3:4.4.0

RUN conda install --yes feather-format -c conda-forge

COPY ./stream-stdin.py /scripts/stream-stdin.py
COPY ./pyemma_logging.yml /root/.pyemma/logging.yml
