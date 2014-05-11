.PHONY : clean

pdf:
	./knit pdf
	pandoc -s -S --biblio madsenlipo2014-semanticaxelrod.bib madsenlipo2014-semanticaxelrod.md --template=author.tex --latex-engine=xelatex -o madsenlipo2014-semanticaxelrod.tex --natbib --number-sections --listings
	latexmk -pdf madsenlipo2014-semanticaxelrod
	open -a /Applications/Skim.app madsenlipo2014-semanticaxelrod.pdf


github:
	./knit github
	pandoc -s -S --biblio madsenlipo2014-semanticaxelrod.bib madsenlipo2014-semanticaxelrod.md -o madsenlipo2014-semanticaxelrod_github.md

md:
	pandoc -s -S --biblio madsenlipo2014-semanticaxelrod.bib madsenlipo2014-semanticaxelrod.md -o madsenlipo2014-semanticaxelrod.md

odt:
	./knit docx
	pandoc -s -S --biblio madsenlipo2014-semanticaxelrod.bib madsenlipo2014-semanticaxelrod.md --reference-odt=reference.odt -o madsenlipo2014-semanticaxelrod.odt


docx:
	./knit docx
	pandoc -s -S --biblio madsenlipo2014-semanticaxelrod.bib madsenlipo2014-semanticaxelrod.md --reference-docx=reference.docx -o madsenlipo2014-semanticaxelrod.docx



epub:
	./knit epub
	pandoc -s -S --biblio madsenlipo2014-semanticaxelrod.bib madsenlipo2014-semanticaxelrod.md -o madsenlipo2014-semanticaxelrod.epub


clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md madsenlipo2014*.pdf *.docx madsenlipo2014-semanticaxelrod.tex *.epub
