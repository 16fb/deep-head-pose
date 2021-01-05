## From Anaconda3 (https://hub.docker.com/r/continuumio/anaconda3)
## Prepares conda environment for running deep-head-pose. 
## Need to manually activate environment once shell in
## Does not auto start/run, is meant for envrionment setup.

### Anaconda3 Container amd64
FROM continuumio/anaconda3:latest

ARG ENVIRONMENTNAME=pytorch
ARG DLIBPATH=dlib\mmod_human_face_detector.dat
ARG MODELPATH=models\hopenet_robust_alpha1.pkl
### Ensure env file is named "requirements.txt"
ARG requirementsPATH=requirements.txt

WORKDIR /home/deep-head-pose

### Install Anaconda + Libraries
RUN conda create -n ${ENVIRONMENTNAME} python pytorch torchvision torchaudio cudatoolkit=10.1 opencv matplotlib pandas scipy scikit-image cmake dlib -c conda-forge -c pytorch

### Additional library needed
RUN apt update && \
    apt install -y libgl1-mesa-glx

### Copy Rest of Code to respective directories
COPY . .

### Finished