cmake_minimum_required(VERSION 3.15)

include(CompilerWarnings.cmake)
include(StandardProjectSettings.cmake)
include(StaticAnalyzers.cmake)

macro(setup_project_essentials directory)  
  file(COPY .clang-format .clang-tidy DESTINATION ${PROJECT_SOURCE_DIR})

  standard_setup(17)
  enable_cppcheck()
  enable_clangtidy()

  add_library(${PROJECT_NAME}_warnings INTERFACE)
  set_project_warnings(${PROJECT_NAME}_warnings)
endmacro()