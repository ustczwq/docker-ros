# Based on ros:kinetic-ros-base-xenial
FROM ros:kinetic-ros-base-xenial

# USTC LUG Ubuntu mirror
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# Install ros-kinetic-desktop
RUN apt-get update && apt-get install -y \
    ros-kinetic-desktop 

# Install Gazebo(7.X for kinetic) step-by-step
## set faster mirrors
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' \
    && apt-get update 

## setup keys
RUN apt-get install -y wget \
    && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

## install Gazebo
RUN apt-get update && apt-get install -y \
    gazebo7 \
    libgazebo7-dev

RUN rm -rf /var/lib/apt/lists/*


