TEX_FILES = $(shell find . -type f -name "*.tex")
PDF_FILES = $(patsubst %.tex, %.pdf, $(TEX_FILES))
TMP_FILES = $(foreach EXTENSION, %.aux %.bbl %.blg %.dvi %.log %.nav %.pdf %.out %.snm %.synctex.gz %.toc %.vrb, $(patsubst %.tex, $(EXTENSION), $(TEX_FILES)))
DEST_DIR  = "../bootcamp-coders/public_html/class-materials/lecture-slides"

all: $(PDF_FILES)

clean:
	@rm -f $(TMP_FILES)

%.pdf: %.tex
	cd $(@D); $(shell echo pdflatex `basename "$<"`); $(shell echo bibtex `basename "$<" | cut -d. -f1`); $(shell echo pdflatex `basename "$<"`); $(shell echo pdflatex `basename "$<"`)

# @echo cp $(PDF_FILES) $(DEST_DIR) \
# @echo "installation dir $(DEST_DIR) does not exist"
# install: all
ifneq "$(wildcard $(DEST_DIR) )" ""
	@echo "OK"
	CAN_INSTALL = 1	
endif

install: all
	@if test -d $(DEST_DIR); then echo cp $(PDF_FILES) $(DEST_DIR); else echo installation directory $(DEST_DIR) does not exist; exit 1; fi
