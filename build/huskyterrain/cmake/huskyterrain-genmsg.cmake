# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "huskyterrain: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ihuskyterrain:/home/vsung/catkin_ws/src/huskyterrain/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(huskyterrain_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg" NAME_WE)
add_custom_target(_huskyterrain_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "huskyterrain" "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg" "sensor_msgs/PointField:geometry_msgs/Vector3:sensor_msgs/PointCloud2:std_msgs/Header:sensor_msgs/Imu:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg" NAME_WE)
add_custom_target(_huskyterrain_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "huskyterrain" "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg" "sensor_msgs/PointField:sensor_msgs/PointCloud2:std_msgs/Header"
)

get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg" NAME_WE)
add_custom_target(_huskyterrain_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "huskyterrain" "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg" "geometry_msgs/Vector3:sensor_msgs/Imu:std_msgs/Header:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/huskyterrain
)
_generate_msg_cpp(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/huskyterrain
)
_generate_msg_cpp(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/huskyterrain
)

### Generating Services

### Generating Module File
_generate_module_cpp(huskyterrain
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/huskyterrain
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(huskyterrain_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(huskyterrain_generate_messages huskyterrain_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_cpp _huskyterrain_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_cpp _huskyterrain_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_cpp _huskyterrain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(huskyterrain_gencpp)
add_dependencies(huskyterrain_gencpp huskyterrain_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS huskyterrain_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/huskyterrain
)
_generate_msg_lisp(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/huskyterrain
)
_generate_msg_lisp(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/huskyterrain
)

### Generating Services

### Generating Module File
_generate_module_lisp(huskyterrain
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/huskyterrain
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(huskyterrain_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(huskyterrain_generate_messages huskyterrain_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_lisp _huskyterrain_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_lisp _huskyterrain_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_lisp _huskyterrain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(huskyterrain_genlisp)
add_dependencies(huskyterrain_genlisp huskyterrain_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS huskyterrain_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/huskyterrain
)
_generate_msg_py(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/huskyterrain
)
_generate_msg_py(huskyterrain
  "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/huskyterrain
)

### Generating Services

### Generating Module File
_generate_module_py(huskyterrain
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/huskyterrain
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(huskyterrain_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(huskyterrain_generate_messages huskyterrain_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/pcl_polygon.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_py _huskyterrain_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/view_poly.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_py _huskyterrain_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vsung/catkin_ws/src/huskyterrain/msg/imutrans.msg" NAME_WE)
add_dependencies(huskyterrain_generate_messages_py _huskyterrain_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(huskyterrain_genpy)
add_dependencies(huskyterrain_genpy huskyterrain_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS huskyterrain_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/huskyterrain)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/huskyterrain
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(huskyterrain_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(huskyterrain_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(huskyterrain_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/huskyterrain)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/huskyterrain
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(huskyterrain_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(huskyterrain_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(huskyterrain_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/huskyterrain)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/huskyterrain\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/huskyterrain
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(huskyterrain_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(huskyterrain_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(huskyterrain_generate_messages_py geometry_msgs_generate_messages_py)
endif()
