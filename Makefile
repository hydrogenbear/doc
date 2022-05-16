# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile html

en: gettext
	sphinx-intl update -p ${BUILDDIR}/gettext -l $@
	@$(SPHINXBUILD) -b html -D language=$@ -D html_search_language=$@ ${SOURCEDIR} ${BUILDDIR}/html/$@

zh_CN: gettext
	sphinx-intl update -p ${BUILDDIR}/gettext -l $@
	@$(SPHINXBUILD) -b html -D language=$@ -D html_search_language=$@ ${SOURCEDIR} ${BUILDDIR}/html/$@

index: en
	cp source/index.html build/html/index.html

html: en zh_CN index

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
