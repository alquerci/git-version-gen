git-version-gen
===============

[![Build Status][0]][1]

Tool provides version auto-generation using git tags


Installation
------------

#### Makefile

* Use this syntax

`VERSION = $(shell path/to/git-version-gen.sh)`


You can check an exemple into the `Makefile` on this project.

Features
--------

* `git-version-gen.sh <file>` get the version of the specific file, it's not tested yet.
* If a file named `version` on the current directory then contains is read, formated and return.
* If an environement variable VERSION exists then take it, formated and return.
* If no git tags exits then retrun `0.0.1` or `VERSION` or in file `version`.

Acknowledgments
---------------

This project is based on the script [***GIT-VERSION-GEN***][2] of the [***git project***][3].

Thanks to [***gitster***][4] and all of contributors to the project git.

[0]: https://travis-ci.org/alquerci/git-version-gen.png?branch=master
[1]: https://travis-ci.org/alquerci/git-version-gen
[2]: https://github.com/git/git/blob/master/GIT-VERSION-GEN
[3]: https://github.com/git/git
[4]: https://github.com/gitster
