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

