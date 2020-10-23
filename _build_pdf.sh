#!/bin/bash

set -ev
LATEX=pdflatex
FILE=test_evan
OUTFILE=handbook_color_$(date +%F).pdf
OUTFILEBW=handbook_bw_$(date +%F).pdf
OUTDIR=_pdf

skip=no
publish=no

if [ -z $1 ]
then
   skip=no
   publish=no
else
   case $1 in 
     skip|s)
      skip=yes
      ;;
    publish|p)
      publish=yes
      ;;
    esac
fi

cd $(dirname $0)

[ -f $FILE.pdf ] && rm -f $FILE.pdf

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
   echo "::: Running R"
   [ "$publish" == "yes" ] && Rscript programs/build_pdf.R 
   [ "$publish" == "no"  ] && Rscript programs/build_pdf.R > _R.log 2>&1

# These are still needed
echo "::: Running fixes"
sed -i 's/\\part{/\\partline{/' _main.tex

# Fix the index terms
# Needs "index_term_mapping.csv"

mv _main.tex _main_pre_index.tex

echo "::: Processing indexing"
python3 programs/map_index.py -i _main_pre_index.tex -o _main.tex

fi 
# end of skip setup

# now compile it
echo "::: Running latex"
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
[ "$publish" == "no"  ] && $LATEX ${FILE}.tex > _tex.log 2>&1
[ "$publish" == "yes" ] && $LATEX ${FILE}.tex 

if [ -f ${FILE}.pdf ]
then
  echo "Success."
  echo "::: Renaming file"
  mv ${FILE}.pdf ${OUTFILE}
  # convert to greyscale
  echo "::: Converting to grayscale"
  programs/pdf_to_grayscale.sh -i ${OUTFILE} -o ${OUTFILEBW}
else
  echo "Failure to create PDF"
  exit 2
fi

if [ "$publish" == "yes" ]
then
  echo "::: Creating publication folder $OUTDIR"
  [ -d $OUTDIR ] || mkdir $OUTDIR
  cp $OUTFILE $OUTDIR/
  cp $OUTFILEBW $OUTDIR/
fi
