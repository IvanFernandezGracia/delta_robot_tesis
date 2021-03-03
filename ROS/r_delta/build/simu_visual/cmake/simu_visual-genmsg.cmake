# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "simu_visual: 3 messages, 0 services")

set(MSG_I_FLAGS "-Isimu_visual:/home/ivan/r_delta/src/simu_visual/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(simu_visual_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg" NAME_WE)
add_custom_target(_simu_visual_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "simu_visual" "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg" ""
)

get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg" NAME_WE)
add_custom_target(_simu_visual_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "simu_visual" "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg" ""
)

get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg" NAME_WE)
add_custom_target(_simu_visual_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "simu_visual" "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simu_visual
)
_generate_msg_cpp(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simu_visual
)
_generate_msg_cpp(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simu_visual
)

### Generating Services

### Generating Module File
_generate_module_cpp(simu_visual
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simu_visual
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(simu_visual_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(simu_visual_generate_messages simu_visual_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_cpp _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_cpp _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_cpp _simu_visual_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(simu_visual_gencpp)
add_dependencies(simu_visual_gencpp simu_visual_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS simu_visual_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/simu_visual
)
_generate_msg_eus(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/simu_visual
)
_generate_msg_eus(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/simu_visual
)

### Generating Services

### Generating Module File
_generate_module_eus(simu_visual
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/simu_visual
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(simu_visual_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(simu_visual_generate_messages simu_visual_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_eus _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_eus _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_eus _simu_visual_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(simu_visual_geneus)
add_dependencies(simu_visual_geneus simu_visual_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS simu_visual_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/simu_visual
)
_generate_msg_lisp(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/simu_visual
)
_generate_msg_lisp(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/simu_visual
)

### Generating Services

### Generating Module File
_generate_module_lisp(simu_visual
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/simu_visual
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(simu_visual_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(simu_visual_generate_messages simu_visual_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_lisp _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_lisp _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_lisp _simu_visual_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(simu_visual_genlisp)
add_dependencies(simu_visual_genlisp simu_visual_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS simu_visual_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/simu_visual
)
_generate_msg_nodejs(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/simu_visual
)
_generate_msg_nodejs(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/simu_visual
)

### Generating Services

### Generating Module File
_generate_module_nodejs(simu_visual
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/simu_visual
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(simu_visual_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(simu_visual_generate_messages simu_visual_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_nodejs _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_nodejs _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_nodejs _simu_visual_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(simu_visual_gennodejs)
add_dependencies(simu_visual_gennodejs simu_visual_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS simu_visual_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simu_visual
)
_generate_msg_py(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simu_visual
)
_generate_msg_py(simu_visual
  "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simu_visual
)

### Generating Services

### Generating Module File
_generate_module_py(simu_visual
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simu_visual
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(simu_visual_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(simu_visual_generate_messages simu_visual_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/matriz_path_ls.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_py _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/linear_speed_xyz.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_py _simu_visual_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ivan/r_delta/src/simu_visual/msg/parameter_ws.msg" NAME_WE)
add_dependencies(simu_visual_generate_messages_py _simu_visual_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(simu_visual_genpy)
add_dependencies(simu_visual_genpy simu_visual_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS simu_visual_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simu_visual)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/simu_visual
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(simu_visual_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/simu_visual)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/simu_visual
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(simu_visual_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/simu_visual)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/simu_visual
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(simu_visual_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/simu_visual)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/simu_visual
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(simu_visual_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simu_visual)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simu_visual\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/simu_visual
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(simu_visual_generate_messages_py std_msgs_generate_messages_py)
endif()
