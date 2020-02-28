# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "roboclaw: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iroboclaw:/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(roboclaw_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg" NAME_WE)
add_custom_target(_roboclaw_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roboclaw" "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(roboclaw
  "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roboclaw
)

### Generating Services

### Generating Module File
_generate_module_cpp(roboclaw
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roboclaw
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(roboclaw_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(roboclaw_generate_messages roboclaw_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg" NAME_WE)
add_dependencies(roboclaw_generate_messages_cpp _roboclaw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roboclaw_gencpp)
add_dependencies(roboclaw_gencpp roboclaw_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roboclaw_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(roboclaw
  "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roboclaw
)

### Generating Services

### Generating Module File
_generate_module_eus(roboclaw
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roboclaw
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(roboclaw_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(roboclaw_generate_messages roboclaw_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg" NAME_WE)
add_dependencies(roboclaw_generate_messages_eus _roboclaw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roboclaw_geneus)
add_dependencies(roboclaw_geneus roboclaw_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roboclaw_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(roboclaw
  "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roboclaw
)

### Generating Services

### Generating Module File
_generate_module_lisp(roboclaw
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roboclaw
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(roboclaw_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(roboclaw_generate_messages roboclaw_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg" NAME_WE)
add_dependencies(roboclaw_generate_messages_lisp _roboclaw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roboclaw_genlisp)
add_dependencies(roboclaw_genlisp roboclaw_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roboclaw_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(roboclaw
  "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roboclaw
)

### Generating Services

### Generating Module File
_generate_module_nodejs(roboclaw
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roboclaw
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(roboclaw_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(roboclaw_generate_messages roboclaw_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg" NAME_WE)
add_dependencies(roboclaw_generate_messages_nodejs _roboclaw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roboclaw_gennodejs)
add_dependencies(roboclaw_gennodejs roboclaw_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roboclaw_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(roboclaw
  "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roboclaw
)

### Generating Services

### Generating Module File
_generate_module_py(roboclaw
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roboclaw
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(roboclaw_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(roboclaw_generate_messages roboclaw_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/jetson_ws/src/motor_controller/roboclaw/msg/GpsMyMsg.msg" NAME_WE)
add_dependencies(roboclaw_generate_messages_py _roboclaw_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roboclaw_genpy)
add_dependencies(roboclaw_genpy roboclaw_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roboclaw_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roboclaw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roboclaw
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(roboclaw_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roboclaw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roboclaw
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(roboclaw_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roboclaw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roboclaw
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(roboclaw_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roboclaw)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roboclaw
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(roboclaw_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roboclaw)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roboclaw\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roboclaw
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(roboclaw_generate_messages_py std_msgs_generate_messages_py)
endif()
