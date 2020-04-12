if(NOT PROJECT_ESSENTIALS_DIR)
  message(SEND_ERROR "PROJECT_ESSENTIALS_DIR not set!")
endif()

include(${PROJECT_ESSENTIALS_DIR}/CompilerWarnings.cmake)
include(${PROJECT_ESSENTIALS_DIR}/StandardProjectSettings.cmake)
include(${PROJECT_ESSENTIALS_DIR}/StaticAnalyzers.cmake)

file(COPY ${PROJECT_ESSENTIALS_DIR}/.clang-format ${PROJECT_ESSENTIALS_DIR}/.clang-tidy DESTINATION ${PROJECT_SOURCE_DIR})

add_library(${PROJECT_NAME}_warnings INTERFACE)
set_project_warnings(${PROJECT_NAME}_warnings)