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
  text(1.25 2.6  "Funded" , color("67 162 202")) ///
  text(0.4  2.5  "Overall", color("168 221 181"))  ///
  legend(off)
  /// legend(on nobox region(style(none))  order(1 "Funded" 2 "Overall") bplacement(se) ring(0) cols(1) ) 
graph export "Figure5-mod.pdf", as(pdf) name("Graph") replace
graph export "Figure5-mod.png", name("Graph") width(1000) replace
