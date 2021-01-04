## From Anaconda3 (https://hub.docker.com/r/continuumio/anaconda3)

### Anaconda3 Container amd64
FROM continuumio/anaconda3:latest

ARG ENVIRONMENTNAME=pytorch
ARG DLIBPATH=dlib\mmod_human_face_detector.dat
ARG MODELPATH=models\hopenet_robust_alpha1.pkl
### Ensure env file is named "requirements.txt"
ARG requirementsPATH=requirements.txt

WORKDIR /home/deep-head-pose

### Install Anaconda + Libraries
COPY requirementsPATH *
RUN conda create --name ENVIRONMENTNAME --file requirements.txt && \
    conda activate ENVIRONMENTNAME

### Copy Rest of Code to respective directories
COPY * *

### Finished