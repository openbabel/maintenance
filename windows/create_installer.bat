cd for_dist
cat NSISScriptToCreateInstaller.nsi | sed 's/PROGRAMFILES64/PROGRAMFILES/g' > NSISScriptToCreateInstaller_for_x86.nsi
set HERE=C:\Tools\openbabel\maintenance\windows
"C:\Program Files (x86)\NSIS\makensis.exe" /DSourceDir=%HERE%\nbu\src /DBuildDir=%HERE%\nbu\build /DArch=i386 /DDepsDir=%HERE%\nbu\msvc-deps /DmyOutFile=%HERE%\nbu\OpenBabel-3.0.0.exe NSISScriptToCreateInstaller_for_x86.nsi
cd ..
