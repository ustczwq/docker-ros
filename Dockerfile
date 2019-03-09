# ros-kenetic-desktop-full
FROM osrf/ros:kinetic-desktop-full-xenial

# GraspIt! dependencies
RUN apt-get update && apt-get install -y \
    libqt4-dev \
    libqt4-opengl-dev \
    libqt4-sql-psql \
    libcoin80-dev \
    libsoqt4-dev \
    libblas-dev \
    liblapack-dev \
    libqhull-dev \
    libeigen3-dev

# GraspIt! Download
RUN git clone https://github.com/graspit-simulator/graspit.git

# Graspit! Build
RUN cd graspit \
    && export GRASPIT=$PWD \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j5
    
RUN rm -rf /var/lib/apt/lists/*
