# The default target of this Makefile is...
all:

# The following line must be included into the root Makefile
### START ###
# Use this version if no tag is defined
export VERSION = 0.0.0
# Directory to auto generator script
GVG_DIR = ./src
-include git-version-gen.mak
### END ###


test:
	@echo '[TEST]'
	@echo '  - Makefile-VERSION = 0.0.0'
	@echo '  - VERSION =' $(VERSION)
	@test $(VERSION) != 0.0.0 || exit 1
	@echo "OK"

