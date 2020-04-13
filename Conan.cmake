include(FetchContent)
FetchContent_Declare(
  conan
  GIT_REPOSITORY https://github.com/conan-io/cmake-conan.git
  GIT_TAG        v0.15
)
FetchContent_GetProperties(conan)
if(NOT conan_POPULATED)
  FetchContent_Populate(conan)
endif()
include(${conan_SOURCE_DIR}/conan.cmake)

macro(setup_conan conanfile buildtype)
  conan_cmake_run(CONANFILE ${conanfile} BUILD missing BASIC_SETUP BUILD_TYPE ${buildtype} CMAKE_TARGETS)
endmacro()
