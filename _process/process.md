## Word to Rmd Process

### Step 1
Set working directory in powershell

### Step 2
Run .\cleanscript.ps1 $chaptername

For reference, cleanscript.ps1 contains the following:

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

### Step 3
Commit file_clean.md to main J-PAL repository in branch specific for that chapter (chapter branch)

### Step 4
Make a copy of file_clean.md called file.Rmd, commmit to chapter branch

### Step 5
Perform edits in R (e.g. edit tables, insert figures, etc)

### Step 6
Commit edits to chapter branch

### Step 7
Test build off chapter branch (can fork to Jim repository to avoid using main repository github page)

## Bibliography

Bibliography entries are added to the idea handbook zotero library (https://www.zotero.org/groups/2400539/ideahandbook/library).

Each chapter has its own folder in the library.

Use the desktop client with the "Better BibTex for Zotero" add-on to generate automatic citekeys in the AuthorYear format.

Bibliograhy is exported as ideahandbook.bib in BibTeX format with UTF-8 encoding into the root handbook directory.

## Build process for HTML

In principle, a Docker image is used with Github Actions to automatically build the website. However, as of Jan 21, 2021, the process uses too much memory to run in the cloud. Here's the generic (manual) process (see [main.yml](../.github/workflows/main.yml) for the similar cloud process)

- in the clone `book`:
```
./_process/test_w_docker.sh
sudo chown -R $(whoami) _book
```
- (for convenience) checkout the `published_version` into a separate directory:
```
git clone --depth 1 git@github.com:admindatahandbook/book.git -b published_version book_published_version
```
- in `book_published_version`:
```
\rm -rf testing
mv ../book/_book testing
git add testing
git commit -m "Pushing changes from $(cd ../book; git log | head -1)"
git push
```

## Build process for LaTeX

- in the clone `book`:
```
./_process/test_w_docker.sh
./_process/prepare_latex.sh push
```
which will push the LaTeX source to `book-latex/from_book` branch (not synced with Overleaf)
