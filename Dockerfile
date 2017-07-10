FROM continuumio/anaconda3:4.4.0

RUN conda install --yes feather-format -c conda-forge

# importing matplotlib primes its font cache, which speeds up importing in a container
RUN python -c "import matplotlib"

COPY ./stream-stdin.py /scripts/stream-stdin.py
COPY ./pyemma_logging.yml /root/.pyemma/logging.yml
