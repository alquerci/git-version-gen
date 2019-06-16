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

VERSION=${VERSION='0.1.0'}

# Processes command line arguments.
#
prevVarName=
value=
dashdash=
for operand
do
    # If the previous operand needs a value, assign it.
    if test x != x"${prevVarName}"; then
        eval ${prevVarName}=\$operand
        prevVarName=

        continue
    fi

    # extract the value
    case ${operand} in #(
        *=?*)
            value=`expr X"${operand}" : X'[^=]*=\(.*\)'`
            ;; #(
        *=)
            value=
            ;; #(
        *)
            value='yes'
            ;;
    esac

    case ${dashdash}${operand} in #(
        --)
            dashdash='yes'
            ;; #(
        --fallback)
            prevVarName='VERSION'
            ;; #(
        --fallback=*)
            VERSION="${value}"
            ;; #(
        *)
            ;;
    esac
done

LF='
'


# First see if there is a version file (included in release tarballs),
# then try git-describe, then default.
if test -f version
then
    VN=`cat version` || VN="${VERSION}"
elif test -d .git || test -f .git &&
    VN=`git describe --match "v[0-9]*" --tags --abbrev=7 HEAD 2>/dev/null` &&
    case ${VN} in #(
        *${LF}*) (exit 1) ;; #(
        v[0-9]*)
            git update-index -q --refresh
            test x = x"`git diff-index --name-only HEAD --`" ||
            VN="${VN}-dirty" ;;
    esac
then
    # Replace the lead hyphen by a dot.
    #
    # from:
    #   <tag>-<append by git describe>[-dirty]
    # to:
    #   <tag>.<append by git describe>[-dirty]
    #
    VN=`sed -e 's,-\([1-9][0-9]*-g[0-9a-z]\{7\}\(-dirty\)\?\)$,.\\1,' <<EOF
$VN
EOF`
else
    VN="${VERSION}"
fi

# Remove prefix v
VN=`expr x"${VN}" : x'v*\(.*\)'`

# send the version to the stdout
cat <<EOF
$VN
EOF

exit 0
