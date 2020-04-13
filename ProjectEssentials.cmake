macro(setup_project_essentials directory)  
  include(${directory}/CompilerWarnings.cmake)
  include(${directory}/StandardProjectSettings.cmake)
  include(${directory}/StaticAnalyzers.cmake)

  file(COPY ${directory}/.clang-format ${directory}/.clang-tidy DESTINATION ${PROJECT_SOURCE_DIR})

  standard_setup(17)
  enable_cppcheck()
  enable_clangtidy()

  add_library(${PROJECT_NAME}_warnings INTERFACE)
  set_project_warnings(${PROJECT_NAME}_warnings)
endmacro()