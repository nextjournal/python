FROM continuumio/anaconda3:4.3.1

# libgl1-mesa-glx fixes matplotlib qt5 support
RUN apt-get --yes install libgomp1 libgl1-mesa-glx && apt-get clean

RUN conda config --add channels omnia && \
    conda install --yes matplotlib=1.5.3 seaborn && \
    conda install --yes -c omnia/label/pre pyemma && \
    # libxcb may also fix matplotlib issues
    conda install --yes -c qttesting libxcb && \
    conda install --yes -c fabianrost pandas-datareader && \
RUN pip install --upgrade pip && pip install datapackage cufflinks plotly

# importing matplotlib primes its font cache, which speeds up importing in a container
RUN python -c "import matplotlib"

COPY ./stream-stdin.py /scripts/stream-stdin.py
COPY ./pyemma_logging.yml /root/.pyemma/logging.yml
