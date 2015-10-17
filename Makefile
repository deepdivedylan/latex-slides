TEX_FILES = $(shell find . -type f -name "*.tex")
PDF_FILES = $(patsubst %.tex, %.pdf, $(TEX_FILES))
TMP_FILES = $(foreach EXTENSION, %.aux %.bbl %.blg %.dvi %.log %.nav %.pdf %.out %.snm %.synctex.gz %.toc %.vrb, $(patsubst %.tex, $(EXTENSION), $(TEX_FILES)))

all: $(PDF_FILES)

clean:
	@rm -f $(TMP_FILES)

%.pdf: %.tex
	@echo $(@D)
	cd $(@D); $(shell echo pdflatex `basename "$<"`); $(shell echo pdflatex `basename "$<"`); $(shell echo bibtex `basename "$<" | cut -d. -f1`); $(shell echo pdflatex `basename "$<"`)
