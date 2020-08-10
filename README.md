# Interactive slam docker


## How to use

### Prerequisites

1. docker: https://docs.docker.com/engine/install/ubuntu/
2. nvidia-docker (if you have nvidia GPU): https://github.com/NVIDIA/nvidia-docker

### Env setup
```bash
# clone repository with submodules
git clone --recursive https://github.com/HTLife/interactive_slam_docker

cd interactive_slam_docker

# Build cartographer (optional)
#   docker build -t tseanliu/docker_env_gui:ubuntu18_melodic_cartographer .

# Pull cartographer docker image from DockerHub
export IMAGE_NAME=tseanliu/docker_env_gui:ubuntu18_melodic_interactive_slam
export CONTAINER_NAME=interactive_slam
docker pull $IMAGE_NAME

cd docker_env_gui
bash init.bash
source setup.bash

# If you have nvidia GPU
drunnvidia $CONTAINER_NAME
# If you don't have nvidia GPU
drunintel $CONTAINER_NAME

dexec $CONTAINER_NAME
# Test whether the x11 gui is working or not.  If success, you will see the spinning gear window popup.
glxgears
```

### Launch GUI
```bash
source devel/setup.bash
rosrun interactive_slam interactive_slam
```
