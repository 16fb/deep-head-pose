# Plan
* Use Anaconda3 container, install all the modules currently i use.

* Code is using a branch/PR that supports python3.

* have container copy over model + dlib library.

* then build + test.


## Info about docker-anaconda 3
[Link to dockerhub](https://hub.docker.com/r/continuumio/anaconda3)   \
Anaconda distribution is installed into the /opt/conda    \
Ensures that the default user has the conda command in their path.

## Output list of installed libraries on conda
[Solution Link](https://stackoverflow.com/questions/50777849/from-conda-create-requirements-txt-for-pip3)
Conda is installed in 'pytorchNew' envrionment

### Commands
```
conda activate pytorchNew
conda list -e > requirements.txt
conda create --name <env> --file requirements.txt  # Rebuild Environment
```
## Error/Problems
**Problem**: Anaconda Environment is for windows.
Will have error porting over to Linux.

**Solution**: Install as conda create <stuff>
Dont use conda env file.

**Problem**: Apparently Cannot Import???
ImportError: libGL.so.1: cannot open shared object file: No such file or directory

**Solution**: (error is some problem with conda-forge) 
[Issue Mentioned Here](https://github.com/conda-forge/pygridgen-feedstock/issues/10)
apt update
apt install libgl1-mesa-glx

**Problem**: Might not be able to activate
[Issue Mentioned Here](https://pythonspeed.com/articles/activate-conda-dockerfile/)

**Solution**:
Just ignore, manually conda activate

**Problem**: Some kind of GPU Error.
raise RuntimeError('Attempting to deserialize object on a CUDA '
RuntimeError: Attempting to deserialize object on a CUDA device but torch.cuda.is_available() is False. If you are running on a CPU-only machine, please use torch.load with map_location=torch.device('cpu') to map your storages to the CPU.
[Issue Mentioned Here](https://stackoverflow.com/questions/56369030/runtimeerror-attempting-to-deserialize-object-on-a-cuda-device)
-> seems to be assuming the machine is non CUDA capable

Test Nvidia Drivers
`nvidia-smi`

Testing on windows:
[Issue Mentioned Here](https://stackoverflow.com/questions/57100015/how-do-i-run-nvidia-smi-on-windows)
-> Seems like sometimes nvidia-smi not on $PATH
-> PATH on my windows 
-> C:\Program Files\NVIDIA Corporation\NVSMI\nvidia-smi.exe
-> Imma just add to $PATH

Getting Nvidia Drivers in Linux Container:
[Blog with guide](https://towardsdatascience.com/how-to-properly-use-the-gpu-within-a-docker-container-4c699c78c6d1)
Download + Use Nvidia Container Toolkit to use GPU in container

Theres talks thats docker with WSL2 integration cannot run with GPU.
[Mentioned Here](https://github.com/docker/for-win/issues/7581)
-> Before full support comes, should i just use WSL1????
-> Should WSL2 even matter???? iam running on windows powershell

Apparently preview builds have WSL2 with Nvidia support on windows
[Mentioned Here](https://www.docker.com/blog/wsl-2-gpu-support-is-here/)
-> Can do, but seems experimental.

More Info about docker support
(https://stackoverflow.com/questions/49589229/is-gpu-pass-through-possible-with-docker-for-windows#:~:text=Update%20(October%202019)%3A%20nvidia,but%20not%20a%20Linux%20container.)

**Solution**:
* A) Wait for full release of Windows GPU support
* B) Use Preview Build
* C) Run on Alienware Laptop


**Problem**: 
Pytorch Version auto finds CPU only variant of pytorch

**Solution**: 
Create conda environment with only pytorch dependacies.  \
Then conda install the rest separately.

## Build + Push Container
```
docker build -t 16fb/deepheadpose:GPU .
docker push 16fb/deepheadpose:GPU
```
### Testing Container
```
### Run interactively and expose GPU
docker run -it --gpus all 16fb/deepheadpose:GPU

conda activate pytorch

### I assume use "/" because its Linux fs
python code/test_on_video_dlib.py --snapshot models/hopenet_robust_alpha1.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 10

**Use New Model:**
python code/test_on_video_dlib.py --snapshot models/mysnap_epoch_29.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 100

```

## Import + Export Image to .tar file
Theres no progress bar:

Save to tar file
* `docker save --output <FileName> <ImageName>`
* `docker save --output deepheadpose 16fb/deepheadpose:latest`

Load from tar file
* `docker load --input <FileName>`
* `docker load --input deepheadpose`
