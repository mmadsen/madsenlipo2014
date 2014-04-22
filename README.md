madsenlipo2014-semanticaxelrod
==============================

Data, analysis, paper, and presentation for **Behavioral Modernity and the Cultural Transmission of Structured Information: The Semantic Axelrod Model**.  


## Simulation Code ##

The analysis reported here uses code from the [axelrod-ct](https://github.com/mmadsen/axelrod-ct) codebase, and specifically the analysis in our paper uses Version 2.0.  

You can download this without using Git given the zip and tar.gz links at:

(https://github.com/mmadsen/axelrod-ct/releases/tag/v2.0)


## Subdirectories ##

* paper:  contains Rmarkdown manuscript file and supporting LaTeX infrastructure
* explorations:  contains IPython notebooks, sample graphs, Mathematica notebooks, and other tests that led to the analysis performed here.
* analysis:  contains R project file and R code for analyses of simulation data
* presentation: contains our SAA2014 presentation in Keynote format and PDF
* simulations:  contains the actual JSON configuration files for the simulations performed here, which led to the data and analysis.  Also contains minor scripts for watching simulations, etc.  
* outline:  a fragmentary LaTeX outline for the paper.  Not up to date as of 4/20/14.

## Paper Manuscript ##

The paper manuscript is written in Rmarkdown, to simplify collaboration and embedding of R analyses, graphs, images, and tables.  The "Makefile" here governs the building of the actual paper, and is theoretically capable of generating Microsoft Word or other formats, but Latex is the one I've tested here. 

The Rmarkdown formatting contains NONE of the heavy LaTeX setup, which is contained instead in a file `author.tex`, which I recommend not editing except for title, abstract, or author contact details.  This template file follows `svmult` from Springer for edited volumes.

Citations in the Rmarkdown file refer to the Bibtex citation keys in the `madsenlipo2014-semanticaxelrod.bib` file, and are made in Pandoc markdown format:  `[@Lipo1997]` is the in-text citation to Lipo, Madsen, Hunt, and Dunnell 1997, for example.  The bibliography is automatically built by Latex/XELatex itself.  

Knitr is used to automatically turn the combination of Rmarkdown and R language chunks into LaTeX, which is then handed off to xelatex by the Makefile, generating a PDF.  You can re-run `make` or `make pdf` many times, and it'll pick up things that have changed (e.g., the manuscript, the bibliography, a figure or table, and recompile the whole thing.)  `make clean` is used to remove all of the temporary and intermediate files, which is good to do before running `git add` or `git commit`.  I have a fairly comprehensive set of rules in `.gitignore` for keeping Latex intermediate cruft out of Github, but occasionally some new temp file sneaks through...


## Data Location ##

The raw data are not located here.  This is inconvenient, but it's a limitation of Github that we simply
can't include large data files.  Inside the `analysis` directory, there is a script called `data_preparation.r` which reads CSV files from each simulation node, combines them into various binary R data files (which are considerably smaller, but still often above the Github limit), and then calculates some simple column combinations which aren't worth doing in the simulation itself.  

The simulation data are archived on Amazon S3 at: 

https://semanticaxelrod.s3.amazonaws.com/rawdata/README
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa-full.rda
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa1-sampled.csv
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa12-full.rda
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa2-sampled.csv
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa3-sampled.csv
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa34-full.rda
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa4-sampled.csv
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa5-sampled.csv
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa56-full.rda
https://semanticaxelrod.s3.amazonaws.com/rawdata/saa6-sampled.csv

Place these files at ~<username>/local-research/semanticaxelrod/rawdata if you want the 
scripts in `analysis` to work without change, or modify the paths in the R scripts if necessary.

