# Dynamics and Kinematics of a Delta Robot 3df whit ROS and ADAMS :robot:

<!-- TABLE OF CONTENTS -->
1. [ Contact. ](#conta)
2. [ Simulation Video. ](#video)
3. [ Abstract. ](#abstra)
4. [ Model Robot Delta & Parameter](#param)
5. [ Workflow](#workf)
6. [ Result ROS Vizualization](#r-rviz)
7. [ List of simulated linear trajectories](#list)   
8. [ Results simulation of linear trajectories](#r-tray)
9. [ Result Workspace](#r-ws)
10. [ Robot Operating System](#ros)
11. [ ADAMS](#adam)  
12. [ Model URDF Robot](#urdf)

<!-- CONTACT -->
<a name="conta"></a>
## Contact
Ivan Alejandro Fernandez Gracia  
:email: ivan.fernandez.g@usach.cl  
:telephone_receiver: +56-961214718  
Mechanical Engineering  
Universidad de Santiago de Chile

<!-- Video -->
## Download
Thesis     | Presentation Thesis     |  
|------------|-------------|
| [Download this](https://drive.google.com/file/d/1C1dIYmat_XPeWaqNDiFfhNDwciYDb_Ky/view)|[Download this](https://drive.google.com/file/d/15Y9GF4CDcAfzHqggWp32iq0D9XzM5kud/view)|
 |<img align="center" src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/portada.png" width="100%">|<img  align="center" src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/pres_tesis_2.png" width="100%"> |

<!-- Video -->
<a name="video"></a>
## Simulation Video
https://user-images.githubusercontent.com/48660555/120602243-d95de280-c418-11eb-801e-9b2eb469a63e.mp4


<!-- Resumen -->
<a name="abstra"></a>
## Abstract
This thesis describes, creates and validates the kinematic and dynamic modeling of a delta-type parallel robot with 3 degrees of freedom.  
In recent years, the use of kinematics in conjunction with dynamics for the control of parallel robots has been gaining popularity. The use of parallel robots dedicated to 'pick and place' operations opened a series of new perspectives in the domain of fast and precise handling of light objects. These are used in various areas in industry, such as agronomy, manufacturing, pharmaceutical laboratories, etc.  
The problems that are identified about the delta robot and that are solved in this thesis are mainly: robotic systems manage a great complexity, different for each task to be performed and this results in slowness and high costs in the development and implementation of robotics worldwide; robot control schemes based only on position kinematics are not enough for excellent precision and the difficulty of establishing a simple dynamic model that can be easily calculated in real time. Therefore, this work proposes the use of a free middleware oriented to the reuse of code and control of robots; two methods for kinematic and dynamic modeling; workspace where the robot executes tasks; 3D visualization of mechanical parts; trajectory simulation to check the methods and validation of the models by means of educational simulation software.  
The results show that the kinematic and dynamic modeling of the two methods give identical values and is valid according to the simulation software. The negligible differences between the results of the models and the simulation software are due to the fact that the latter only approximates the model, in other words, it is not totally identical to the model.

<!-- Model Robot delta & Parameter -->
<a name="param"></a>
## Model Robot Delta & Parameter
<p align="center">
  <img align="center" width="75%"  src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/model_robot_delta.png?raw=true">
</p>

<!-- Dynamic Theory -->
<a name="dyna"></a>
## Dynamic Theory

Lagrangian | Virtual Work  |
|------------|-------------|
| <img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/dynamic_2.png?raw=true" width="100%"> | <img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/dynamic_3.png?raw=true" width="100%"> |



<!-- Wokflow -->
<a name="workf"></a>
## Wokflow
<p align="center">
  <img align="center" width="75%" src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/workflow_3.png">
  <img align="center" width="75%" src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/workflow.png">
</p>

<!-- R ros V -->
<a name="r-rviz"></a>
## Result ROS Vizualization
Links     | Joint     |
|------------|-------------|
| <img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/rviz_robot_delta_2.png?raw=true" width="100%"> | <img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/rviz_robot_delta_3.png?raw=true" width="100%"> |


<!-- R worksap -->
<a name="r-ws"></a>
## Result Workspace
 Workspace with restrictions angles (colors) & jacobian (green) |
|-------|
|<img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/workspace_resume_1.png" width="100%">|  

 Workspace with all restrictions (red) |
|-------|
|<img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/workspace_resume_2.png" width="100%">|  

<!-- list tray -->
<a name="list"></a>
## List of simulated linear trajectories
<p align="center">
  <img align="center" width="75%" src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/tray_1_8.png">
</p>


<!-- R simu tray -->
<a name="r-tray"></a>
## Results simulation of linear trajectories
 Linear trajectories number 7 (Low) |
|-------|
|<img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/tray_low_7.png" width="100%">|  

 Linear trajectories number 3 (Speed)  |
|-------|
|<img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/tray_speed_3.png" width="100%">|  

<!-- ROS -->
<a name="ros"></a>
## Robot Operating System
<p align="center">
  <img align="center" width="75%"  src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/catkin_make.png">
</p>

<!-- ADAMS -->
<a name="adam"></a>
## ADAMS
View Adams    | View Adams      |
|------------|-------------|
<img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/adams_joint.png" width="100%">     | <img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/adams_view_isometric.png" width="100%">       |
<img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/adams_view_front.png" width="100%">     | <img src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/adams_view_Up.png" width="100%">       |

<!-- URDF -->
<a name="urdf"></a>
## Model URDF Robot Delta
<p align="center">
  <img align="center" width="75%"  src="https://github.com/IvanFernandezGracia/delta_robot_tesis/blob/main/Readme%20File/rviz_robot_delta_5.png">
</p>

