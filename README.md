# DATA ANALYST NOTEBOOK DOCKERFILE
>This is my Dockerfile for the Docker image of Data Analyst Notebook

## INTRO

**Apr 26 2019 Update**

 The another reason I use docker is to have a consistent environment for research. By using the same docker image, any people at any time can repeat the experiment in same environment.   


**Mar 5 2019**

I am usually run Jupyter Notebook or Hydrogen in my MacBook Pro. However, sometimes, for a massive dataset or complex model, I need to use my more powerful desktop or Cloud Service. But setting up the environment and installing tools and packages can be time-consuming, and no need to mention the compatibility problems. Luckily, we have Docker! It “containerized” the working environment. For different machines, you can have identical containers. Therefore, you have the same working environment setup, same package, same settings, and same software versions. If you update one container, you can take a snapshot, push it to the repository, and update the modification to other machines. For more information, you can click [here](https://www.docker.com/why-docker).


## MY DOCKERFILE

A Dockerfile basically "tells" docker the way a image build. You can edit it to fit to your daily usages.

***Version 0.3***
TODO:
- [ ] Find a easy method to pre-seed credentials settings so the Google Drive extension works out-of-the-box on start-up
- [ ] Build a GPU versions Docker


**Version 0.2**  
Inspired from [Jupyter Docker Stacks](https://github.com/jupyter/docker-stacks), I update following things:

- I switch Base Container to jupyter/scipy-notebook
- I installed few packages:
  - keras 2.2
  - tensorflow 1.13
  - pytorch
  - xgboost
  - lightgbm
  - graphviz
  - pydot
  - jupytext
  - lighteda
  - ntlk
  - textblob
  - spacy

- Also I enabled some my favorite extensions:
  - code_prettify/autopep8
  - gist_it/main
  - highlighter/highlighter
  - keyboard_shortcut_editor/main
  - scratchpad/main
  - select_keymap/main
  - snippets_menu/main
  - spellchecker/main
  - toc2/main
  - table_beautifier/main
  - varInspector/main


**Version 0.1**    
*3-5-2019*  
My docker image based on Ubuntu. It supports Python 3 and R kernel in Jupyter Notebook. With the help of R Magic,  I can run both Python and R in the same .ipynb file.  To learn more about R Magic, you can click [here](https://www.datacamp.com/community/blog/jupyter-notebook-r?utm_source=adwords_ppc&utm_campaignid=1565261270&utm_adgroupid=67750485268&utm_device=c&utm_keyword=&utm_matchtype=b&utm_network=g&utm_adpostion=1t1&utm_creative=295208661496&utm_targetid=dsa-473406574235&utm_loc_interest_ms=&utm_loc_physical_ms=9033309&gclid=EAIaIQobChMIt5Xy39jq4AIVbiCtBh3FdQ4IEAAYASAAEgLEZ_D_BwE).
I also installed Nbextensions for Jupyter Notebook.  For more information, you can click [here](https://github.com/ipython-contrib/jupyter_contrib_nbextensions)


## Build YOUR OWN DOCKER IMAGE


### Install Docker
The Docker community have an explicit tutorial about how to install Docker. Please check [here](https://www.docker.com/community-edition#/download)


### BUILD ONE BASED ON DOCKERFILE

In terminal, direct to the folder that contains the dockerfile and run the following command:
```sh
docker build -t data-analyst-notebook .
```
Don't forget the "." at the end. data-analyst-notebook is the name of the image. You can change to what ever you prefer.

## START SERVER
I use following code to start server:
```sh
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v ~/:/home/jovyan/work data-analyst-notebook
```
There is more detailed instruction from [User Guide on ReadTheDocs](https://jupyter-docker-stacks.readthedocs.io/en/latest/)

If you feel like that the command is too long to run. You can add alias to to your .bashrc file like this:
```sh
alias dslab='docker run -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v ~/:/home/jovyan/work data-analyst-notebook'
```
Now you can use ```dslab``` as a replacement for typing the long command.
