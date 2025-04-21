FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

# this is the hdf5 plugin to decompress and read Maxwell data
# reference source in the neo-python library: https://github.com/NeuralEnsemble/python-neo/blob/c425a529958d582919607a0eb940154a4b5c4d7e/neo/rawio/maxwellrawio.py#L270
# actual (linux) reference source: https://share.mxwbio.com/d/4742248b2e674a85be97/files/?p=%2FLinux%2Flibcompression.so&dl=1
ENV HDF5_PLUGIN_PATH=/usr/local/hdf5/lib/plugin/
RUN mkdir -p ${HDF5_PLUGIN_PATH}
COPY libcompression.so ${HDF5_PLUGIN_PATH}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update --fix-missing && apt-get -y upgrade && apt-get -y install apt-transport-https ca-certificates software-properties-common git time wget nano curl && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get install -y python3 python3-dev python3-venv python3-pip python3.12 python3.12-dev python3.12-venv
RUN pip install awscli
RUN pip install matplotlib torch spikeinterface boto3 kilosort h5py neo pandas numpy

RUN pip install boto3==1.35.95
