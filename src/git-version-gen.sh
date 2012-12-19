#!/bin/sh
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

if [ -z "$GIT_VERSION_FILE" ];
then
    VF="GIT-VERSION-FILE";
else
    VF="$GIT_VERSION_FILE";
fi

LF='
'

# First see if there is a version file (included in release tarballs),
# then try git-describe, then default.
if test -f version
then
	VN=$(cat version) || VN="$VERSION"
elif test -d .git -o -f .git &&
	VN=$(git describe --match "v[0-9]*" --tags --abbrev=7 HEAD 2>/dev/null) &&
	case "$VN" in
	*$LF*) (exit 1) ;;
	v[0-9]*)
		git update-index -q --refresh
		test -z "$(git diff-index --name-only HEAD --)" ||
		VN="$VN-dirty" ;;
	esac
then
	VN=$(echo "$VN" | sed -e 's/-/./g');
else
	VN="$VERSION"
fi

VN=$(expr "$VN" : v*'\(.*\)')

if test -r $VF
then
	VC=$(sed -e 's/^VERSION = //' <$VF)
else
	VC=unset
fi

# Remove prefix v
VN=${VN#v};

test "$VN" = "$VC" || {
	echo >&2 "VERSION = $VN"
	echo "VERSION = $VN" >$VF
}

exit 0;
