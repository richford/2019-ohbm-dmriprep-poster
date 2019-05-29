.PHONY: all clean spell poster.pdf

all: poster.pdf
LATEX="xelatex -interaction=nonstopmode"
TEX_FILES = $(wildcard *.tex)
spell: $(addsuffix .spchk,$(basename $(TEX_FILES)))

%.spchk: %.tex
	@aspell --lang=en --home-dir=. --personal=dictionary.txt -t -c $< 

poster.pdf: poster.tex
	latexmk -f -pdf -pdflatex="$(LATEX)" -use-make $<

clean:
	latexmk -CA
