# chin_arm
MoveIt config package for arm Chin

Currently only CRB-7 is constructed. With further projects related to other models like 4 and 12 are proceeded, they woubld be integrated either

![chin_crb_7](https://user-images.githubusercontent.com/72239958/219651981-627b9100-2daa-47d1-b5ec-32d2eb57460c.png)


This package includes arm's description defined by URDF, and moveit_config environment:
![chin_description](https://user-images.githubusercontent.com/72239958/219312265-73d45d7f-fae2-4bc7-9363-23ba745fddfa.gif)

![chin_moveit](https://user-images.githubusercontent.com/72239958/219311389-f6b9a315-4da6-4bfe-93ba-fe919573c1b6.gif)

## Setup
Go into your catkin workspace and initialize wstool if necessary:
```
cd <your_workspace>/src
git clone https://github.com/xinjuezou-whi/chin_arm.git
```

Then build the workspace:
```
catkin build
```

And do not forget to source the bash:
```
source <your_workspace>/devel/step.bash
```

## Usage
### View the URDF
Running the urdf.launch to view the arm's description and TF relation: 
```
cd <your_workspace>
roslaunch chin_crb7_description urdf.launch
```
![image](https://user-images.githubusercontent.com/72239958/219314281-e5eea179-324c-47e2-be29-86b7e4816b74.png)

### Interacting with the visualized arm
Running the demo.launch
```
cd <your_workspace>
roslaunch chin_crb7_moveit_config demo.launch
```
Once the visualized arm shows up, there should be two interactive markers. One marker corresponding to the orange colored arm will be used to set the "Goal State" for motion planning and the other marker corresponding to a green colored arm are used to set the "Start State" for motion planning.

Use these markers to drag the arm around and change its orientation. While the TCP meets your expectation, click button "Plan" to check the planning result
![image](https://user-images.githubusercontent.com/72239958/219316323-0cf5cb68-21c7-46e3-ac51-96a3712a1c1b.png)

For how to use the MoveIt planning, please refer to the [tutorial of MoveIt](https://ros-planning.github.io/moveit_tutorials/doc/quickstart_in_rviz/quickstart_in_rviz_tutorial.html)

### Control the real arm
Please note that the controller interface is required for controlling the real arm. This package doesn't include the controller interface. But this package do leaves the bringup launch file and controller configuration file for the real controller. For real controller, the "moveit_controller_manager" is named as "chin_arm" with type "FollowJointTrajectory", and the controller is named as "chin_arm/controllers/position". If you are going to build your own real controller, please refer to such two files for synchronizing the type and name

The following video demonstrates the real arm control of Chin with WHI's controller interface:
![chin_real_arm](https://user-images.githubusercontent.com/72239958/219322441-8f9dced2-a9ee-40ef-82f2-4eb5001caff8.gif)

## Configure arm
By default, this package sets two fixed positions: home and ready, which can be used as the goal state for planning. Besides the fixed position, there are more settings MoveIt can make with the tool: "[MoveIt Setup Assistant](https://ros-planning.github.io/moveit_tutorials/doc/setup_assistant/setup_assistant_tutorial.html)"

Running the setup_assistant.launch
```
cd <your_workspace>
roslaunch chin_crb7_moveit_config setup_assistant.launch
```
and click button "Load Files", then you can re-configure the arm:
![image](https://user-images.githubusercontent.com/72239958/219829869-d83c8cfb-f34f-452f-a7a8-542d7913a77e.png)

Or, running the MoveIt Setup Assistant directly with following command:
```
roslaunch moveit_setup_assistant setup_assistant.launch
```
then click button "Edit Existing MoveIt ", and click button "Browse" to select the folder "chin_moveit_config"
