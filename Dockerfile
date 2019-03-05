
# Distributed under the terms of the GNU General Public License v3.0
FROM ubuntu
LABEL maintainer="Data Analyst Notebook <l.johnny@outlook.com>"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
# Setup Timezone
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && yes|apt-get upgrade

#Install necessary tools
RUN apt-get install -y wget bzip2 git unzip tree
RUN apt-get clean
RUN wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh
RUN bash Anaconda3-2018.12-Linux-x86_64.sh -b
RUN rm Anaconda3-2018.12-Linux-x86_64.sh

# Setup path
ENV PATH /root/anaconda3/bin:$PATH

# Install packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all
RUN conda install --yes numpy scipy pandas matplotlib seaborn tqdm autopep8
RUN conda install -c conda-forge lightgbm
RUN pip install lighteda




# Configuring access to Jupyter
RUN mkdir workspace
ENV HOME=/workspace
ENV SHELL=/bin/bash
VOLUME /workspace
WORKDIR /workspace

COPY run_jupyter.sh /opt/run_jupyter.sh
RUN chmod +x /opt/run_jupyter.sh
COPY password.txt /opt/password.txt
RUN chmod +x /opt/password.txt

#install R
RUN apt-get install -y libopenblas-base r-base
RUN R -e 'install.packages(c("repr", "IRdisplay", "evaluate", "crayon", "pbdZMQ", "devtools", "uuid", "digest", "IRkernel"))'
RUN R -e 'IRkernel::installspec()'

#install Nbextensions
RUN pip install jupyter_contrib_nbextensions
RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master
RUN jupyter contrib nbextension install --user
RUN pip install jupyter_nbextensions_configurator
RUN jupyter nbextensions_configurator enable --user


# Jupyter listens port: 8888
EXPOSE 8888
# Run Jupytewr notebook as Docker main process
CMD ["/opt/run_jupyter.sh"]
