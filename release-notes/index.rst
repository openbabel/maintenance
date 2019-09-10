Update release notes
====================

The goal here is to add a line to the release notes for every PR merged. If you look at ob300.rst in the documentation (\ReleaseNotes), you will get the idea.

To minimise work, the title of the PR should be used pretty much as written by the original author. Bug fixes are added to one big list at the end (which most people won't read), while everything else is listed under a small number of headings, e.g. "New file formats", "New file format capabilities and options", "Other new features and improvements", "Development/build/install improvements". Anything that a user really needs to be aware of, or headline features, can be repeated with a fuller description in the "Notable changes" or "Highlight features" section.

The process is semi-automated. It pulls the PRs and authors from the 'pulls' page on the website, and tries to figure out authors' real names from their own profile pages.

1. Edit the date in the URL in :file:`github2changelog.py` to indicate the
   earliest date associated with the relevant PRs. This URL comes directly
   from the GitHub PR search interface if you search with::
  
   is:pr is:merged created:>=2019-04-01

2. Run the Python script to generate the list of PRs and authors (written to authors.txt)::

     python github2changelog.py # creates authors.txt and changes.txt

3. Add the authors to the bottom of the release notes under "Cast of contributors".

4. Add the PR descriptions into the release notes at an appropriate location. You may have to edit the text here or there.
