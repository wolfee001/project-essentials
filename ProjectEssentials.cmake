function(setup_project_essentials foldername)
  include(${foldername}/CompilerWarnings.cmake)
  include(${foldername}/StandardProjectSettings.cmake)
  include(${foldername}/StaticAnalyzers.cmake)

  file(COPY ${foldername}/.clang-format ${foldername}/.clang-tidy DESTINATION ${PROJECT_SOURCE_DIR})

  add_library(${PROJECT_NAME}_warnings INTERFACE)
  set_project_warnings(${PROJECT_NAME}_warnings)
endfunction()