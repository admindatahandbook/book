[![Build Status](https://travis-ci.com/labordynamicsinstitute/idea-handbook.svg?token=dymVQ2THToP9nG5TA1TP&branch=master)](https://travis-ci.com/labordynamicsinstitute/idea-handbook)

#  Idea Handbook

This is the development area for the  Handbook on Administrative Data Access, supported by IDEA @ J-PAL.

## Structure

The website is served from the `gh-pages` branch, and accessible under the TBD domain name.

Development goes on in the `master` branch, which may therefor contain incomplete or preliminary documents. 

Peer-reviewed and sanctioned versions are available in the `published_version` branch. Only those are used to generate websites and printed documents. 

```
git checkout published_version
git merge -ff master
git push 
```

## License

The content of the handbook is licenses under a CC-BY-NC license.

![CC-BY-NC](cc-by-nc.png)
