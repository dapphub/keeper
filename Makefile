prefix ?= /usr/local

all:; docker build -t nexusdev/keeper .

dirs = {bin,libexec}
SHELL = bash

dirs:; mkdir -p $(prefix)/$(dirs)
files = $(shell ls -d $(dirs)/*)
install:; cp -r -n $(dirs) $(prefix)
link: dirs; for x in $(files); do ln -s `pwd`/$$x $(prefix)/$$x; done
uninstall:; rm -r $(addprefix $(prefix)/,$(files))
