cmake_minimum_required(VERSION 3.15)

include(CompilerWarnings.cmake)
include(StandardProjectSettings.cmake)
include(StaticAnalyzers.cmake)

set_property(DIRECTORY ${PROJECT_SOURCE_DIR} PROPERTY project_essentials_path ${CMAKE_CURRENT_LIST_DIR})

macro(setup_project_essentials)
  get_property(project_essentials_path DIRECTORY ${PROJECT_SOURCE_DIR} PROPERTY project_essentials_path)
  file(COPY ${project_essentials_path}/.clang-format ${project_essentials_path}/.clang-tidy DESTINATION ${PROJECT_SOURCE_DIR})

  standard_setup(17)
  enable_cppcheck()
  enable_clangtidy()

  add_library(${PROJECT_NAME}_warnings INTERFACE)
  set_project_warnings(${PROJECT_NAME}_warnings)
endmacro()
