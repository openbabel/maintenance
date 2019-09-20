Creating a release
==================

Bump version numbers
--------------------

Bump the version in the following locations (if necessary).

1. CMakeLists.txt - search for "BABEL_MAJ_VER" - all three numbers are
   set here. Some examples:

   - Typical is 2, 4, 1 (for 2.4 first patch release)
   - I used 3, 0, 0a1 for the first alpha release.
   - For development versions prior to a new minor release, we usually
     bump the patch version to 99. An alternative (for the future perhaps)
     would be to append "dev" to the patch version.

2. doc/Doxyfile.in - search for "PROJECT_NUMBER" - don't need to update
   for patch releases

These changes can be done via a PR and immediately merged.

Tag version
-----------

This cannot be done via a PR and must be done directly on the repo.

1. Use "git tag" to list existing tags

2. Create a new annotated tag, e.g.::
  
   git tag -a openbabel-3-0-0a1 -m "Version 3.0.0a1"

3. Push the tag to the main repo::

   git push origin openbabel-3-0-0a1

Major version
-------------

On going from 2.x to 3.x, for example, you should make a few more changes:

1. CMakeLists.txt::
   
   set(OB_INCLUDE_DIRS "include/openbabel-3.0") in CMakeLists.txt
     and
   set(OB_EXPORTS_FILE "${openbabel_BINARY_DIR}/OpenBabel3_EXPORTS.cmake")   

2. The package config section::

          configure_file(${openbabel_SOURCE_DIR}/openbabel-3.0.pc.cmake
            ${openbabel_BINARY_DIR}/openbabel-3.0.pc @ONLY)
          install(FILES ${openbabel_BINARY_DIR}/openbabel-3.0.pc
            DESTINATION ${LIB_INSTALL_DIR}/pkgconfig)

  and::

          git mv openbabel-2.0.pc.cmake openbabel-3.0.pc.cmake

3. dlhandler_win32.cpp::

    handle = GetModuleHandle("openbabel-3.dll");//CMake/VC++2008 build will use this.

4. src/CMakeLists.txt::

  # Set the output name to openbabel-3 (preserves old behaviour). Is this desired?
  set_target_properties(openbabel PROPERTIES
    OUTPUT_NAME openbabel-3)
  remove_definitions(_UNICODE UNICODE)
   
5. Then there's a whole bunch of lines in CMakeLists.txt starting with::

     # Create the Config and ConfigVersion files in the build directory, useful to
  
   and the associated files::

        git mv OpenBabel2Config.cmake.in OpenBabel3Config.cmake.in
        git mv OpenBabel2ConfigVersion.cmake.in OpenBabel3ConfigVersion.cmake.in

