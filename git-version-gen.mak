SHELL_PATH ?= /bin/sh

# Use this version if no tag is defined
export VERSION ?= 0.0.1

# file auto-generate containing the macro VERSION to be included into the Makefile
export GIT_VERSION_FILE ?= GIT-VERSION-FILE

# Directory to auto generator script
GVG_DIR ?= ./src

# Path to auto generator script
GVG_PATH = $(GVG_DIR)/git-version-gen.sh

$(GIT_VERSION_FILE): 
	@$(SHELL_PATH) $(GVG_PATH)
-include $(GIT_VERSION_FILE)

# Version must be generate for each times
.PHONY: $(GIT_VERSION_FILE)


RM ?= /bin/rm --preserve-root


clean:
	$(RM) $(GIT_VERSION_FILE)
