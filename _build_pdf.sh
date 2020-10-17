#!/bin/sh

set -ev
LATEX=pdflatex
FILE=test_book
OUTFILE=handbook_color_$(date +%F).pdf
OUTFILEBW=handbook_bw_$(date +%F).pdf

if [ -z $1 ]
then
   skip=no
else
   skip=yes
fi

cd $(dirname $0)

# set up the environment
Rscript programs/bootstrap.R

if [ -f _main.Rmd ]
then
  echo "Removing old file"
  rm -f _main.Rmd
fi 
# build the handbook

if [ "$skip" == "no" ]
then
   Rscript programs/build_pdf.R > _R.log 2>&1
fi

# post-processing
# For some reason, these appear in the tex files when running as latex_fragment
#sed -i 's/NULL//' _main.tex
#sed -i 's/\\chapter\*{(PART) /\\part*{/' _main.tex
#sed -i 's/\\chapter\*{(APPENDIX) /\\part*{/' _main.tex
#sed -i 's/^\\chapter{/\putbib\n\\chapter{/' _main.tex 
#sed -i 's/\\addcontentsline{toc}{chapter}{(PART) /\\partline{/' _main.tex
#sed -i 's/\\addcontentsline{toc}{chapter}{(APPENDIX) /\\partline{/' _main.tex
# fix bad reference translations
#sed -i -E 's/@ref\(fig(.+)\)/\\ref{fig\1}/g' _main.tex 

# These are still needed

sed -i 's/\\part{/\\partline{/' _main.tex
#sed -i 's/\\addcontentsline{toc}{chapter}{(APPENDIX) /\\partline{/' _main.tex

# Fix the index terms
# Needs "index_term_mapping.csv"

mv _main.tex _main_pre_index.tex

python3 map_index.py -i _main_pre_index.tex -o _main.tex

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
makeindex ${FILE}
$LATEX ${FILE}.tex > _tex.log 2>&1
$LATEX ${FILE}.tex > _tex.log 2>&1
$LATEX ${FILE}.tex > _tex.log 2>&1

if [ -f ${FILE}.pdf ]
then
  echo "Success."
  mv ${FILE}.pdf ${OUTFILE}
  # convert to greyscale
  programs/pdf_to_grayscale.sh -i ${OUTFILE} -o ${OUTFILEBW}
fi

