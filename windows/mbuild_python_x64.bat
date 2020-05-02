@echo off
echo mbuild_python_x64.bat PYTHON_DIR PYTHON_VER

if %1a==a GOTO:EOF
set PYTHON_DIR=%1
if %2a==a GOTO:EOF
set PYTHON_VER=%2

set HERE=D:\Noel\openbabel\maintenance\windows
set BUILDDIR=%HERE%\nbu\build_x64
set SRCDIR=%HERE%\nbu\src

cd %BUILDDIR%
"D:\Program Files\CMake\bin\cmake.exe" -DPYTHON_BINDINGS=ON -DSWIG_EXECUTABLE=D:\Noel\openbabel\swig\4.0.1\swig.exe -DPYTHON_INCLUDE_DIR="%PYTHON_DIR%\include" -DPYTHON_EXECUTABLE="%PYTHON_DIR%\python.exe" -DPYTHON_LIBRARY="%PYTHON_DIR%\libs\python%PYTHON_VER%.lib" %SRCDIR%
type nul >> %SRCDIR%/scripts/openbabel-python.i

cmake --build . --config Release --target bindings_python
%PYTHON_DIR%\python %HERE%\setup-setuptools.py bdist_wheel
