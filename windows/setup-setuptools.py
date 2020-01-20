#!/usr/bin/env python
from setuptools import *
from distutils.command.build_ext import build_ext
import os, sys, shutil, glob
here = os.path.dirname(__file__)
srcdir = os.path.join(here, "nbu", "src")

about = """Open Babel is a chemical toolbox designed to speak the
many languages of chemical data. It's an open, collaborative project
allowing anyone to search, convert, analyze, or store data from
molecular modeling, chemistry, solid-state materials, biochemistry,
or related areas.
"""

# The following line is necessary because only one 'root package' location
# is possible: either "." or "../../scripts/python", but not both.
# The root package location is set by "package_dir" and defaults to "."
#shutil.copyfile(os.path.join(srcdir, "scripts", "python", "pybel.py"),
#                "pybel.py")
shutil.copyfile(os.path.join("bin", "Release", "_openbabel.pyd"),
                os.path.join(srcdir, "scripts", "python", "_openbabel.pyd"))
# shutil.copyfile(os.path.join(srcdir, "scripts", "python", "openbabel.py"), "openbabel.py")

setup_args = {"name":'openbabel',
        "version":'3.0.0',
        "author":'The Open Babel development team',
        "author_email":'openbabel-discuss@lists.sourceforge.net',
        "url":'http://openbabel.org',
        "license":'http://www.gnu.org/copyleft/gpl.html',
        "package_dir": {"openbabel": os.path.join(srcdir, "scripts", "python", "openbabel")},
        "packages": ['openbabel'],
        "ext_modules":[Extension("_openbabel", sources=["dummy.c"])],
     "description": 'openbabel: Python interface to the Open Babel chemistry library',
     "classifiers":[
      'Development Status :: 5 - Production/Stable',
      'Environment :: Console',
      'Environment :: Other Environment',
      'Intended Audience :: Education',
      'Intended Audience :: Science/Research',
      'License :: OSI Approved :: GNU General Public License (GPL)',
      'Natural Language :: English',
      'Operating System :: MacOS :: MacOS X',
      'Operating System :: Microsoft :: Windows',
      'Operating System :: OS Independent',
      'Operating System :: POSIX',
      'Operating System :: POSIX :: Linux',
      'Operating System :: Unix',
      'Programming Language :: C++',
      'Programming Language :: Python',
      'Topic :: Scientific/Engineering :: Bio-Informatics',
      'Topic :: Scientific/Engineering :: Chemistry',
      'Topic :: Software Development :: Libraries',
      ],
     "long_description": about
      }

# From StackExchange
# http://stackoverflow.com/questions/2444701/distribute-pre-compiled-python-extension-module-with-distutils
# override the build_ext command...to just copy the existing extension
class my_build_ext(build_ext):
    def build_extension(self, ext):
        ''' Copies the already-compiled pyd
        '''
        import shutil
        import os.path

        fullpath = self.get_ext_fullpath(ext.name)
        newpath = os.sep.join(fullpath.split(os.sep)[:-1])
        shutil.copyfile(os.path.join("bin", "Release", '_openbabel.pyd'), os.path.join(newpath, "_openbabel.pyd"))

setup_args['cmdclass'] = {'build_ext': my_build_ext }

setup(**setup_args)
