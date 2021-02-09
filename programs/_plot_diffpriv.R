# Author: Jim Shen
# Description: This will generate various plots
#     for the Differential Privacy Chapter
###############################################

# Table 1: Risk

diffpriv_t1data<-read.csv("./assets/diffpriv/dp_table1.csv")

diffpriv_t1<-function() {
  if (is_html_output()) {
    diffpriv_t1data %>%
      kable("html", escape = F, caption="Maximal change between posterior beliefs in Gertrude's opt-out and real-world scenarios.
            The notation $A(x')$ refers to the application of the analysis $A$ on the dataset $x'$, which does not include Gertrude's
            information. As this table shows, the use of differential privacy provides a quantitative bound on how much one can 
            learn about an individual from a computation. The entries in the table are calculated using the formula 
            $q=min(e^{2\\varepsilon} q', 100-e^{-2\\varepsilon}(100-q'))$, where $q'$ is the posterior belief given $A(x')$ and
            $q$ is the upper bound on the posterior belief given $A(x)$, both expressed as percentages.",
            col.names = c("posterior belief given $A(x')$ in %","0.01",	"0.05",	"0.1",	"0.2",	"0.5",	"1"),
            booktabs=T) %>%
      kable_styling(full_width = F) %>%
      add_header_above(c(" "=1, "value of $\\varepsilon$"=6)) %>%
      column_spec(1, width="8em") %>%
      footnote(general="For each value of $\\varepsilon$, maximum posterior belief given A(x) in %",  general_title = " ")
      
  } else{}

}

# Table 2: Uses of DP

diffpriv_t2data<-data.frame(
           appropriate=c("Informational harm derives from making inferences about individuals or small groups",
                         "Intended use is statistical analysis of population or large groups",
                         "Sensitivity of information is high",
                         "Information and analyses are highly structured",
                         "Datasets are large",
                         "Types of analyses to be conducted are known in advance",
                         "Composition effects are important",
                         "Release of (low-dimensional) synthetic data is acceptable or preferred"),
           notappropriate=c("Informational harm derives from making inferences about large groups",
                            "Intended use is individual inference or individual intervention",
                            "Intended control is purpose limitation",
                            "Intended control is computation limitation<sup>1</sup>",
                            "Datasets are very small (e.g., less than a few dozen observations)",
                            "",
                            "",
                            ""),
           challenging=c("Supporting data linking",
                         "Supporting data cleaning",
                         "Estimating complex statistical models efficiently",
                         "Datasets are small (e.g., dozens to thousands of observations)<sup>2</sup>",
                         "Differentially private analysis not yet available",
                         "Intended output is high-dimensional synthetic data",
                         "",
                         "")
           )

diffpriv_t2<-function() {
  if (is_html_output()) {
    diffpriv_t2data %>%
      kable("html", escape = F, caption="Considerations when deciding whether to use differential privacy for a particular use case.",
            col.names = c("Use cases where DP is more likely to be appropriate","Use cases where DP is not appropriate","Use cases where DP is challenging"),
            booktabs=T) %>%
      kable_styling(full_width = F) %>%
      footnote(number=c("A control on computation is designed to ''limit the direct operations that can be meaningfully performed on data. Commonly used examples are file-level encryption and interactive analysis systems or model servers. Emerging approaches include secure multiparty computation, functional encryption, homomorphic encryption, and secure public ledgers, eg blockchain technologies.'' [@AltmanPracticalApproaches]",
                        paste0("For a real-world example, see the Opportunity Atlas case study presented in Section (ref:table-opportunity-atlas)")))
  } else{}
  
}

# Table 3: Summary Choices

diffpriv_t3data<-data.frame(
  model=c("*Trust Model*","*Data Publi-\ncation Model*","*Privacy Granu-\nlarity*","*Privacy Budget Alloca-\ntion*","*Utility Con-\nsidera-\ntions*"),
  dimensions=c("<ul><li>Central curator</li><li>Local collector</li></ul>",
               "<ul><li>Static</li><li>Interactive</li></ul>",
               "<ul><li>Unit of protection</li></ul>",
               "<ul><li>Allocation across uses</li><li>Allocation across groups</li><li>Allocation across measures</li></ul>",
               "<ul><li>Anticipating uses</li><li>Evaluating utility</li><li>Managing statistical uncertainty</li></ul>"),
  collection=c("<ul><li>Consent</li><li>Compliance: Information security</li><li>Measurement design</li><li>Compliance: Anonymization</li></ul>",
               "<ul><li>Measurement design</li></ul>",
               "<ul><li>Consent</li><li>Measurement design</li></ul>",
               "<ul><li>Consent</li></ul>",
               "<ul><li>Measurement design</li></ul>"),
  transformation=c("<ul><li>Data cleaning</li><li>Data linking</li></ul>",
                   "<ul><li>Data linking</li></ul>",
                   " ",
                   "<ul><li>Data cleaning</li></ul>",
                   "<ul><li>Data linkage</li></ul>"),
  retention=c("<ul><li>Compliance: Information security</li></ul>",
              "<ul><li>Costrs</li><li>Information security</li><li>Legal requirements</li></ul>",
              "",
              "",
              ""),
  access=c("<ul><li>Legal requirements</li><li>Range of uses</li></ul>",
           "<ul><li>Costs</li><li>Compliance: Information security</li><li>Range of uses</li><li>Usage tracking</li></ul>",
           "<ul><li>Range of uses</li></ul>",
           "<ul><li>Usage tracking</li></ul>",
           "<ul><li>Range of uses</li></ul>"),
  postaccess=c("<ul><li>Deaccessioning & disposal</li><li>Information security</li><li>Legal requirements</li><li>Replicability & verification</li><li>Preservation</li></ul>",
               "<ul><li>Costs</li><li>Compliance: Information security</li><li>Compliance: Reporting and correction</li><li>Replicability & verification</li><li>Preservation</li></ul>",
               "",
               "<ul><li>Use & use auditing</li></ul>",
               "<ul><li>Utility evaluation</li></ul>")
           
)


