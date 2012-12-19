#!/bin/sh
# (c) GIT-VERSION-GEN - github.com/git/git

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
VN=${VN#v};
test "$VN" = "$VC" || {
	echo >&2 "VERSION = $VN"
	echo "VERSION = $VN" >$VF
}

exit 0;
