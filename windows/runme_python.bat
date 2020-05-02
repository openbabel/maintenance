set HERE=D:\Noel\openbabel\maintenance\windows

cd %HERE%
call mbuild_python.bat D:\Python27 27

cd %HERE%
call mbuild_python.bat %USERPROFILE%\AppData\Local\Programs\Python\Python35-32 35

cd %HERE%
call mbuild_python.bat %USERPROFILE%\AppData\Local\Programs\Python\Python36-32 36

cd %HERE%
call mbuild_python.bat %USERPROFILE%\AppData\Local\Programs\Python\Python37-32 37

cd %HERE%
call mbuild_python.bat %USERPROFILE%\AppData\Local\Programs\Python\Python38-32 38

cd %HERE%
call mbuild_python_x64.bat D:\Python27_64 27

cd %HERE%
call mbuild_python_x64.bat %USERPROFILE%\AppData\Local\Programs\Python\Python35 35

cd %HERE%
call mbuild_python_x64.bat %USERPROFILE%\AppData\Local\Programs\Python\Python36 36

cd %HERE%
call mbuild_python_x64.bat %USERPROFILE%\AppData\Local\Programs\Python\Python37 37

cd %HERE%
call mbuild_python_x64.bat %USERPROFILE%\AppData\Local\Programs\Python\Python38 38
