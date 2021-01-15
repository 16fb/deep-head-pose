# Introduction
## How Container Built
* Use Base Anaconda3 image, install all the modules currently in use.

* Code is using a branch/PR that supports python3.

* Image copy overs dlib model + snapshot

* Copy over code and implementations


## Info about docker-anaconda 3
[Link to dockerhub](https://hub.docker.com/r/continuumio/anaconda3)   \
Anaconda distribution is installed into the /opt/conda    \
Ensures that the default user has the conda command in their path.

## List installed packages in Conda
[Solution Link](https://stackoverflow.com/questions/50777849/from-conda-create-requirements-txt-for-pip3)
Conda is installed in 'pytorchNew' envrionment

### Commands
```
conda activate pytorchNew
conda list -e > requirements.txt
conda create --name <env> --file requirements.txt  # Rebuild Environment
```

## Build + Push Container
```
docker build -t 16fb/deepheadpose:ZX .
docker push 16fb/deepheadpose:ZX

## Naming Conventions:
:GPU -> GPU Variant
:ZX -> ZX Variant with his code
```
## Testing Container
### Run Container
* `--gpus all` to enable GPU
* `-it` run interactively
* `-v` mount new video to container
* `conda activate pytorch` activate anaconda envrionment
```
docker run -it --gpus all -v ${PWD}/toMount:/home/deep-head-pose/mount 16fb/deepheadpose:GPU

conda activate pytorch
```
### Run using old model
Use  I assume use "/" because its Linux fs

```
python code/test_on_video_dlib.py --snapshot models/hopenet_robust_alpha1.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 10
```

### **Use New Model:**
```
python code/test_on_video_dlib.py --snapshot models/mysnap_epoch_29.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 100
```

### **Use New Model:** On new mounted Video:
```
python code/test_on_video_dlib.py --snapshot models/mysnap_epoch_29.pkl --face_model dlib/mmod_human_face_detector.dat  --video mount/Kamala.gif --fps 15 --n_frames 100

```

## How to run on different image
Ideally using bind mounts:   \
`-v <Source Directory>:<Container Directory>`   \
Place .gif into "toMount" directory, then bind mount into container as "mount/".    \
-> Reference the new gif for data.
### Bind /toMount directory to WORKDIR/mount
So files can be read and written to and from Host  \
`-v /toMount:/home/deep-head-pose/mount`

### Extract final output from container to host directory
Copy the output video directory into mount/video  \
`cp -r /home/deep-head-pose/output/video /home/deep-head-pose/mount/video`

## Import + Export Image to .tar file
Theres no progress bar:

Save to tar file
* `docker save --output <FileName> <ImageName>`
* `docker save --output deepheadpose 16fb/deepheadpose:latest`
docker save --output deepheadpose 16fb/deepheadpose:ZX

Load from tar file
* `docker load --input <FileName>`
* `docker load --input deepheadpose`

# Testing without docker
## Testing base video deep-head-pose
`conda activate pytorchNew`  
`python code/test_on_video_dlib.py --snapshot models/mysnap_epoch_29.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 100`  
 
Notes:  
Its quite slow for video

## Testing ZX Video deep-head-pose
`conda activate pytorchNew`  
`python code/i.py --snapshot models/mysnap_epoch_29.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 100`  

Notes:  
Had to set face model to take in from args.  
Still quite slow.  
It does show obtained tensors.  

## Testing ZX Webcam deep-head-pose
`conda activate pytorchNew`  
`python code/i_webcam.py --snapshot models/mysnap_epoch_29.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 100`  

Notes:  
Very Very Very Slow.  

**Removed the wait key at the end of i_webcam.py.**   
no dice.
## CUDNN INSTALL
