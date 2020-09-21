![Deploy website](https://github.com/larsvilhuber/book-test/workflows/Deploy%20website/badge.svg?branch=master)

#  Idea Handbook

This is the development area for the "Using Administrative Data for Research and Evidence-based Policy - A Handbook", supported by IDEA @ J-PAL.

## Structure

Development goes on in the `master` branch, which may therefore contain incomplete or preliminary documents. 

Peer-reviewed and sanctioned versions are available in the `published_version` branch. Only those are used to generate websites and printed documents. The subfolder `testing` within the branch will contain unofficial version prior to publication.


## Publishing

Creating a new published version is a manual process.

### Step 1: Define a version number

See our [versioning guide](96_00_contributing.Rmd).

### Step 2: Create a new version from the testing folder

Ensure that the testing folder is up-to-date (check if [Actions](actions/) might have failed). If it all looks fine, the creation is a simple rename. Command-line actions are below, but the same can be achieved by using the Github client, and renaming of the folder in Windows or Mac.

```
git checkout published_version
git mv testing (VERSION)
git push
```

### Step 3: Register the new version

This is currently a manual process:

- Go to [Actions](actions/)
- Select the "Set version and redirect"  workflow
- Choose the "Run workflow" option.

This will update and deploy the "index.html" and redirect to the highest published version.

### Step 4: Record new DOI for the handbook and chapters.

Each version gets new DOI, but they can record a link to the previous version. See our [DOI Registration Guide](_process/DOI_Registration.md).


## License

The content of the handbook is licenses under a CC-BY-NC license.

![CC-BY-NC](cc-by-nc.png)