diffpriv_t3<-function(){
  if (is_html_output()) {
    diffpriv_t3data %>%
      kable("html", escape = F, caption="Choices in how differential privacy is applied and implemented have substantial implications for data collection, curation, protection, preservation and reuse.",
            col.names = c("","Key Dimensions","Collection","Transformation","Retention","Access","Post-Access"),
            booktabs=T) %>%
      kable_styling(full_width = F, font_size=11) %>%
      scroll_box(width="100%")
  } else{}
}

# diffpriv_t3<-function(){
#   pander::pander(diffpriv_t3data,
#                  keep.line.breaks = TRUE,
#                  style = 'grid',
#                  justify = 'left',
#                  split.cells = c(2,5,5,5,5,5,5),
#                  split.tables=300,
#                  #use.hyphening = TRUE,
#                  col.names = c("","Key Dimensions","Collection","Transformation","Retention","Access","Post-Access"),
#                  caption = '(\\#tab:diffprivtable3) Choices in how differential privacy is applied and implemented have substantial implications for data collection, curation, protection, preservation and reuse.')
# }



# Table 4: Case Studies

diffpriv_t4data<-data.frame(
  casestudy=c("*2020 Decennial Census*","*The Opportunity Atlas*","*Dataverse Repositories*"),
  risks=c("**Sensitivity:** Data subject to stringent statutory protections. Trust in confidentiality critical to collecting sensitive information from respondents.<br/><br/>
          **Risks:** Concerns about composition effects and reconstruction attacks motivated adoption of DP.",
          "**Sensitivity:** Data subject to stringent statutory protections.<br/><br/>
          **Risks:** Prior methods of de-identification and redaction judged not to sufficiently mitigate risk.",
          "**Sensitivity:** General-purpose system designed to support analyses of data of varying degrees of sensitivity.<br/><br/>
          **Risks:** Vary by data source. DP provides stronger mechanism to mitigate risk than pre-deposit redaction and deidenfication."),
  access=c("Part of a tiered access system that has historically included custom tabulations service for institutional clients; and Research Data Centers for access by vetted individuals to private data.",
           "Original data sources remain available to vetted users through federal Restricted Data Center mechanism.",
           "Part of a tiered access model that also supports access to private data with vetting and restricted license."),
  trust=c("Curator model, based on prior data collection design, with cleaning before DP applied.<br/><br/>
          Focus on non-interactive publication of tables.",
          "Curator model applied to previously collected data, with cleaning and linkage (between Census and IRS data) before DP-like methods applied.",
          "Curator model, based on previously collected and deposited data.<br/><br/>
          Supports both non-interactive releases of summary statistics and interactive queries."),
  budget=c("Must allocate budget and optimize accuracy for broad range of current and future analyses.",
           "Budget analysis focused on balancing privacy vs. societal utility, leading to choice of a rather large epsilon.",
           "Provides recommended choices of epsilon based on sensitivity of data.<br/><br/>
           Choice to allow per-analyst budgets requires semi-trusted and accountable analysts."),
  estimating=c("Adopting DP has made noise addition explicit, whereas data users had previously treated Census tables as if they have no error.",
               "Designed to produce uncertainty estimates (taking privacy noise into account) together with quantities of interest, and estimates also calculated in a DP-like manner.",
               "Important to expose uncertainty estimates from noise due to privacy, both before and after release."),
  granularity=c("Focused both on individuals and households, as appropriate to data measurement design.",
                "Focused on individuals.",
                "Determined by data depositor.")
  )

diffpriv_t4<-function(){
  if (is_html_output()) {
    diffpriv_t4data %>%
      kable("html", escape = F, caption="Design choices in case study implementations of differential privacy.",
            col.names = c("Case Study","Risks & Sensitivity","Tiered Access Controls","Trust & Publication Models","Budget Allocation","Estimating Uncertainty","Granularity"),
            booktabs=T) %>%
      kable_styling(full_width = F, font_size=11) %>%
      scroll_box(width="100%")
  } else{}
}