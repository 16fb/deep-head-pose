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

conda install -c anaconda cmake

conda install -c conda-forge dlib    [wtf, need python 2.7/3.4/3.5] [lets try conda-forge]
conda install -c menpo dlib [gives me version problems]
conda install python=3.5


## situation
no module named dlib, and cannot install.
=> still same thing
theres like 5 billion conflicts... wtf

why the fuck do they not say their modules  

## Run Code
python code/test_on_video_dlib.py --snapshot models\hopenet_robust_alpha1.pkl --face_model dlib\mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 100

Use New Model:
python code/test_on_video_dlib.py --snapshot models\mysnap_epoch_29.pkl --face_model dlib\mmod_human_face_detector.dat  --video conan-cruise.gif --fps 15 --n_frames 100

## lets try with different version of python :^)
conda create -n pytorch python=3.5
conda install pytorch torchvision torchaudio cudatoolkit=10.1 -c pytorch
conda install opencv
conda install matplotlib
conda install pandas
conda install scipy
conda install -c anaconda scikit-image
conda install -c anaconda cmake
conda install -c menpo dlib [gives me version problems]


conda install -c conda-forge opencv    [wtf, need python 2.7/3.4/3.5] [lets try conda-forge]
conda install -c conda-forge dlib    [wtf, need python 2.7/3.4/3.5] [lets try conda-forge]
conda install -c menpo dlib [gives me version problems]

## holy fuck will this just work???
conda create -n pytorchNew python pytorch torchvision torchaudio cudatoolkit=10.1 opencv matplotlib pandas scipy scikit-image cmake dlib -c conda-forge -c pytorch



