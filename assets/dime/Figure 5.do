ieboilstart, v(15)
`r(version)'
use "C:\Users\wb357411\Dropbox\DIME Analytics\IDEA Handbook\i2i rating data de-id.dta"
twoway (kdensity Technicalrating if Funding==1, lcolor(purple)) (kdensity Technicalrating, lcolor(ebblue)) , ytitle(Density) ylabel(0(.5)1.5) xtitle(External technical rating) xlabel(.5(.5)3) xline(2) text(1.45 1.75 "Technical Cut-off", size(small)) legend(on order(1 "Funded" 2 "Overall") position(6))
graph export "C:\Users\wb357411\Dropbox\DIME Analytics\IDEA Handbook\Figure 5.eps", as(eps) name("Graph") preview(off) replace