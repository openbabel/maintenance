set HERE=D:\noel\openbabel\maintenance\windows
set DEPS=%HERE%\nbu\msvc-deps
set BUILDDIR=%HERE%\nbu\build_x64
set SRCDIR=%HERE%\nbu\src

mkdir %BUILDDIR%
cd %BUILDDIR%
set WXWIN=D:\Noel\openbabel\wxWidgets\3.0.5
set SWIGDIR=D:\Noel\openbabel\swig\4.0.1
set INCHIDIR=D:\Noel\openbabel\inchi\1.0.5
set JAVADIR=D:\Program Files\Java\jdk1.8.0_251

cmake.exe -G "Visual Studio 16 2019" -A "x64" -DOB_USE_PREBUILT_LIBRARIES=ON -DCMAKE_INSTALL_PREFIX=..\install -DLIBXML2_LIBRARIES="%DEPS%\libs-common\x64\libxml2.lib" -DMINIMAL_BUILD=OFF -DCAIRO_INCLUDE_DIRS="%DEPS%\include\cairo" -DCAIRO_LIBRARIES="%DEPS%\libs-common\x64\cairo.lib" -DLIBXML2_INCLUDE_DIR=. -DZLIB_LIBRARY="%DEPS%\libs-common\x64\zlib1.lib" -DZLIB_INCLUDE_DIR=. -DINCHI_LIBRARY="%DEPS%\libs-common\x64\libinchi.lib" -DINCHI_INCLUDE_DIR=. -DXDR_LIBRARY="%DEPS%\libs-common\x64\xdr.lib" -DXDR_INCLUDE_DIR="%DEPS%\include" -DRUN_SWIG=ON -DJAVA_BINDINGS=ON -DJAVA_INCLUDE_PATH="%JAVADIR%\include" -DJAVA_JVM_LIBRARY="%JAVADIR%\lib\jvm.lib" -DJAVA_AWT_LIBRARY="%JAVADIR%\lib\jawt.lib" -DCSHARP_BINDINGS=ON -DCSHARP_EXECUTABLE=C:\Windows\Microsoft.NET\Framework64\v3.5\csc.exe -DENABLE_TESTS=OFF -DBUILD_GUI=OFF -DOPENBABEL_USE_SYSTEM_INCHI=TRUE -DwxWidgets_CONFIGURATION=mswu -DEIGEN3_INCLUDE_DIR="%DEPS%\include" -DPYTHON_BINDINGS=ON -DSWIG_EXECUTABLE=%SWIGDIR%\swig.exe -DPYTHON_EXECUTABLE=%USERPROFILE%\AppData\Local\Programs\Python\Python37\python.exe -DPYTHON_LIBRARY=%USERPROFILE%\AppData\Local\Programs\Python\Python37\libs\python37.lib -DJSON_LIBRARY="%DEPS%\libs-vs12\x64\jsoncpp.lib" %1 %2 %3 %4 %5 %6 %7 %8 %SRCDIR%
cmake --build . --config Release
move %SRCDIR%\scripts\csharp\OBDotNet.dll %BUILDDIR%\bin\Release
