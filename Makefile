.PHONY: examples

<<<<<<< HEAD
# test:
# 	cd examples/ ; for f in *.tex; do xelatex $$f; done

NAME  = resume-en
SHELL = bash
PWD   = $(shell pwd)

all: text clean

clean:
	rm -f *.{acn,acr,alg,aux,bbl,blg,fls,glg,glo,gls,glsdefs,hd,idx,ilg,ind,ins,ist,log,loa,loe,lof,lot,mw,nav,out,sbl,snm,sym,toc,xdy,fdb_latexmk,gz}

text:
#ifeq '$(OS)' 'GNU/Linux'
	xelatex -synctex=1 -interaction=nonstopmode $(NAME).tex
#else
	# Works on El Captain
#	"/Library/TeX/texbin/xelatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
#endif
	test -e $(NAME).pdf && mv $(NAME).pdf CV-en.pdf
=======
CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
>>>>>>> upstream/master
