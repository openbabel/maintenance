Creating a release
==================

Bump version numbers
--------------------

Bump the version in the following locations (if necessary).

1. CMakeLists.txt - search for "BABEL_MAJ_VER" - all three numbers are
   set here. Some examples:

   - Typical is 2, 4, 1 (for 2.4 first patch release)
   - I used 3, 0, a1 for the first alpha release.
   - For development versions prior to a new minor release, we usually
     bump the patch version to 99.

2. Doxyfile - search for "PROJECT_NUMBER" only for major versions
