
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
