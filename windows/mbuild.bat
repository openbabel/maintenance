set HERE=D:\Noel\openbabel\maintenance\windows
set DEPS=%HERE%\nbu\msvc-deps
set BUILDDIR=%HERE%\nbu\build
set SRCDIR=%HERE%\nbu\src

mkdir %BUILDDIR%
cd %BUILDDIR%
set WXWIN=D:\Noel\openbabel\wxWidgets\3.0.5
set SWIGDIR=D:\Noel\openbabel\swig\4.0.1
set INCHIDIR=D:\Noel\openbebl\inchi\1.0.5
set JAVADIR=D:\Program Files (x86)\Java\jdk1.8.0_251

cmake.exe -DCMAKE_INSTALL_PREFIX=..\install -G "Visual Studio 16 2019" -A "Win32" -DOB_USE_PREBUILT_LIBRARIES=ON -DLIBXML2_LIBRARIES="%DEPS%\libs-common\i386\libxml2.lib" -DMINIMAL_BUILD=OFF -DCAIRO_INCLUDE_DIRS="%DEPS%\include\cairo" -DCAIRO_LIBRARIES="%DEPS%\libs-common\i386\cairo.lib" -DLIBXML2_INCLUDE_DIR=. -DZLIB_LIBRARY="%DEPS%\libs-common\i386\zlib1.lib" -DZLIB_INCLUDE_DIR=. -DINCHI_LIBRARY="%DEPS%\libs-common\i386\libinchi.lib" -DINCHI_INCLUDE_DIR=%INCHIDIR%\INCHI-1-SRC\INCHI_API\libinchi\src -DXDR_LIBRARY="%DEPS%\libs-common\i386\xdr.lib" -DXDR_INCLUDE_DIR="%DEPS%\include" -DRUN_SWIG=ON -DJAVA_BINDINGS=ON -DJAVA_INCLUDE_PATH="%JAVADIR%\include" -DJAVA_JVM_LIBRARY="%JAVADIR%\lib\jvm.lib" -DJAVA_AWT_LIBRARY="%JAVADIR%\lib\jawt.lib" -DCSHARP_BINDINGS=ON -DCSHARP_EXECUTABLE=C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe -DENABLE_TESTS=OFF -DBUILD_GUI=ON -DOPENBABEL_USE_SYSTEM_INCHI=TRUE -DwxWidgets_CONFIGURATION=mswu -DEIGEN3_INCLUDE_DIR="%DEPS%\include" -DPYTHON_BINDINGS=ON -DSWIG_EXECUTABLE=%SWIGDIR%\swig.exe -DPYTHON_EXECUTABLE=%USERPROFILE%\AppData\Local\Programs\Python\Python37-32\python.exe -DPYTHON_LIBRARY=%USERPROFILE%\AppData\Local\Programs\Python\Python37-32\libs\python37.lib -DJSON_LIBRARY="%DEPS%\libs-vs12\i386\jsoncpp.lib" %1 %2 %3 %4 %5 %6 %7 %8 %SRCDIR%
cmake --build . --config Release
move %SRCDIR%\scripts\csharp\OBDotNet.dll %BUILDDIR%\bin\Release
