all: compile

compile: clean pdfclean article-es.pdf article-en.pdf

article-es.pdf:
	sed -i 's/\\entrue/\\estrue/g' article.tex
	pdflatex article.tex
	bibtex article.aux
	pdflatex article.tex
	pdflatex article.tex
	mv article.pdf article-es.pdf

article-en.pdf:
	sed -i 's/\\estrue/\\entrue/g' article.tex
	pdflatex article.tex
	bibtex article.aux
	pdflatex article.tex
	pdflatex article.tex
	cp article.pdf article-en.pdf

pdfclean:
	- rm -f article*.pdf

clean:
	- rm -f *.log
	- rm -f *.soc
	- rm -f *.toc
	- rm -f *.aux
	- rm -f *.out
	- rm -f main.idx
	- rm -f *.bbl
	- rm -f *.bbg
	- rm -f *.dvi
	- rm -f *.blg
	- rm -f *.lof
	- rm -f *.nav
	- rm -f *.snm
	- rm -f *~

cite:
	cite article.tex ../../bibliografia/Gaming/gaming.bib

jss-article-tex.zip:
	wget https://www.jstatsoft.org/public/journals/1/jss-article-tex.zip
