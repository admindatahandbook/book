#!/bin/sh

set -ev
LATEX=xelatex
FILE=test_evan2

cd $(dirname $0)

# set up the environment
Rscript programs/bootstrap.R

if [ -f _main.Rmd ]
then
  echo "Removing old file"
  rm -f _main.Rmd
fi 
# build the handbook
Rscript programs/build_pdf.R > _R.log 2>&1

# post-processing
# For some reason, these appear in the tex files
sed -i 's/NULL//' _main.tex
sed -i 's/\\chapter\*{(PART) /\\part*{/' _main.tex
sed -i 's/\\chapter\*{(APPENDIX) /\\part*{/' _main.tex
#sed -i 's/^\\chapter{/\putbib\n\\chapter{/' _main.tex 
sed -i 's/\\addcontentsline{toc}{chapter}{(PART) /\\partline{/' _main.tex
sed -i 's/\\addcontentsline{toc}{chapter}{(APPENDIX) /\\partline{/' _main.tex

# now compile it

$LATEX ${FILE}.tex > _tex.log 2>&1
#bibtex ${FILE}     > _bib.log 2>&1 || echo "Completed bibtex with an error"
[ -f _bib.log ] && rm _bib.log
for arg in 21 22 23 24
do
  [ -f bu${arg}.aux ] && rm bu${arg}.aux
done
for arg in $(ls bu*aux)
do
	bibtex $arg >> _bib.log 2>&1 || echo "Completed bibtex with an error"
done
$LATEX ${FILE}.tex > _tex.log 2>&1
$LATEX ${FILE}.tex > _tex.log 2>&1
$LATEX ${FILE}.tex > _tex.log 2>&1

if [ -f ${FILE}.pdf ]
then
  echo "Success."
  mv ${FILE}.pdf handbook_$(date +%F).pdf
fi

