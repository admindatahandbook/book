#### San Francisco Unified School District (SFUSD)-Stanford Partnership

```{r, echo=FALSE, fig.width=5, fig.height=2}
plot(sfusd,3,3,3,3,3)

```

In the SFUSD-Stanford Partnership, SFUSD uses the CEPA Data Warehouse as an intermediary third-party data custodian that ultimately transfers a restricted set of data to the researcher via [Google Drive][Cloud Service] and stored on Stanford [servers][on-site storage], which includes deidentified individual level data on SFUSD students and staff. The location of the analysis computers and the data are therefore at the researcher. Computers used to analyze SFUSD data are subject to Stanford and SFUSD requirements for data security, including enterprise operating system management and [whole disk encryption][encryption] for any device that holds the data. Otherwise, the researchers have a high degree of agency over the analysis computer. The access locations are low security; researchers must take reasonable measures to physically protect the data but there are no specific requirements or checks on the location of the data itself. Typically this takes the form of storing the researcher's computer in a locked office, although in the case of graduate student researchers the offices may be shared. The analysis methods are unrestricted, with researchers being able to use any set of statistical software that they can acquire for analysis.

The data access mechanism in the SFUSD-Stanford Partnership only requires one full time data manager at the data custodian to maintain the infrastructure and data transfers, with additional support from a staff member at the data provider and university IT staff. The encrypted storage and computer security measures guard against physical or electronic access by adversarial actors as well as safeguarding the data in the event that a researcher loses their computer. There is no direct monitoring of researchers; the partnership relies on the enforcement of the data use agreements to guard against the misuse of data.

#### New Brunswick Institute for Research, Data and Training (NB-IRDT)

```{r, echo=FALSE, fig.width=5, fig.height=2}
nbirdt = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(2,2,1,1,2))
plot(nbirdt)
```

The NB-IRDT serves as a third party data custodian for the Province of New Brunswick to make deidentified personal and personal health data available to researchers. The data and analysis computers are located at the central NB-IRDT facility. Researchers must also travel to NB-IRDT data centers to access the data; the access computers are thus located at the non-researcher data custodian. Researchers use [thin clients] to remotely access data from a central server, and store their data on a local server at the specific facility that the researcher is at. Researchers have medium agency over the analysis computers, with access to common statistical programs and can request other software packages. NB-IRDT utilizes high security access locations, with researchers performing their research in [secure rooms]; protections include restricting mobile devices and outside materials, physical controls on the servers and workstations, and having dedicated fiber optics cables to handle data connections between the central and satellite locations. The NB-IRDT allows researchers unrestricted analysis methods, relying on manual disclosure control to ensure safe outputs.

