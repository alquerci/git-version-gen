git-version-gen
===============

[![Build Status][0]][1]

This tool provides version auto-generation using git tags.


Installation
------------

#### Makefile

Use this following syntax:

```
VERSION = $(shell path/to/git-version-gen.sh)
```

You can check an example into the `Makefile` on this project.

Features
--------

* If a file named `version` on the current directory exists, then it contains
  is read, formatted and returned.
* If the `--fallback` option is given then take it, formated and return.
* If an environment variable `VERSION` exists, then take it, formatted and returned.
* If there is no git tag in the commit history, then return `0.1.0` or `VERSION`
  or `--fallback` value or use the value on the file `version`.

Acknowledgments
---------------

This project is based on the script [***GIT-VERSION-GEN***][2] of the [***git project***][3].

Thanks to [***gitster***][4] and all of contributors to the project git.

[0]: https://travis-ci.org/alquerci/git-version-gen.png?branch=master
[1]: https://travis-ci.org/alquerci/git-version-gen
[2]: https://github.com/git/git/blob/master/GIT-VERSION-GEN
[3]: https://github.com/git/git
[4]: https://github.com/gitster
