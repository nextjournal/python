FROM continuumio/anaconda:4.2.0

RUN pip install plotly==1.12.12

# Install pyEmma
RUN apt-get --yes install libgomp1 && apt-get clean
RUN conda config --add channels omnia
RUN conda install --yes pyemma=2.2.7

# workaround from https://github.com/ContinuumIO/anaconda-issues/issues/1068#issuecomment-255814564
RUN conda install pyqt=4.11

# to reduce startup time, build font cache for matplotlib
RUN python -c "import matplotlib.pyplot"
