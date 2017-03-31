FROM continuumio/anaconda3:4.3.1

RUN apt-get --yes install libgomp1 && apt-get clean

RUN conda update conda; conda update --all
RUN conda config --add channels omnia
RUN conda install --yes -c omnia/label/pre pyemma
RUN conda install --yes plotly seaborn
RUN conda install --yes -c liulab cufflinks
RUN conda install --yes -c qttesting libxcb
RUN conda install --yes --force matplotlib
RUN pip install --upgrade pip
RUN pip install datapackage

RUN apt-get --yes install libgl1-mesa-glx
# to reduce startup time, build font cache for matplotlib
RUN python -c "import numpy as np, pickle, pyemma; import matplotlib.pyplot"

COPY ./stream-stdin.py /scripts/stream-stdin.py
COPY ./pyemma_logging.yml /root/.pyemma/logging.yml
