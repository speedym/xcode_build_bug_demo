cmake_minimum_required(VERSION 2.8)

project(tesst_project)

add_executable(myapp main.c)

set(INPUT_FILE_PATH1 ${CMAKE_CURRENT_SOURCE_DIR}/test1.vert)
set(INPUT_FILE_PATH2 ${CMAKE_CURRENT_SOURCE_DIR}/test2.vert)
set(INPUT_FILE_PATH3 ${CMAKE_CURRENT_SOURCE_DIR}/test3.vert)
set(OUTPUT_FILE_PATH1 ${CMAKE_CURRENT_BINARY_DIR}/test1.vert.compiled)
set(OUTPUT_FILE_PATH2 ${CMAKE_CURRENT_BINARY_DIR}/test2.vert.compiled)
set(OUTPUT_FILE_PATH3 ${CMAKE_CURRENT_BINARY_DIR}/test3.vert.compiled)

add_custom_target(test1.vert.target
    SOURCES ${OUTPUT_FILE_PATH1}
)

add_custom_target(test2.vert.target
    SOURCES ${OUTPUT_FILE_PATH2}
)

add_custom_target(test3.vert.target
    SOURCES ${OUTPUT_FILE_PATH3}
)

#add_library(test1.vert.target)
#target_sources(test1.vert.target
#    PRIVATE
#    ${OUTPUT_FILE_PATH1}
#)
#
#add_library(test2.vert.target)
#target_sources(test2.vert.target
#    PRIVATE
#    ${OUTPUT_FILE_PATH2}
#)
#
#add_library(test3.vert.target)
#target_sources(test3.vert.target
#    PRIVATE
#    ${OUTPUT_FILE_PATH3}
#)

set_source_files_properties(
    ${OUTPUT_FILE_PATH1}
    PROPERTIES GENERATED TRUE
)

set_source_files_properties(
    ${OUTPUT_FILE_PATH2}
    PROPERTIES GENERATED TRUE
)

set_source_files_properties(
    ${OUTPUT_FILE_PATH3}
    PROPERTIES GENERATED TRUE
)

add_custom_command(
	   OUTPUT ${OUTPUT_FILE_PATH1}
	   COMMAND sleep 10
       COMMAND cp ${INPUT_FILE_PATH1} ${OUTPUT_FILE_PATH1}
#       MAIN_DEPENDENCY ${INPUT_FILE_PATH1}
       DEPENDS ${INPUT_FILE_PATH1}
       COMMENT "Processing shader ${INPUT_FILE_PATH1}"
       VERBATIM
       COMMAND_EXPAND_LISTS)

add_custom_command(
	   OUTPUT ${OUTPUT_FILE_PATH2}
	   COMMAND sleep 10
       COMMAND cp ${INPUT_FILE_PATH2} ${OUTPUT_FILE_PATH2}
#       MAIN_DEPENDENCY ${INPUT_FILE_PATH2}
       DEPENDS ${INPUT_FILE_PATH2}
       COMMENT "Processing shader ${INPUT_FILE_PATH2}"
       VERBATIM
       COMMAND_EXPAND_LISTS)

add_custom_command(
	   OUTPUT ${OUTPUT_FILE_PATH3}
	   COMMAND sleep 10
       COMMAND cp ${INPUT_FILE_PATH3} ${OUTPUT_FILE_PATH3}
#       MAIN_DEPENDENCY ${INPUT_FILE_PATH3}
       DEPENDS ${INPUT_FILE_PATH3}
       COMMENT "Processing shader ${INPUT_FILE_PATH3}"
       VERBATIM
       COMMAND_EXPAND_LISTS)

add_dependencies(myapp
    test1.vert.target
    test2.vert.target
    test3.vert.target
)

target_sources(myapp PRIVATE
   ${INPUT_FILE_PATH1}
   ${INPUT_FILE_PATH2}
   ${INPUT_FILE_PATH3}
   ${OUTPUT_FILE_PATH1}
   ${OUTPUT_FILE_PATH2}
   ${OUTPUT_FILE_PATH3}
)
