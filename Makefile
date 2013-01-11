############## GNU GENERAL PUBLIC LICENSE, Version 3 ####################
# git-version-gen - Tool provides version auto-generation using git tags
# Copyright (C) 2012 Junio C Hamano <gitster@pobox.com>
#                    loops
#                    Tay Ray Chuan <rctay89@gmail.com>
#                    Alexandre Quercia <alquerci@email.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#########################################################################

# The default target of this Makefile is...
all:

# The following line must be included into the root Makefile
### START ###
# Use this version if no tag is defined
export VERSION = 0.0.0
# Directory to auto generator script
GVG_DIR = .
-include git-version-gen.mak
### END ###

test:
	@echo -n 'test_git-version-gen ... '
	@if test $(VERSION) = 0.0.0;then echo 'fail\n  Makefile-VERSION = 0.0.0\n  VERSION =' $(VERSION); exit 1; fi;
	@echo ok


