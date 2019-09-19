Snap packages
=============

Prepare a VirtualBox VM
-----------------------

Out of the box, snapcraft currently doesn't work when running in a VM as it defaults to using 'multipass' and KVM containers, but VirtualBox is not happy with this. Instead, LXD containers can be used. Follow the instructions at https://snapcraft.io/docs/build-on-lxd to set up LXD. "--use-lxd" (see below) is then needed when using snapcraft.

Building a snap package
-----------------------

Here I'll focus on creating a snap for a particular release, rather than a development version. I did this on Xubuntu 18.04 (in VirtualBox on Windows).

1. Update the "version:" and "source:" in snap/snapcraft.yml
2. ``snapcraft --use-lxd |& tee errors.txt``

Upload it
---------

1. snapcraft login
2. snapcraft push openbabel_XXXX.snap --release beta

Instead of "beta", can be "candidate" or "stable". To automate the login, you can export credentials with snapcraft export-login", after which you can use "snapcraft login --with exported.txt" (naturally, you need to be a bit careful with this).

To get an overview, go http://snapcraft.io and login (top right, under "Developer Login"). You can also add additional metadata here.

When a new stable relesae comes out, you should close the beta and candidate channels to cause users to be upgrade to the stable version (if tracking beta or candidate). Similarly, when a new beta comes out, you should close edge (so edge trackers will be promoted to beta).
