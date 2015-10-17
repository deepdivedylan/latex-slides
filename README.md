# latex-slides
Deep Dive Coding Bootcamp LaTeX Slides

# Windows Setup
To use the repository on Microsoft Windows, `make` needs to be installed. To install it:

Run the `win-setup-make/install.bat` as an administrator. This will install `make` to the default `git` installation directory.

**Assumption:** All the following commands have been tested in `git bash`, version 2.5. Execute all commands in `git bash`, as it loads all the dependencies automatically.

The default [MiKTeX][http://miktex.org/] distribution does not include beamer. To install it, build one of the slidesets manually:

`$ cd foo`

`$ pdflatex foo.tex`

This process should only need to be executed once per machine. Once beamer (and its dependencies) are installed, the normal `make` process should work.

# Building
To build all the slides, type:

`$ make`

To build a particular slideset, type:

`$ make foo/foo.pdf`

To clean all temporary files and restore the repository to default settings, type:

`$ make clean`
