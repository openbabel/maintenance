@rem The cmake/bin directory should be in PATH
@rem To build the GUI, the top level directory of wxWidgets should be in the
@rem environment variable WXWIN and -DBUILD_GUI=ON specified 
set HERE=C:\Tools\openbabel\maintenance\windows
set DEPS=%HERE%\nbu\msvc-deps
set BUILDDIR=%HERE%\nbu\build
set SRCDIR=%HERE%\nbu\src

mkdir %BUILDDIR%
cd %BUILDDIR%
rem I built wxWidgets myself and needed a new CMake in order to identify this
rem version
set WXWIN=C:\Tools\wxWidgets\wxWidgets-3.0.4

"C:\Program Files (x86)\CMake\bin\cmake.exe" -DCMAKE_INSTALL_PREFIX=..\install -G "Visual Studio 15 2017" -DOB_USE_PREBUILT_LIBRARIES=ON -DLIBXML2_LIBRARIES="%DEPS%\libs-common\i386\libxml2.lib" -DMINIMAL_BUILD=OFF -DCAIRO_INCLUDE_DIRS="%DEPS%\include\cairo" -DCAIRO_LIBRARIES="%DEPS%\libs-common\i386\cairo.lib" -DLIBXML2_INCLUDE_DIR=. -DZLIB_LIBRARY="%DEPS%\libs-common\i386\zlib1.lib" -DZLIB_INCLUDE_DIR=. -DINCHI_LIBRARY="%DEPS%\libs-common\i386\libinchi.lib" -DINCHI_INCLUDE_DIR=C:\Tools\InChI\v1.0.5\INCHI-1-SRC\INCHI_API\libinchi\src -DXDR_LIBRARY="%DEPS%\libs-common\i386\xdr.lib" -DXDR_INCLUDE_DIR="%DEPS%\include" -DRUN_SWIG=ON -DJAVA_BINDINGS=ON -DJAVA_INCLUDE_PATH="C:\Program Files (x86)\Java\jdk1.7.0_80\include" -DJAVA_JVM_LIBRARY="C:\Program Files (x86)\Java\jdk1.7.0_80\lib\jvm.lib" -DJAVA_AWT_LIBRARY="C:\Program Files (x86)\Java\jdk1.7.0_80\lib\jawt.lib" -DCSHARP_BINDINGS=ON -DCSHARP_EXECUTABLE=C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe -DENABLE_TESTS=OFF -DBUILD_GUI=ON -DOPENBABEL_USE_SYSTEM_INCHI=TRUE -DwxWidgets_CONFIGURATION=mswu -DEIGEN3_INCLUDE_DIR="%DEPS%\include" -DPYTHON_BINDINGS=ON -DSWIG_EXECUTABLE=C:\Tools\swig\swigwin-3.0.12\swig.exe -DPYTHON_EXECUTABLE=C:\Users\Noel\AppData\Local\Programs\Python\Python37-32\python.exe -DPYTHON_LIBRARY=C:\Users\Noel\AppData\Local\Programs\Python\Python37-32\libs\python37.lib  -DJSON_LIBRARY="%DEPS%\libs-vs12\i386\jsoncpp.lib" %1 %2 %3 %4 %5 %6 %7 %8 %SRCDIR%
cmake --build . --config Release
