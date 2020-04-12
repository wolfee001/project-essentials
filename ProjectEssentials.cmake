function(setup_project_essentials foldername)
  include(${foldername}/CompilerWarnings.cmake)
  include(${foldername}/StandardProjectSettings.cmake)
  include(${foldername}/StaticAnalyzers.cmake)
  
  add_library(project_warnings INTERFACE)
  set_project_warnings(project_warnings)
endfunction()