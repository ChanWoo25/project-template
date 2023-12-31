cmake_minimum_required(VERSION 3.11)

set(PACKAGE_NAME CV_PROJECT_TEMPLATE)
set(PACKAGE_VERSION 1.1.0)

project(${PACKAGE_NAME} VERSION ${PACKAGE_VERSION}
                        LANGUAGES CXX
                        DESCRIPTION "This project is for ~~")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
# This is for clangd intelligence
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "" FORCE)
set(CMAKE_BUILD_TYPE "Release")

set(${PACKAGE_NAME}_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(${PACKAGE_NAME}_SOURCE_PATH "${${PACKAGE_NAME}_PATH}/src")
set(${PACKAGE_NAME}_INCLUDE_PATH "${${PACKAGE_NAME}_PATH}/include")
set(${PACKAGE_NAME}_TEST_PATH "${${PACKAGE_NAME}_PATH}/test")
set(${PACKAGE_NAME}_RESOURCE_PATH "${${PACKAGE_NAME}_PATH}/resource")
set(${PACKAGE_NAME}_MODULE_PATH "${${PACKAGE_NAME}_PATH}/module")
set(${PACKAGE_NAME}_THIRDPARTY_PATH "${${PACKAGE_NAME}_PATH}/thirdparty")

add_subdirectory(${${PACKAGE_NAME}_THIRDPARTY_PATH})
add_subdirectory(${${PACKAGE_NAME}_MODULE_PATH})

## Find OpenCV
find_package(OpenCV 4.2 REQUIRED)
if(OpenCV_FOUND)
  message(STATUS "OPENCV_VERSION: ${OpenCV_VERSION}")
  message(STATUS "OPENCV_INCLUDE_DIRS: ${OpenCV_INCLUDE_DIRS}")
  # message(STATUS "Found OpenCV libraries is ${OpenCV_LIBS}")
endif()

find_package(PkgConfig REQUIRED)

pkg_check_modules(GLOG REQUIRED libglog)
if (GLOG_FOUND)
  message(STATUS "Found glog.")
  message(STATUS "* Version: ${GLOG_VERSION}")
  message(STATUS "* Libs: ${GLOG_LIBRARIES}")
  message(STATUS "* Ex: target_link_libraries(example PRIVATE glog::glog)")
endif()

pkg_check_modules(GFLAGS REQUIRED gflags)
if (GFLAGS_FOUND)
  message(STATUS "Found gflags.")
  message(STATUS "GFLAGS_VERSION: ${GFLAGS_VERSION}")
  message(STATUS "* Version: ${GFLAGS_VERSION}")
  message(STATUS "* Libs: ${GFLAGS_LIBRARIES}")
endif()

pkg_check_modules(EIGEN3 REQUIRED eigen3)
if (EIGEN3_FOUND)
  message(STATUS "Found eigen3.")
  message(STATUS "* Version: ${EIGEN3_VERSION}")
  message(STATUS "* Header: ${EIGEN3_INCLUDE_DIRS}")
  message(STATUS "* Tip: Just target_include_directories(example $<EIGEN3_INCLUDE_DIRS> )")
endif()

set(spdlog_DIR ${CMAKE_BINARY_DIR}/thirdparty/spdlog/install/${CMAKE_BUILD_TYPE}/lib/cmake/spdlog)
message(STATUS "spdlog_DIR: ${spdlog_DIR}")
find_package(spdlog REQUIRED PATHS ${spdlog_DIR})

add_executable(MAIN src/main.cpp)
target_link_libraries(MAIN
  CMAKE_GROUND_EXAMPLE
  glog
  gflags
  spdlog::spdlog
)
target_compile_options(MAIN PRIVATE
  -Wall -Wextra -Wpedantic -Werror
)
