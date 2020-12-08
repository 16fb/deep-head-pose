Personal Commands:

# Run algo on video.
$ python code/test_on_video_dlib.py --snapshot <PATH TO SNAPSHOT> --face_model PATH_OF_DLIB_MODEL --video PATH_OF_VIDEO --output_string STRING_TO_APPEND_TO_OUTPUT --n_frames N_OF_FRAMES_TO_PROCESS --fps FPS_OF_SOURCE_VIDEO

Download models from Google Drive

python code/test_on_video_dlib.py --face_model \models\hopenet_robust_alpha1.pkl --video conan-cruise.gif



# Errors so far.
NO cv2 
-> i running on windows, lemme use conda.