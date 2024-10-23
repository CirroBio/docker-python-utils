FROM python:3.12

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
	apt install -y build-essential hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	apt install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev liblzma-dev && \
	apt install -y tcl cmake

ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt && \
	python3 -m pip install spatialdata==0.2.3 && \
	python3 -c "from spatialdata.models import ShapesModel"
