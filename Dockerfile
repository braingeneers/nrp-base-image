FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV HDF5_PLUGIN_PATH=/usr/local/hdf5/lib/plugin/

RUN apt-get -y update --fix-missing && apt-get -y upgrade && apt-get -y install apt-transport-https ca-certificates software-properties-common git time wget nano curl && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get install -y python3 python3-dev python3-venv python3-pip python3.12 python3.12-dev python3.12-venv
RUN pip install awscli
RUN pip install matplotlib torch spikeinterface boto3 kilosort h5py neo pandas numpy

# this is the hdf5 plugin to decompress and read Maxwell data
RUN mkdir -p /usr/local/hdf5/lib/plugin/
COPY libcompression.so /usr/local/hdf5/lib/plugin/libcompression.so

RUN pip install boto3==1.35.95
