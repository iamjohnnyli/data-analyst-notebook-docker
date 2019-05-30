# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the BSD License
# The Dockerfile is Inspired by Jupyter Docker Stacks(https://github.com/jupyter/docker-stacks) and Emmanuel's Docker Stacks (https://github.com/jolibrain/docker-stacks/)
# Inspect the Dockerfile at:
# https://github.com/j84lee/data-analyst-notebook-docker


FROM iamjohnnyli/dsnb-gpu-scipy
LABEL maintainer="Data Analyst Notebook <l.johnny@outlook.com>"

RUN conda install python=3.7 anaconda=custom
# Install Tensorflow
RUN conda install --quiet --yes tensorflow-gpu keras-gpu && \
# Add package that I usually use
    conda install --yes numpy scipy pandas matplotlib seaborn tqdm autopep8 && \
    conda install -c conda-forge lightgbm && \
    pip install pystan && \
    pip install fbprophet && \
    conda install -c pytorch torchvision cudatoolkit=10.0 -c pytorch && \
    conda install -c conda-forge xgboost && \
    conda install graphviz && \
    conda install pydot && \
    conda install -c anaconda nltk && \
    conda install -c conda-forge textblob && \
    conda install -c conda-forge spacy && \
    conda install -c conda-forge tqdm && \
    conda install -c plotly plotly  && \
    conda install -c conda-forge pipreqs && \
    conda install -c conda-forge jupytext && \
    conda install -c conda-forge jupyter_contrib_nbextensions && \
    pip install lighteda && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# #install LightGMB GPU version
#
# USER root
# RUN apt-get update -y && \
#     apt-get update && \
#     apt remove --purge --auto-remove cmake
#     ADD https://cmake.org/files/v3.14/cmake-3.14.4-Linux-x86_64.sh /cmake-3.14.4-Linux-x86_64.sh
#     RUN mkdir /opt/cmake && \
#         sh /cmake-3.14.4-Linux-x86_64.sh --prefix=/opt/cmake --skip-license && \
#         ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake && \
#         apt install -y ocl-icd-* opencl-headers && \
#         apt-get install -y libboost-all-dev && \
#         cmake --version && \
#         gcc --version
#
# RUN git clone --recursive https://github.com/Microsoft/LightGBM.git && \
#     cd LightGBM/python-package && \
#     python setup.py install --gpu && \
#     cd .. && \
#     cd .. && \
#     rm -rf LightGBM
# USER $NB_UID
#
# RUN fix-permissions $CONDA_DIR && \
#     fix-permissions /home/$NB_USER


USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    python-pydot \
    python-pydot-ng \
    tzdata \
    graphviz \
    gfortran \
    gcc && \
    rm -rf /var/lib/apt/lists/*


USER $NB_UID




# R packages including IRKernel which gets installed globally.
RUN conda install --quiet --yes \
    'rpy2=2.9*' \
    'r-base=3.5.1' \
    'r-irkernel=0.8*' \
    'r-plyr=1.8*' \
    'r-devtools=1.13*' \
    'r-tidyverse=1.2*' \
    'r-shiny=1.2*' \
    'r-rmarkdown=1.11*' \
    'r-forecast=8.2*' \
    'r-rsqlite=2.1*' \
    'r-reshape2=1.4*' \
    'r-nycflights13=1.0*' \
    'r-caret=6.0*' \
    'r-rcurl=1.95*' \
    'r-crayon=1.3*' \
    'r-randomforest=4.6*' \
    'r-htmltools=0.3*' \
    'r-sparklyr=0.9*' \
    'r-htmlwidgets=1.2*' \
    'r-hexbin=1.27*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER


# # Add C language Kernel
# USER root
#
# RUN pip install jupyter-c-kernel
# RUN install_c_kernel
#
# USER $NB_UID
# RUN fix-permissions $CONDA_DIR && \
#     fix-permissions /home/$NB_USER


# Add Jupyter Lab extensions
RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install @krassowski/jupyterlab_go_to_definition

RUN jupyter labextension install @ryantam626/jupyterlab_code_formatter
RUN pip install jupyterlab_code_formatter
RUN jupyter serverextension enable --py jupyterlab_code_formatter

RUN jupyter labextension install @jupyterlab/git
RUN pip install jupyterlab-git
RUN jupyter serverextension enable --py jupyterlab_git

RUN jupyter labextension install @jupyterlab/github
RUN jupyter labextension install jupyterlab_nbmetadata
RUN jupyter labextension install @jupyterlab/google-drive

# Active the note icon for jupytext
RUN echo 'c.NotebookApp.contents_manager_class = "jupytext.TextFileContentsManager"' >> .jupyter/jupyter_notebook_config.py

# Active nbextension
RUN jupyter nbextension enable code_prettify/autopep8
RUN jupyter nbextension enable gist_it/main
RUN jupyter nbextension enable highlighter/highlighter
RUN jupyter nbextension enable keyboard_shortcut_editor/main
RUN jupyter nbextension enable scratchpad/main
RUN jupyter nbextension enable select_keymap/main
RUN jupyter nbextension enable snippets_menu/main
RUN jupyter nbextension enable spellchecker/main
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable table_beautifier/main
RUN jupyter nbextension enable varInspector/main

# Download corpora and language model for NLP packages.
RUN python -m textblob.download_corpora
RUN python -m spacy download en_core_web_sm
