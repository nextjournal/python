FROM continuumio/anaconda3:4.3.1

# libgl1-mesa-glx fixes matplotlib qt5 support
RUN apt-get --yes install libgomp1 libgl1-mesa-glx && apt-get clean

RUN conda config --add channels omnia
RUN conda install --yes matplotlib=1.5.3
RUN conda install --yes -c omnia/label/pre pyemma
RUN conda install --yes -c qttesting libxcb
RUN conda install --yes -c fabianrost pandas-datareader
RUN conda install --yes seaborn
RUN pip install --upgrade pip
RUN pip install datapackage cufflinks plotly

# to reduce startup time, build font cache for matplotlib
RUN python -c "import numpy as np, pickle, pyemma; import matplotlib; matplotlib.use('webagg'); import matplotlib.pyplot"

COPY ./stream-stdin.py /scripts/stream-stdin.py
COPY ./pyemma_logging.yml /root/.pyemma/logging.yml
