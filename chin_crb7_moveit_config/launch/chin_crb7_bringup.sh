#!/bin/bash
cd /home/whi/catkin_workspace/
source /opt/ros/melodic/setup.bash
source /home/whi/catkin_workspace/devel/setup.bash
echo "launching application, please wait..."
roslaunch chin_crb7_moveit_config chin_crb7_moveit_bringup.launch