The NB-IRDT requires over two dozen staff^[https://www.unb.ca/nbirdt/about/team.html] located at the data custodian, including multiple data analysts, system administrators, and other technical staff to set up and maintain the data access mechanism. The high security for the access location and the protections around it's analysis computers prevents adversarial actors from gaining physical or electronic access to the data and also allows for the close monitoring of researchers to prevent the misuse of data.

#### Institute for Employment Research (RDC-IAB)

```{r, echo=FALSE, fig.width=5, fig.height=2}
iab1 = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(2,1,2,1,2))
plot(iab1)
```

The RDC-IAB acts as a third-party data custodian for the German Federal Employment Agency. The RDC-IAB uses three different access models, each with its unique implementation. Notably, the RDC-IAB uses different access models for different sets of data; more sensitive data is subject to greater protections while maintaining usability for researchers.

The most restrictive access method is RDC-IAB on-site access, which makes deidentified individual data available to researchers. In this model, the RDC-IAB (acting as the third-party data custodian) maintains the data and analysis computers. Researchers have low agency over the analysis computers, being restricted to approved statistical software; other user provided software is not allowed, and third-party packages for approved software must be approved and installed by RDC-IAB staff. The access computers are located at the RDC-IAB itself or guest RDCs acting as third-party access providers, consisting of secured workstations at RDC-IAB and [thin clients] at its guest RDCs. The access locations are subject to high security, with physical monitoring of researchers. There are limited restrictions on the analysis methods available within the RDC-IAB access mechanism, with certain Stata commands unavailable to researchers.

```{r, echo=FALSE, fig.width=5, fig.height=2}
iab2 = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(2,2,3,3,2))
plot(iab2)
```

In the RDC-IAB JoSuA remote execution system, researchers can still utilize the same microdata but cannot view the data directly. Researchers are limited to viewing the deidentified output from their analysis. This allows the RDC-IAB to relax the controls around the access computers and locations; researchers can utilize their own computers to use the JoSuA interface, and there are no restrictions on access locations. The data and analysis computer remains located with the RDC-IAB, and researchers are subject to the same limitations on their agency over analysis computers and available analysis methods.

```{r, echo=FALSE, fig.width=5, fig.height=2}
iab3 = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(3,3,3,2,3))
plot(iab3)
```

The RDC-IAB also makes data products available for direct download by researchers using a [secure download platform][secure network protocols], which are further anonymized variants of the microdata available in the other two access methods. In this mechanism, the researcher's institution acts as the data custodian by hosting the data and the analysis computer, with the researcher's institution having high agency over the analysis computer. The access computers and access location are also at the researcher's institution. The RDC-IAB data use agreement for downloading the scientific use files requires a medium security access location, with the building and room required to have some level of access control or monitoring against unauthorized access; options range from receptionists and security guards to admission simple key locks. Note also that scientific use data can only be accessed by European research institutions, though this is a restriction on safe people.

The RDC-IAB has a staff of over two dozen people^[https://www.iab.de/839/section.aspx/Bereichsnummer/17], not counting staff at guest RDCs. Each data center requires at least one staff member, as well as additional staff to maintain the data products and approve projects. The RDC-IAB protects the data and analysis computers from unauthorized access either by maintaining control itself or by mandating strong security around them when in the custody of researchers. In instances where users can view the data directly, the RDC-IAB also relies on the high security of the access locations to further safeguard the data from unauthorized access or misuse.

#### Ohio Longitudinal Data Archive (OLDA)

```{r, echo=FALSE, fig.width=5, fig.height=2}
olda = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(3,3,3,3,3))
plot(olda)
```

The Ohio Longitudinal Data Archive is an intermediary third party data custodian that provides deidentified individual data to researchers on behalf of the state of Ohio. The data is initially located at OLDA before ultimately being transferred to researchers via an [SFTP server][secure network protocols], where the data and analysis computers are located. The researchers have full agency over the analysis computer, which is required to be a desktop computer with an [IP address registered][IP address restrictions] with OLDA. This computer also doubles as the access computer, and must be located in the researcher's office. This is a low specification of access location security, placing no additional requirements beyond utilizing a specific space. Researchers have unrestricted analysis methods available for them. Data can be provided in a variety of formats, including CSV files that enable the researcher to use any analysis software or method of their choosing.

OLDA relies on approximately a dozen full time staff to maintain its data access mechanism. It relies heavily on the protections of the data itself and the security of researchers' institutions to prevent adversarial actors from gaining access or making use of the data it makes available. Similarly, OLDA also relies on the enforcement of its DUA and disclosure review to prevent researchers from misusing the data or generating unauthorized outputs.

#### Aurora Healthcare and MIT

```{r, echo=FALSE, fig.width=5, fig.height=2}
aurora = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(3,3,3,3,3))
plot(aurora)
```

In the data use agreement between Aurora Healthcare and MIT, Aurora Healthcare agreed to make deidentified personal health data for researchers. The data and analysis computers were located at MIT, with data transferred from Aurora Healthcare to MIT Economics Department [servers][on-site storage] via [SFTP][secure network protocols]. As a result, the researchers had high agency over the analysis computers and unrestricted analysis methods available to them. Researchers could access the data from any computer connected to the MIT network either by being on campus or via a [VPN][virtual private networks], with no restrictions on the access location.

This data provider and researchers took advantage of their existing IT staff and infrastructure to facilitate access to the data. The data provider relies on the physical and network security setups at the researcher's institution to protect the data from adversarial actors. There are no technical controls against the misuse of the data; this highlights the importance of the enforcement of the DUA and the fulfillment of the other Five Safes when crafting data access mechanisms.

#### Private Capital Research Institute (PCRI)

```{r, echo=FALSE, fig.width=5, fig.height=2}
pcri = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(2,1,3,3,2))
plot(pcri)

```

The PCRI data access mechanism shares highly sensitive business information about private capital firms to researchers. In this system, PCRI uses the National Opinion Research Center (NORC) as a third-party location for the data and analysis computers. Researchers have low agency over the analysis computers, being restricted to the Stata. Researchers can only use [thin clients] that are provided to them by NORC. There are no formal restrictions on the location of the access computers, although researchers are required to use their best efforts to prevent unauthorized access. PCRI and NORC implement limited restrictions on the analysis methods available within Stata, prohibiting certain commands and sample sizes.

PCRI itself has three full time and six part-time staff to make the data usable for researchers, but relies on the preexisting resources at NORC for the data access mechanism. The protection against misuse and adversarial actors comes primarily from the storage of the data on secured servers at NORC with its accompanying electronic access controls and monitoring of approved users.

#### City of Cape Town and J-PAL Africa

```{r, echo=FALSE, fig.width=5, fig.height=2}
capetown = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(3,3,3,3,3))
plot(capetown)
```

In the Cape Town partnership, the data was transferred from the data provider to the researcher. As such, the data location, access, and analysis computers are all with the researcher, with the researcher having a full range of analysis methods available. (awaiting updated chapter)

#### Development Impact Evaluation (DIME) at the World Bank

```{r, echo=FALSE, fig.width=5, fig.height=2}
dime = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(3,3,3,3,3))
plot(dime)
```

DIME receives a host of sensitive administrative data, including identified data, from its governmental partners for research use. Governments transfer data directly to DIME via [encrypted protocols][secure network protocols], which acts as the data custodian and stores the data on its own [servers][on-site storage]. DIME researchers can remotely access the data through [VPN's][virtual private networks] using [secured laptops][encryption]. Due to the frequent travel by researchers, there are no restrictions on the access locations for DIME researchers. There are no limitations on the analysis methods available to DIME researchers.

DIME works with administrative data from a variety of data providers, including many from low and middle income countries. In cases where the data provider may not have the resources to make the data available, DIME provides the required resources and infrastructure to access the data necessary for its research. Data providers rely on DIME's security measures, for both its physical IT infrastructure and protocols for its employees, to prevent unauthorized access and the misuse of the data.

#### International Monetary Fund (IMF)

(awaiting updated chapter)

#### Statistics Canada Real Time Remote Access (RTRA)

```{r, echo=FALSE, fig.width=5, fig.height=2}
data = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(1,1,3,3,1))
plot(data)
```

The RTRA system provides access to a Statistics Canada microdata. The data and analysis computers remain with Statistics Canada. Researchers have low agency over the analysis computers, being restricted to only using SAS. The access computers are located with the researcher with open access locations, as they can log into the RTRA via a web interface from any computer. Analysis methods are heavily restricted, with users limited to specific commands within SAS, restricted numbers of procedure calls a day, limits on class variables, and other controls on the SAS environment.[@government_of_canada_system_2011]

The RTRA system is set up by Statistics Canada, which is a major national statistical agency with its associated resources. Researchers only require their own computer to access the data. The data is protected from adversarial actors and misuse by preventing users from viewing the data and automated controlled rounding of the outputs. Additional safeguards primarily concern the evaluation of safe users; a registration and contract are required for access, and researchers must be affiliated with a government department, non-profit organization, or an academic institution.

#### Federal Statistical Research Data Centers (FSRDC)

```{r, echo=FALSE, fig.width=5, fig.height=2}
data = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                 rank=c(1,2,2,1,3))
plot(data)
```

In the United States Federal Statistical Research Data Center (FSRDC) network, federal statistical agencies partner with research institutions to provide secure data access to many different federal statistical products. The data and analysis computers remain with the Census Bureau; for data from other statistical agencies, the Census Bureau acts as a third-party data custodian for the original data provider. Researchers have medium agency over these computers; they are restricted to authorized software but have the ability to request approval for additional software. Within the confines of software availability, analysis methods are otherwise unrestricted. Access computers are [thin clients] located at the partner institutions serving as third-party access providers, which maintain high security access locations in accordance with Census Bureau requirements.[@united_states_census_bureau_federal_nodate]

Each network RDC has several full staff members to maintain the access computers and access location; initial startup costs could reach hundreds of thousands dollars, with ongoing operating costs for staff time.[@united_states_census_bureau_hosting_nodate]The maintenance of the data and analysis computer is a massive undertaking performed by the data provider. The FSRDC network relies on all aspects of data access mechanisms to protect the data that it makes available for researchers. of highest level of security for protecting sensitive data, but are also more expensive than other methods which rely more on trust and less on physical security.

#### SafePod Network (SPN)

```{r, echo=FALSE, fig.width=5, fig.height=2}
data = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                 rank=c(1,2,2,2,3))
plot(data)
```

The SafePod Network in the United Kingdom makes deidentified administrative data from the Office of National Statistics, UK Data Service, SAIL Databank, and NHS Scotland available for researchers. A SafePod is a prefabricated room with a single [thin client][thin clients] with remote access to analysis computers and data located with the data provider.[@university_of_bristol_safepod_nodate] The agency that researchers have over analysis computers and restrictions on analysis methods remain at the discretion of each data provider; using the Office of National Statistics as an example, researchers have medium agency over the analysis computers and unrestricted, being allowed access to a predefined list of statistical software with no further restrictions beyond software availability.[@office_for_national_statistics_accessing_nodate] The unique aspect of the SafePod is the security of the access locations. SafePods are a minimalistic yet robust implementation of a medium security location (an access controlled space with CCTV monitoring) that can exist within low security environments such as university libraries.

SafePods are relatively cheap, requiring only a suitable location to place a prefabricated room and can use existing staff members to manage access to the SafePod. While the SafePod is still a physical location that requires installation and ongoing staff and maintenance, it is an example of innovation in more access locations to provide protection against the various security threats at a lower cost than a traditional full scale research data center.

#### National Center for Education Statistics (NCES) Restricted Use Data License

```{r, echo=FALSE, fig.width=5, fig.height=2}
nces = data.frame(metrics=c("Location of Data and Analysis Computer","Researcher Agency Over Analysis Computer","Location and Type of Access Computer","Security of Access Room","Range of Analysis Methods"),
                  rank=c(3,3,3,2,3))
plot(nces)
```

The NCES, a part of the United States Department of Education, allows researchers to apply for a restricted use data license for deidentified individual level data on education. Under the terms of the license, the researchers serve as the data custodian and receive the data on an [encrypted CD][physical media] from NCES. As such, the data and analysis computers are located with the researcher, and the analysis computer is the access computer. The license has specific requirements for the security of the analysis computers and [storage of data][on-site storage]. Researchers have high authority over the analysis computer and unrestricted analysis methods, being able to use any software or methods available to them. The license mandates a medium level of security for the access location, requiring that it must be a locked room with access restricted to authorized users but without additional specifications for security. The security arrangements must be approved by NCES prior to the receipt of restricted use data and are subject to unannounced inspections.[@national_center_for_education_statistics_restricted-use_nodate]

The NCES restricted licenses require minimal resources for the data access mechanism; using physical media minimizes the technical resources needed to set up and harden a transfer mechanism. Researchers can utilize their existing university resources to set up the access location. The license requires primarily on the security of the access location and specifications for data storage to protect against adversarial actors. NCES relies on its disclosure review process to protect against misuse.
