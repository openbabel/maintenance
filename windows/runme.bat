echo I recommend deleting the nbu folder if it exists
pause
mkdir nbu

git clone https://github.com/openbabel/msvc-dependencies.git nbu\msvc-deps
rem The following are not needed (and cause problems with) the latest
rem MSVC2017
del nbu\msvc-deps\include\stdint.h
del nbu\msvc-deps\include\inttypes.h

git clone https://github.com/openbabel/openbabel.git nbu\src
cd nbu\src
git checkout tags/openbabel-3-0-0a2
cd ..\..
call mbuild.bat
cd ..\..
call mbuild_x64.bat
