cmake_minimum_required(VERSION 3.12)

include(CompilerWarnings.cmake)
include(Conan.cmake)
include(StandardProjectSettings.cmake)
include(StaticAnalyzers.cmake)

set_property(GLOBAL PROPERTY project_essentials_path ${CMAKE_CURRENT_LIST_DIR})

macro(setup_project_essentials)
  get_property(project_essentials_path GLOBAL PROPERTY project_essentials_path)
  file(COPY ${project_essentials_path}/.clang-format ${project_essentials_path}/.clang-tidy DESTINATION ${PROJECT_SOURCE_DIR})

  standard_setup(17)
  enable_cppcheck()
  enable_clangtidy()

  set(conanfile "")
  if(EXISTS ${PROJECT_SOURCE_DIR}/conanfile.txt)
    set(conanfile conanfile.txt)
  endif()
  if(EXISTS ${PROJECT_SOURCE_DIR}/conanfile.py)
    set(conanfile conanfile.py)
  endif()

  if(NOT ${conanfile} STREQUAL "")
    set(conan_buildtype ${CMAKE_BUILD_TYPE})
    if(CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)
      set(conan_buildtype "Release")
    endif()
    setup_conan(${conanfile} ${conan_buildtype})
  endif()

  add_library(${PROJECT_NAME}_warnings INTERFACE)
  set_project_warnings(${PROJECT_NAME}_warnings)
endmacro()
