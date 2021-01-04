# Plan
Use Anaconda3 container, install all the modules currently i use.

Code is using a branch/PR that supports python3.

have container copy over model + dlib library.

then build + test.


## Info about docker-anaconda 3
[Link to dockerhub](https://hub.docker.com/r/continuumio/anaconda3)
Anaconda distribution is installed into the /opt/conda
Ensures that the default user has the conda command in their path.

### If you want install stuff
RUN /opt/conda/bin/conda update -n base -c defaults conda && \
    /opt/conda/bin/conda install python=3.6 && \
    /opt/conda/bin/conda install anaconda-client && \
    /opt/conda/bin/conda install jupyter -y && \
    /opt/conda/bin/conda install --channel https://conda.anaconda.org/menpo opencv3 -y && \
    /opt/conda/bin/conda install numpy pandas scikit-learn matplotlib seaborn pyyaml h5py keras -y && \
    /opt/conda/bin/conda upgrade dask && \
    pip install tensorflow imutils

COPY conf/.jupyter /root/.jupyter
COPY run_jupyter.sh /


## Output list of installed libraries on conda
[Solution Link](https://stackoverflow.com/questions/50777849/from-conda-create-requirements-txt-for-pip3)
Conda is installed in 'pytorchNew' envrionment

### Commands
```
conda activate pytorchNew
conda list -e > requirements.txt
conda create --name <env> --file requirements.txt  # Rebuild Environment

```