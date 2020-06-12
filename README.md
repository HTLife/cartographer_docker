# Cartographer docker


## How to use
```bash
# clone repository with submodules
git clone --recursive https://github.com/HTLife/cartographer_docker

cd cartographer_docker

# Build cartographer (optional)
#   docker build -t tseanliu/docker_env_gui:ubuntu18_melodic_cartographer .

# Pull cartographer docker image from DockerHub
export IMAGE_NAME=tseanliu/docker_env_gui:ubuntu18_melodic_cartographer
export CONTAINER_NAME=cartographer
docker pull $MY_DOCKER_IMG_NAME

cd docker_env_gui
bash init.bash
source setup.bash

# If you have nvidia GPU
drunnvidia
# If you don't have nvidia GPU
drunintel
```
