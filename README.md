Clone the project and initialize the Yocto submodule:

```sh
git clone --recurse-submodules https://github.com/abhigoudar007-cpu/my-first-project.git
cd my-first-project
```

Git does not execute project scripts during `clone`, so initialize the submodule
and build environment with the checked-in setup script:

```sh
. ./setup-build.sh
```

The repository already contains the BeagleBone setting in `build/conf/local.conf`
and portable layer paths in `build/conf/bblayers.conf`. The script initializes
the `poky` submodule if needed, verifies the checked-in configuration, and leaves
the shell ready for BitBake without modifying project files.
Build an image with:

```sh
bitbake core-image-minimal
```

For an existing clone, update the submodule and run the setup script again:

```sh
git submodule update --init --recursive
. ./setup-build.sh
```
