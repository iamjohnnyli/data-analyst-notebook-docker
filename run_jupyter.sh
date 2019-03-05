#! /bin/bash
key=$(head -n 1 /opt/password.txt)
jupyter notebook --no-browser --allow-root --notebook-dir=/workspace --port=8888 --ip='0.0.0.0' --NotebookApp.password=\'$key\'
