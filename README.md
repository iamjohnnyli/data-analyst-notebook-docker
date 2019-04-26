# DATA ANALYST NOTEBOOK DOCKERFILE
>This is my Dockerfile for the Docker image of Data Analyst Notebook

## INTRO
I am usually run Jupyter Notebook or Hydrogen in my MacBook Pro. However, sometimes, for a massive dataset or complex model, I need to use my more powerful desktop or Cloud Service. But setting up the environment and installing tools and packages can be time-consuming, and no need to mention the compatibility problems. Luckily, we have Docker! It “containerized” the working environment. For different machines, you can have identical containers. Therefore, you have the same working environment setup, same package, same settings, and same software versions. If you update one container, you can take a snapshot, push it to the repository, and update the modification to other machines. For more information, you can click [here](https://www.docker.com/why-docker).


## MY DOCKER IMAGE

**Version 0.2**  
Inspired from [Jupyter Docker Stacks](https://github.com/jupyter/docker-stacks), I update following things:

- I switch Base Container to jupyter/scipy-notebook
- I installed few package:
  - lightgbm
  - pytorch
  - xgboost
  - graphviz
  - pydot
  - jupytext
  - lighteda

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


## INSTALL

### Install Docker
The Docker community have an explicit tutorial about how to install Docker. Please check [here](https://www.docker.com/community-edition#/download)



### BUILD ONE BASED ON DOCKERFILE
A Dockerfile basically "tells" docker the way a image build. You can edit it to fit to your daily usages.

In terminal, direct to the folder that contains the dockerfile and run the following command:
```bash
docker build -t data-analyst-notebook .
```
Don't forget the "." at the end. data-analyst-notebook is the name of the image you build.

## START SERVER
For mac and Ubuntu:  
After the installation, You simply run run_docker.sh . In browser, you can go to [localhost:8888](http://localhost:8888) to access the Jupyter notebook.
