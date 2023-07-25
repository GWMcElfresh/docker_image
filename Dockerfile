FROM nvcr.io/nvidia/pytorch:22.03-py3

ARG DEBIAN_FRONTEND=noninteractive

#update libraries
RUN apt update && \
    apt install -y git && \
    apt install ffmpeg libsm6 libxext6  -y



#install python libraries
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install pandas && \
    python3 -m pip install numpy && \
    python3 -m pip install tensorflow
#RUN python3 -m pip cache purge
RUN df -h / 
# the torch install is rather large, so this command tries to free up space so that it can install.
RUN apt-get clean
RUN python3 -m pip install torch && \
    python3 -m pip install torchvision && \
    apt-get clean

RUN df -h /
RUN TMPDIR=/var/tmp python3 -m pip install torchaudio
RUN python3 -m pip install git+https://github.com/facebookresearch/segment-anything.git
RUN python3 -m pip install segmenteverygrain
RUN python3 -m pip install tqdm
RUN python3 -m pip install importlib
RUN python3 -m pip install opencv-python
RUN python3 -m pip install nvidia-pyindex
RUN python3 -m pip install nvidia-tensorrt
RUN python3 -m pip install -U scikit-learn
