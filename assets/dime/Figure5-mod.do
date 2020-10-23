set scheme uncluttered
use "i2i rating data de-id.dta"
twoway ///
  (kdensity Technicalrating if Funding==1, lcolor("67 162 202"))  ///
  (kdensity Technicalrating,               lcolor("168 221 181"))  , ///
  ytitle(" ") ///
  ylabel(0(.5)1.5) ///
  xtitle(External technical rating) ///
  xlabel(.5(.5)3) ///
  xline(2, lcolor(black)) ///
  text(1.25 1.55 "Technical Cut-off", size(medium)) ///
  legend(on order(1 "Funded" 2 "Overall") position(6)) 
graph export "Figure 5-mod.eps", as(eps) name("Graph") preview(off) replace
graph export "Figure 5-mod.png", name("Graph") width(1000) replace
