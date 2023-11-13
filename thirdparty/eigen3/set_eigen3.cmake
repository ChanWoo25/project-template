message(STATUS "Start configuration for EIGEN3.")

set(GTEST_INSTALL_PATH ${CMAKE_BINARY_DIR}/thirdparty/EIGEN3/install/${CMAKE_BUILD_TYPE})

find_package(EIGEN3 QUIET HINTS ${GTEST_INSTALL_PATH}/lib/cmake/EIGEN3)
message(STATUS ${GTEST_INSTALL_PATH})
if(GTest_FOUND)
  message(STATUS "Found EIGEN3.")
else()
  message(STATUS "Not found EIGEN3! Using ExternalProject.")
  ExternalProject_Add(
    EIGEN3
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.1
    PREFIX ${CMAKE_BINARY_DIR}/EIGEN3-prefix
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/install/${CMAKE_BUILD_TYPE}
  )
endif()

message(STATUS "Finish configuration for EIGEN3.\n")
