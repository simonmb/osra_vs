@setlocal
@pushd "%~dp0"
@if not "%VisualStudioVersion%" == "" Set HAS_VSDEV=TRUE
@if not "%HAS_VSDEV%" == "TRUE" CALL "%VS140COMNTOOLS%VsDevCmd.bat" %1
@echo off
@CALL "cmake_setvar.bat"
@echo on
@Set CMAKE_OPT=%CMAKE_OPT% -DBUILD_SHARED_LIBS=ON
@pushd "%BUILD_DIR%"
cmake %CMAKE_OPT%  ..\..
@popd
@popd
@if not "%HAS_VSDEV%" == "TRUE" pause
@endlocal
