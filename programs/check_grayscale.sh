#! /bin/bash
#
# Simple script that converts color pdf to grayscale one using Ghostscript.
# 
# Source: https://gist.github.com/mratkovic/9ded81a6dd7124dc9964

verbose_usage_and_exit() {
	echo "Invalid call"
	echo "pdf_to_grayscale.sh -o <out_pdf> "
	echo -e "\t\tvalidation, prints ink coverage of CMYK for each page"
	echo -e "\t\tShould be '0.00000 0.00000 0.00000 0.XXXXX CMYK OK' for all pages"
	exit -1
}

VALIDATE=true

while getopts ":i:o:v" o; do
    case "${o}" in
        o)
            OUT=${OPTARG};;
        *)
            verbose_usage_and_exit;;
    esac
done

if  [ -z "$OUT" ]; then
    verbose_usage_and_exit
fi


# Ghostscript device called inkcov (Ghostscript v9.05 or newer).
# It displays the ink coverage of CMYK for each single page
# (for RGB colors, it does a internal conversion to CMYK)
if "$VALIDATE"; then
	gs  -o - -sDEVICE=inkcov $OUT
fi
