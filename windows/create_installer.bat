cd for_dist
D:\cygwin64\bin\cat NSISScriptToCreateInstaller.nsi | D:\cygwin64\bin\sed 's/PROGRAMFILES64/PROGRAMFILES/g' > NSISScriptToCreateInstaller_for_x86.nsi
set HERE=D:\Noel\openbabel\maintenance\windows
"D:\Program Files (x86)\NSIS\makensis.exe" /DSourceDir=%HERE%\nbu\src /DBuildDir=%HERE%\nbu\build /DArch=i386 /DDepsDir=%HERE%\nbu\msvc-deps /DmyOutFile=%HERE%\nbu\OpenBabel-3.0.1.exe NSISScriptToCreateInstaller_for_x86.nsi
cd ..
