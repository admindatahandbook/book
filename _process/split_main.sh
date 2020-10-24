#!/bin/bash
# Splitting _main.tex into pieces, and checking for integrity

infile=_main.tex
builddir=_latex
outdir=$builddir/chapters

[ -d $outdir ] || mkdir -p $outdir

lines=$(grep -nE '\\chapter|\\partline|\\frontmatter|\\backmatter|\\mainmatter' $infile | \
    sed 's/\\//' |\
    sed 's/label{/:/;s/}}//')
nlines=$(cat $infile | wc -l)
echo "$lines" | awk -F: ' { print $NF } ' > _tags
echo "$lines" | \
  awk -v nlines=$nlines -F: ' NR>1{$2=end + 1} 
                             { line=$1 ; start = $2 ; end = line - 2 } 
                             NR>1{ print line , start, end } 
                             END { print "end", end + 1 ,  nlines } ' |\
  awk ' { print $2, $3 } ' > _nums

# build the program
paste -d' ' _nums _tags > _joins 
cat _joins| \
    awk -v infile=$infile -v outdir=$outdir \
        '   NR>9 { print "sed -n \"" $1 "," $2 "p\" " infile " > " outdir "/"  NR "_" $3 ".tex" } 
            NR<10{ print "sed -n \"" $1 "," $2 "p\" " infile " > " outdir "/0" NR "_" $3 ".tex" } ' > _split

# now execute it
chmod +x _split
./_split

# check that it worked

cat $outdir/[0-2]*.tex > _tmp
diff -q _tmp $infile 
case $? in
   0)
    echo "::: Split OK" 
    cat _joins
    ;;
   *)
    echo "Problem. Check files for differences"
    exit 2
    ;;
esac

# clean up
rm _split _tags _nums _tmp _joins
