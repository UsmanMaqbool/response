default: response.pdf sample-responses.pdf

response.pdf: response.cls
	pdflatex response.dtx
	makeindex -s gglo.ist -o response.gls response.glo
	makeindex -s gind.ist -o response.ind response.idx
	pdflatex response.dtx

response.cls: response.ins response.dtx
	pdflatex response.ins

sample-responses.pdf: sample-responses.tex response.cls
	pdflatex sample-responses.tex
	pdflatex sample-responses.tex

clean:
	rm -f *.aux *.bbl *.blg response.glo response.gls response.idx response.ilg response.ind *.log *.out *.synctex.gz response.toc

cleanall: clean
	rm -f response.pdf response.cls sample-responses.pdf

