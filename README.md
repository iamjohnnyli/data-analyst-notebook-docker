# DATA ANALYST NOTEBOOK DOCKERFILE
>This is my Dockerfile for the Docker image of Data Analyst Notebook

## INTRO
I am usually run Jupyter Notebook or Hydrogen in my MacBook Pro. However, sometimes, for a more massive dataset or complex model, I need to use my more powerful desktop or Cloud Service. However, setting up the environment and installing tools and package can be time-consuming, no need to mention the compatibility problems. Luckily, we have Docker! It "containerized" the working environment. For different machines, you can have an identical container. Therefore, you have the same working environment setup, same package, same settings, and same software versions.  If you update one container, you can take a snapshot, push it to the repository, and update the modification to other machines. For more information, you can click [here](https://www.docker.com/why-docker).


## MY DOCKER IMAGE  
**Version 0.2**  

- [ ] FIX windows port problems
- [ ] ADD integrating Jupyter Lab
- [ ] ADD Better user management

**Version 0.1**    
*3-5-2019*  
My docker image based on Ubuntu. It supports Python 3 and R kernel in Jupyter Notebook. With the help of R Magic,  I can run both Python and R in the same .ipynb file.  To learn more about R Magic, you can click [here](https://www.datacamp.com/community/blog/jupyter-notebook-r?utm_source=adwords_ppc&utm_campaignid=1565261270&utm_adgroupid=67750485268&utm_device=c&utm_keyword=&utm_matchtype=b&utm_network=g&utm_adpostion=1t1&utm_creative=295208661496&utm_targetid=dsa-473406574235&utm_loc_interest_ms=&utm_loc_physical_ms=9033309&gclid=EAIaIQobChMIt5Xy39jq4AIVbiCtBh3FdQ4IEAAYASAAEgLEZ_D_BwE).
I also installed Nbextensions for Jupyter Notebook.  For more information, you can click [here](https://github.com/ipython-contrib/jupyter_contrib_nbextensions)



## INSTALL

### Install Docker
The Docker community have an explicit tutorial about how to install Docker. Please check [here](https://www.docker.com/community-edition#/download)





### SETUP PASSWORD

Download or clone my repository.

Before build image, you need to generate a password, to secure the notebook. The following Python code can generate hashed password.

```python
In [1]: from notebook.auth import passwd
In [2]: passwd()
Enter password:
Verify password:
Out[2]: 'sha1:67c9e60bb8b6:9ffede0825894254b2e042ea597d771089e11aed'
```
For more information, please check [here](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html).

After you generate the hashed password, you need copy the string (witout apostrophe ' ' ) into password.txt .


### BUILD ONE BASED ON DOCKERFILE
A Dockerfile basically "tells" docker the way a image build. You can edit it to fit to your daily usages.

In terminal, direct to the folder that contains the dockerfile and run the following command:
```bash
docker build -t data-analyst-notebook .
```
Don't forget the "." at the end. data-analyst-notebook is the name of the image you build.

## START SERVER
For mac and Ubuntu:  
After the installation, You simply run run_docker.sh . In browser, you can go [localhost:8888](http://localhost:8888) to access the Jupyter notebook.
