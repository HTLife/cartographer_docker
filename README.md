# Cartographer docker


## How to use
### Env setup
```bash
# clone repository with submodules
git clone --recursive https://github.com/HTLife/cartographer_docker

cd cartographer_docker

# Build cartographer (optional)
#   docker build -t tseanliu/docker_env_gui:ubuntu18_melodic_cartographer .

# Pull cartographer docker image from DockerHub
export IMAGE_NAME=tseanliu/docker_env_gui:ubuntu18_melodic_cartographer
export CONTAINER_NAME=cartographer
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

### Run demo
```bash
# Download sample dataset
# official site: https://google-cartographer-ros.readthedocs.io/en/latest/demos.html
apt-get install -y wget
wget -P ~/Downloads https://storage.googleapis.com/cartographer-public-data/bags/backpack_2d/cartographer_paper_deutsches_museum.bag

source devel_isolated/setup.bash

roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=${HOME}/Downloads/cartographer_paper_deutsches_museum.bag
# If you see the error message like
# QXcbConnection: XCB error: 2 (BadValue), sequence: 7859, resource id: 1920, major code: 130 (Unknown), minor code: 3
# Just drag the rviz window, or resize it.  The error message will disapear.
```
