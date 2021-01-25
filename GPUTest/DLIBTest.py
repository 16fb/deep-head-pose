import dlib

print(dlib.DLIB_USE_CUDA)

import dlib.cuda as cuda

print(cuda.get_num_devices())