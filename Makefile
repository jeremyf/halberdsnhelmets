GRAPHICS=$(wildcard ../Hellebarden und Helme/graphics/*.jpg)
LATEX=pdflatex
MAKEINDEX=makeindex
FILES=Halberds-and-Helmets.pdf Halberds-and-Helmets-Ref-Guide.pdf

all: ${FILES}

%.pdf: %.ltx ${GRAPHICS}
	${LATEX} $<
	${MAKEINDEX} `basename "$<" ".ltx"`.idx
	${LATEX} $<

clean:
	rm *.an \
	   *.aux \
	   *.idx \
	   *.ilg \
	   *.ind \
	   *.log \
	   *.out \
	   ${FILES}

test:
	perl test.pl
	lacheck Halberds-and-Helmets.ltx
	lacheck Halberds-and-Helmets-Ref-Guide.ltx
	CHkTex Halberds-and-Helmets.ltx
	ChkTex Halberds-and-Helmets-Ref-Guide.ltx

bisect:
	git bisect -halt-on-error -draft-mode Halberds-and-Helmets-Ref-Guide.ltx
