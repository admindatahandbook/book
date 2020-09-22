#!/bin/bash

case $(uname) 
in 
  Darwin)
  pandoc_bin=/Applications/RStudio.app//Contents/MacOS/pandoc/pandoc 
  ;;
  Linux)
  pandoc_bin=$(which pandoc)
  ;;
  *)
  echo "Don't know how to do that"
  exit
  ;;
esac

echo "Path for pandoc: ${pandoc_bin}"
if [[ -z $1 ]]
then
    echo " $0 infile"
    exit 
fi

infile=$1
basefile=$(basename $1 .md)
outfile=${basefile}.docx

if [[ ${infile} == ${basefile} ]]
then
   echo "Need Markdown file (ending in .md)"
   echo "You provided $infile"
   exit
fi

[[ -f ${outfile} ]] && \rm -i ${outfile}

${pandoc_bin} $infile -f markdown -t docx -o ${basefile}.docx

[[ -f ${outfile} ]] && echo "Success: ${outfile}" || echo "Something went wrong. ${infile} -> ${outfile}"

