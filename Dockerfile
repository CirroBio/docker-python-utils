FROM public.ecr.aws/ubuntu/ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
	apt install -y build-essential hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	apt install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev liblzma-dev && \
	apt install -y python3 python3-pip tcl

ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt && \
	python3 -m pip install spatialdata && \
	python3 -m pip install "spatialdata[extra]" && \
	python3 -c "from spatialdata.models import ShapesModel"
