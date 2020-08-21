# Word to Rmd Process

## Step 1
Set working directory in powershell

## Step 2
Run .\cleanscript.ps1 $chaptername

For reference, cleanscript.ps1 contains the following:

$file = $args[0]

$docx = ".docx"
$convertmed = "_convert.md"
$cleanmd = "_clean.md"

pandoc $file$docx -f docx -t markdown --atx-headers --wrap=none -s -o $file$convertmd

(Get-Content $file$convertmd) | Foreach-Object {
    $_ -replace [regex]::Escape("\|"), "|" `
       -replace [regex]::Escape("\["), "[" `
       -replace [regex]::Escape("\]"), "]" `
       -replace [regex]::Escape("\@"), "@" `
       -replace [regex]::Escape("(<"), "(" `
       -replace [regex]::Escape(">)"), ")"
    } | Out-File $file$cleanmd

## Step 3
Commit file_clean.md to main J-PAL repository in branch specific for that chapter (chapter branch)

## Step 4
Make a copy of file_clean.md called file.Rmd, commmit to chapter branch

## Step 5
Perform edits in R (e.g. edit tables, insert figures, etc)

## Step 6
Commit edits to chapter branch

## Step 7
Test build off chapter branch (can fork to Jim repository to avoid using main repository github page)