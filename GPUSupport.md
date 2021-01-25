# AIM
Enable GPU support for deep-head-pose
* Add DLib support for CUDA
* Add openCV head detection instead for deep-head-pose

### Test DLIB supports CUDA
[in conda pytorchNew]
`python DLIBTest.py`

### How enable GPU support for dlib
`conda install dlib` -> CPU version, doesnt support CUDA  
[Guide to compile from source](https://www.programmersought.com/article/3178189876/)
[Official Documentation](http://dlib.net/compile.html)
Apparently ZX uninstall and reinstall, will install GPU version
-> its written that on pip install, it will detect + test
Using [conda pytorchNew] and pip3

conda remove dlib
pip3 uninstall dlib

ENSURE YOUR COMPUTER HAS CUDA TOOL KIT INSTALLED: AND CuDNN if can:
pip3 install dlib --verbose


### What is
Pybind11 -> python bindings to C++ 11
dlib -> Dlib is a modern C++ toolkit containing machine learning algorithms and tools for creating complex software in C++ to solve real world problems.
.pkl -> serialised pickle file, dumped using python's `pickle` module
face_recognition library -> https://pypi.org/project/face-recognition/ , face recog lib/model based on dlib
gcc -> GNU Compiler Collections, used to compile many C and C++ langs, 
-> The different options of GCC command allow the user to stop the compilation process at different stages.
g++ -> GNU c++ compiler invocation command, which is used for preprocessing, compilation, assembly and linking of source code to generate an executable file

### How does conda and pip mesh

[Follow this solution maybe?](https://stackoverflow.com/questions/59350831/installing-dlib-with-python-3-8-windows-10-error)

## Situation
[Hopefully this guy know how solve](https://medium.com/analytics-vidhya/how-to-install-dlib-library-for-python-in-windows-10-57348ba1117f)
pip3 install cmake
Add Cmake [D:\CMake\bin] to PATH
Lemme install visual studio 2019 community
conda activate ZX [works LMAO]

pip3 install dlib --verbose
pip3 install face_recognition

conda install scikit-image

python GPUTest/DLIBTest.py

python code/i_webcam.py --snapshot models/mysnap_epoch_29.pkl --face_model dlib/mmod_human_face_detector.dat  --video conan-cruise.gif --fps 24
 --n_frames 100

## Conclusion
IT WORKS, IT LIVES!

for some reason my screen doesnt want to output, however i know it works
Cmake for OpenCV so OpenCV works with CUDA