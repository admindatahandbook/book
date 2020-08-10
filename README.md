![Deploy website](https://github.com/larsvilhuber/admindatahandbook/workflows/Deploy%20website/badge.svg)

#  Idea Handbook

This is the development area for the "Using Administrative Data for Research and Evidence-based Policy - A Handbook", supported by IDEA @ J-PAL.

## Structure

Development goes on in the `master` branch, which may therefore contain incomplete or preliminary documents. 

Peer-reviewed and sanctioned versions are available in the `published_version` branch. Only those are used to generate websites and printed documents. Creating a new published version is a manual process.

```
git checkout published_version
git merge -ff master
git push 
```

The website is served from the `gh-pages` branch, and accessible under the TBD domain name. Only version pushed to `published_version` are made available in the `gh-pages` branch. 


## License

The content of the handbook is licenses under a CC-BY-NC license.

![CC-BY-NC](cc-by-nc.png)
