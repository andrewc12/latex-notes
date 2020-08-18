##
 # File Created: 2020-06-17
 # Author: Andrew Innes
 # -----
 # Last Modified: 2020-07-27
 # Modified By: Andrew Innes
 # -----
 # Purpose: Compile latex file
##

# Makefile Variables
PDFLATEX = /mnt/c/texlive/2020/bin/win32/pdflatex.exe
LATEX = /mnt/c/texlive/2020/bin/win32/latex.exe
DVIPNG = /mnt/c/texlive/2020/bin/win32/dvipng.exe
CFLAGS =  --shell-escape --enable-write18 -synctex=1 
#-interaction=nonstopmode
TEX = PHYS1006_Foundations_of_Physics


all: $(TEX).pdf

$(TEX).pdf: $(TEX).tex
	$(PDFLATEX) $(CFLAGS) $(TEX).tex

$(TEX).dvi: $(TEX).tex
	$(LATEX) -output-format=dvi '$(TEX).tex'

spell:
	cat '$(TEX).tex' | aspell list -l en_AU -t | awk '!mem[$$0]++'

png: $(TEX).dvi
	$(DVIPNG) -D 200 -T tight -norawps "$(TEX).dvi"

clean:
	rm -f $(TEX)*.png $(TEX).dvi $(TEX).aux $(TEX).log $(TEX).pdf


