# Computer Vision Project Template

This repository provide a template project for computer vision project. The following libraries' installation script or auto-install function is included in this repository.

- OpenCV
- pcl
- spdlog & fmt for logging
- Pangolin

## Auto-install frequently used libraries

### 0. CMake

- Available versions can be checked in [Official Git Repo](https://github.com/Kitware/CMake)

```bash
cd scripts
./install-cmake.sh <local or docker> <target_version>

# example on ubuntu local env. & required version is 3.3.0
# If target_version is greater than 4.x. Change ceres version to 2.x in bash script.
./install-cmake.sh local 3.3.0

```

### 1. OpenCV

- Available versions can be checked in [Official Git Repo](https://github.com/opencv/opencv)
- If you are researcher and unfamiliar with c++ and cmake, your perpose may be quick library installation and open-source evaluation. Then, just install ROS noetic or ROS melodic and use default opencv version included in ros.

```bash
cd scripts
./install-opencv.sh <local or docker> <target_version>

# example on ubuntu local env. & required version is 3.3.0
# If target_version is greater than 4.x. Change ceres version to 2.x in bash script.
./install-opencv.sh local 3.3.0

```

### 2. pcl

- updated soon
