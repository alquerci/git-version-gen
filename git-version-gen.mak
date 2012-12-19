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

SHELL_PATH ?= /bin/sh

# Use this version if no tag is defined
export VERSION ?= 0.0.1

# file auto-generate containing the macro VERSION to be included into the Makefile
export GIT_VERSION_FILE ?= GIT-VERSION-FILE

# Directory to auto generator script
GVG_DIR ?= ./src

# Path to auto generator script
GVG_PATH = $(GVG_DIR)/git-version-gen.sh

$(GIT_VERSION_FILE): FORCE
	@$(SHELL_PATH) $(GVG_PATH)
-include $(GIT_VERSION_FILE)

# Version must be generate for each times
.PHONY: FORCE


RM ?= /bin/rm --preserve-root


clean:
	$(RM) $(GIT_VERSION_FILE)
