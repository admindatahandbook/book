$file = $args[0]

$docx = ".docx"
$convertmd = "_convert.md"
$cleanmd = "_clean.md"
$rmd = ".Rmd"

pandoc $file$docx -f docx -t markdown --atx-headers --wrap=none -s -o $file$convertmd

(Get-Content $file$convertmd) | Foreach-Object {
    $_ -replace [regex]::Escape("\|"), "|" `
       -replace [regex]::Escape("\["), "[" `
       -replace [regex]::Escape("\]"), "]" `
       -replace [regex]::Escape("\@"), "@" `
       -replace [regex]::Escape("(<"), "(" `
       -replace [regex]::Escape(">)"), ")"
    } | Out-File $file$cleanmd

Copy-Item $file$cleanmd -Destination $file$rmd