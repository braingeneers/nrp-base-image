# NRP Base Image

Intended to be a container build for the [National Research Platform (NRP)](https://nrp.ai/documentation/) with some basic tools installed for:
 - s3 access
 - CUDA compatible with NRP GPUs (CUDA version 12.4.1 currently)
 - Ubuntu (22.04) + some basic apt packages
 - Python (v3.12) + some basic pip packages
 - a Maxwell plugin allowing the python neo package to open compressed Maxwell files

### Using the container on the NRP

To launch this container as a basic Job, run the example kubernetes yaml file with:

    kubectl apply -f run.yaml

### Building and Publishing the Container

To build this container, login to quay.io to host the docker image in quay:

	docker login quay.io

To build the image:

	docker build . -t quay.io/ucsc_cgl/nrp:12.4.1cudnn-runtime-ubuntu22.04

To push the image:

	docker push quay.io/ucsc_cgl/nrp:12.4.1cudnn-runtime-ubuntu22.04
