execute_process(COMMAND "/home/vsung/catkin_ws/build/lab2/catkin_ws/src/adafruit_drivers/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/vsung/catkin_ws/build/lab2/catkin_ws/src/adafruit_drivers/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
