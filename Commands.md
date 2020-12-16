Personal Commands:

# Run algo on video.
$ python code/test_on_video_dlib.py --snapshot <PATH TO SNAPSHOT> --face_model PATH_OF_DLIB_MODEL --video PATH_OF_VIDEO --output_string STRING_TO_APPEND_TO_OUTPUT --n_frames N_OF_FRAMES_TO_PROCESS --fps FPS_OF_SOURCE_VIDEO

Download models from Google Drive

python code/test_on_video_dlib.py --snapshot \models\hopenet_robust_alpha1.pkl --face_model  --video conan-cruise.gif --fps 15 --n_frames 9999



# Run in container::
$ singularity shell --nv pytorch110

Apprently it binds $HOME and not the current directory...

## Try bind Working Dir to 
$ singularity shell -B "$PWD":/PWD --nv pytorch110

## print without parentheses, python error.
Seems to be a python 2 vs python 3 thing. 
(https://www.google.com/search?q=calling+print+without+parentheses+python&rlz=1C1CHBF_enSG788SG788&oq=calling+print+without+parent&aqs=chrome.1.69i57j33i22i29i30l4.5422j0j7&sourceid=chrome&ie=UTF-8)



# Run in ANACONDA
conda activate pytorch
conda install python=2
conda install numpy
conda install matplotlib

## Seems like conda forge has a proper variant for opencv
conda install -c conda-forge opencv
## try install older ver of pytorch
conda install pytorch==1.1.0 torchvision==0.3.0 cudatoolkit=10.0 -c pytorch


# Run ANACONDA Pytorch python3.x
conda create -n pytorch python pytorch opencv   
conda install numpy
conda install matplotlib
conda install pytorch

## testing
conda install torchvision cudatoolkit -c pytorch

## Run this at home
conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch


### Notes
snapshot -> model checkpoint or snapshot (ie. the saved model weights)  [downloadable form readme]
face_model -> path to the bounding box annotations that you have obtained from running dockerface (linked in the README) on the video



## fuck it... it works??
conda create -n pytorch python=3.8
conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
conda install opencv
conda install matplotlib
conda install pandas
conda install scipy
conda install -c anaconda scikit-image
conda install -c conda-forge dlib    [wtf, need python 2.7/3.4/3.5] [lets try conda-forge]

## situation
theres like 5 billion conflicts... wtf


## Error [removed in pytorch 1.0]
no module named 'torch.utils.serialization'


## Different version of pytorch
conda create --name pytorch1.1 python=2.7
conda install pytorch==1.0.1 torchvision==0.2.2 cudatoolkit=10.0 -c pytorch
