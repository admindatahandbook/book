# Notes on Handbook

## Classifying for 5 Safes
- For each case study, ask authors to rank the 5 safe-aspects of their project. 
> "All projects are safe, but the reliance on the various dimensions of the 5 safes framework may differ"
- Safe settings can range from "Open Access download - 1" to "On-premise disconnected safe room - 5". Please classify your project.
- Safe people can range from "Unauthenticated user on internet - 1" to "Background check/police report for citizens only - 5"
- Safe projects can be "Simple data use agreement - 1" to "Authorization by top official/ minister - 5"
- Safe data can be "No perturbation to data (includes identifiers) - 1" to "Strong anonymization techniques - 5"
- Safe outputs can be "No perturbation to outputs - 1" to "Strong perturbation and human vetting - 5"

### Technical implementation
In the YAML metadata at the top of each Rmd file, a section
```
- fivesafes:
  - settings: 1
  - people: 2
  - projects: 3
  - data: 4
  - outputs: 5
```
is added. R programs will process these:
- parse data
- write data to Rds data file (identify chapter)
- create a spider graph for each chapter, to be inserted after introduction.

In addition, a R collector program needs to collect all of these, and produce a selector widget that can be used in the overall introduction/structure chapter to select chapters that satisfy selection criteria (5 levers). 
- This may mean that two rounds of processing are necessary (depending on what can be done with standard bookdown)