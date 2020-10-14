#! /bin/bash
#
# Simple script that converts color pdf to grayscale one using Ghostscript.
# 
# Source: https://gist.github.com/mratkovic/9ded81a6dd7124dc9964

verbose_usage_and_exit() {
	echo "Invalid call"
	echo "pdf_to_grayscale.sh -i <in_pdf> -o <out_pdf> [OPTIONS]"
	echo -e "\t-v"
	echo -e "\t\tvalidation, prints ink coverage of CMYK for each page"
	echo -e "\t\tShould be '0.00000 0.00000 0.00000 0.XXXXX CMYK OK' for all pages"
	exit -1
}

VALIDATE=false

while getopts ":i:o:v" o; do
    case "${o}" in
        i)
            IN=${OPTARG};;
        o)
            OUT=${OPTARG};;
        v)
            VALIDATE=true;;
        *)
            verbose_usage_and_exit;;
    esac
done

if [ -z "$IN" ] || [ -z "$OUT" ]; then
    verbose_usage_and_exit
fi

gs \
 -sOutputFile=$OUT \
 -sDEVICE=pdfwrite \
 -sColorConversionStrategy=Gray \
 -dProcessColorModel=/DeviceGray \
 -dCompatibilityLevel=1.4 \
 -dPDFUseOldCMS=false \
 -dNOPAUSE \
 -dBATCH \
 $IN

# Ghostscript device called inkcov (Ghostscript v9.05 or newer).
# It displays the ink coverage of CMYK for each single page
# (for RGB colors, it does a internal conversion to CMYK)
if "$VALIDATE"; then
	gs  -o - -sDEVICE=inkcov $OUT
fi
