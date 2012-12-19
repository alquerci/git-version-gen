git-version-gen
===============

[![Build Status][0]][1]

Tool provides version auto-generation using git tags


Installation
------------

#### Makefile

* Copy the file `git-version-gen.mak` into your project root.

* Include the following line after the first target

`-include git-version-gen.mak`

* Set `GVG_DIR` macro to the directory of the auto generator script

You can check an exemple into the `Makefile` on this project.

[0]: https://travis-ci.org/alquerci/git-version-gen.png?branch=master
[1]: https://travis-ci.org/alquerci/git-version-gen