# Makefile for CMBA bylaws, inspired by the Github gists below
# https://gist.github.com/kristopherjohnson/7466917
# https://gist.github.com/claudioperez/e8929a16d0c872a7e2063a5e3c04ed49
SHELL = /bin/bash
RM=/bin/rm
PANDOC=/usr/local/bin/pandoc

# --- Source ---
SOURCEDIR := src
# SOURCEFILENAME should not include extenstion
SOURCEFILENAME := cmba-bylaws

# --- Build---
BUILDDIR := build
# SOURCEFILENAME should not include extenstion
BUILDFILENAME := cmba-bylaws

PANDOC_OPTIONS= \
	--standalone \
	--number-sections  \
	--toc \
	--toc-depth=2 \
	--lua-filter $(SOURCEDIR)/shift-numbering.lua\
	--metadata-file $(SOURCEDIR)/metadata.yml

PANDOC_PDF_OPTIONS= -V "geometry:left=.75in,right=.75in,top=1in,bottom=1in" \
					-V "colorlinks:true"
PANDOC_HTML_OPTIONS=
PANDOC_EPUB_OPTIONS=

ALL=\
 pdf \
 html \
 epub

default: all;

pdf: $(SOURCEDIR)/$(SOURCEFILENAME).md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) '$<' -o $(BUILDDIR)/$(BUILDFILENAME).$@

html: $(SOURCEDIR)/$(SOURCEFILENAME).md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) '$<' -o $(BUILDDIR)/$(BUILDFILENAME).$@

epub: $(SOURCEDIR)/$(SOURCEFILENAME).md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) '$<' -o $(BUILDDIR)/$(BUILDFILENAME).$@

github:
	@make html
	@cp -a $(BUILDDIR)/$(BUILDFILENAME).html ./index.html

# Targets and dependencies
.PHONY: all clean

all: $(ALL);

clean:
	- $(RM) $(BUILDDIR)/$(BUILDFILENAME).pdf
	- $(RM) $(BUILDDIR)/$(BUILDFILENAME).html
	- $(RM) $(BUILDDIR)/$(BUILDFILENAME).epub