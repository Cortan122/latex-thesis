FILES=$(wildcard images/*.png includes/* parts/*.tex parts/*.bib tz-parts/*.tex)
PDFS=main.pdf tp.pdf pmi.pdf tz.pdf ro.pdf noadditions.pdf

all: $(PDFS)

$(PDFS): $(FILES)

%.pdf: %.tex
	pdflatex --shell-escape --interaction=nonstopmode $(basename $@)
	biber $(basename $@)
	pdflatex --shell-escape --interaction=nonstopmode $(basename $@)
	pdflatex --shell-escape --interaction=nonstopmode $(basename $@)

clean:
	rm -f indent.log *.log *.aux *.toc *.atfi *.out *.pytxcode *.bbl *.bcf *.blg *.ptc *.run.xml

