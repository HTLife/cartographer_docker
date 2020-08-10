FROM tseanliu/docker_env_gui:ubuntu18_melodic


# for ROS melodic
RUN apt-get update && apt-get install -y \
    libglm-dev \
    libglfw3-dev \
    ros-melodic-geodesy \
    ros-melodic-pcl-ros \
    ros-melodic-nmea-msgs \
    ros-melodic-libg2o

RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws/src

RUN git clone https://github.com/koide3/ndt_omp
RUN git clone https://github.com/koide3/hdl_graph_slam
RUN git clone https://github.com/koide3/odometry_saver
RUN git clone https://github.com/SMRT-AIST/interactive_slam --recursive

WORKDIR /root/catkin_ws/
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_make -DCMAKE_BUILD_TYPE=Release"
