$file = $args[0]

$tex = ".tex"
$convertmd = "_convert.md"
$cleanmd = "_clean.md"
$rmd = ".Rmd"
$diffpriv = "diffpriv"

pandoc $file$tex -t markdown --atx-headers --wrap=none -s -o $file$convertmd

(Get-Content $file$convertmd) | Foreach-Object {
    $_ -replace [regex]::Escape("\|"), "|" `
       -replace [regex]::Escape("\["), "[" `
       -replace [regex]::Escape("\]"), "]" `
       -replace [regex]::Escape("\@"), "@" `
       -replace [regex]::Escape("(<"), "(" `
       -replace [regex]::Escape(">)"), ")" `
       -replace [regex]::Escape(" "), " " `
       -replace [regex]::Escape("[^"), "[^$diffpriv"
    } | Out-File $file$cleanmd

Copy-Item $file$cleanmd -Destination $diffpriv$rmd