Building the Windows release
============================

Once everything is in place, :file:`runme.bat` will build both the 64-bit and 32-bit versions, including the Python, Java and .NET bindings.

After this is done, :file:`create_installer.bat` and its x64 cousin can be used to generate the installer .exe. You will have to update the version in :file:`for_dist\NSISScriptToCreateInstaller.nsi` (search for "OpenBabel version").

wxWidgets
---------
For VS2017, I originally tried using the prebuilt binaries from wxWidgets, but I had a runtime error: "Mismatch between the program and library build versions detected. The library used Visual C++ 1912, and your program used Visual Studio 1910."

So now I just build it myself. Using MSVC2017, I open and upgrade the vc12 solution file in the msw folder. There are two relevant targets, "Release DLL" and "Release", available in both Win32 and x64 configurations. Just "Release" is sufficient - these libs will then be statically linked.

Note that you may need to update CMake if you use the most recent version of wxWidgets as FindWxWidgets() hardcodes the version numbers. 

Python
------

After installing whatever versions of Python you want, make sure they all have 'wheel' and a recent pip::

   > py --list
   -3.7-64 *
   -3.7-32
   ...
   > py -2.7-32 -m pip install -U pip wheel


