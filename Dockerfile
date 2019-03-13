# Based on ros:melodic-ros-core-bionic
FROM ros:melodic-ros-core-bionic

# Install ros-melodic-desktop
RUN apt-get update && apt-get install -y \
    ros-melodic-desktop 

# Install gazebo9 step-by-step
## set faster mirrors
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' \
    && apt-get update 

## setup keys
RUN apt-get install -y wget \
    && wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

## install Gazebo
RUN apt-get update && apt-get install -y \
    gazebo9 \
    libgazebo9-dev

RUN rm -rf /var/lib/apt/lists/*
