cd for_dist
set HERE=D:\Noel\openbabel\maintenance\windows
"D:\Program Files (x86)\NSIS\makensis.exe" /DSourceDir=%HERE%\nbu\src /DBuildDir=%HERE%\nbu\build_x64 /DArch=x64 /DDepsDir=%HERE%\nbu\msvc-deps /DmyOutFile=%HERE%\nbu\OpenBabel-3.0.1-x64.exe NSISScriptToCreateInstaller.nsi
cd ..
