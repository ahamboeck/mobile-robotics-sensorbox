#!/bin/bash
# Source ros and python3 components
source ~/myenv/bin/activate
source /opt/ros/$ROS_DISTRO/setup.bash
#TODO: switchable ws source
source $ROS2_WS/install/local_setup.bash
#export TURTLEBOT3_MODEL=burger
 
# Start jupyterlab
export JUPYTER_ENABLE_LAB=yes
export JUPYTER_TOKEN=docker
apt-get update && apt-get install -y --no-install-recommends --fix-missing && apt-get install -y ros-humble-rmw-cyclonedds-cpp
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
#jupyter-lab --ip 0.0.0.0 -IdentityProvider.token='ros_ml_container' --no-browser --allow-root &
 
# Start rosbridge server in the background for foxglove connection
# ros2 launch rosbridge_server rosbridge_websocket_launch.xml &
 
# OAK UDEV rules
# echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="03e7", MODE="0666"' | tee /etc/udev/rules.d/80-movidius.rules
# udevadm control --reload-rules && udevadm trigger
 
exec "$@"