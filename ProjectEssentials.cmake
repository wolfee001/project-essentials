include(CompilerWarnings.cmake)
include(StandardProjectSettings.cmake)
include(StaticAnalyzers.cmake)

add_library(project_warnings INTERFACE)
set_project_warnings(project_warnings)
