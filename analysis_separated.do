clear all
global path "/Users/emaansiddique/MEGAsync/Research/ECON191H195B"
global input "$path/input"
global output "$path/output"
global temp "$path/temp"

use "$output/merged_dataset.dta", clear
gen post = 0
replace post= 1 if year > 2013
gen interaction = 0
replace interaction=post*treat
/// Drop cities that do not have data for all years
drop if year==2001 | year==1998
drop if (city == "TRG") 
encode city, gen(city1)
/// Check balance
xtset city1 year

// City and Time fixed effects
regress years_edu treat post interaction i.city1 i.year, cluster(city)
eststo m1a
regress years_edu treat post interaction home_ownership literate employment income i.city1 i.year, cluster(city)
eststo m1b
regress total_current_enroll treat post interaction i.city1 i.year, cluster(city)
eststo m2a
regress total_current_enroll treat post interaction home_ownership literate employment income i.city1 i.year, cluster(city)
eststo m2b

estout
esttab using "$output/reg_table_m1-3.tex", se replace title(Table)

*** Women only ***
clear all
global path "/Users/emaansiddique/MEGAsync/Research/ECON191H195B"
global input "$path/input"
global output "$path/output"
global temp "$path/temp"

use "$output/merged_dataset_WOMEN.dta", clear
gen post = 0
replace post= 1 if year > 2013
gen interaction = 0
replace interaction=post*treat
/// Drop cities that do not have data for all years
drop if year==2001 | year==1998
drop if (city == "TRG") 
encode city, gen(city1)
/// Check balance
xtset city1 year

// City and Time fixed effects
regress years_edu treat post interaction i.city1 i.year, cluster(city)
eststo m4a
regress years_edu treat post interaction home_ownership literate employment income i.city1 i.year, cluster(city)
eststo m4b
regress total_current_enroll treat post interaction i.city1 i.year, cluster(city)
eststo m5a
regress total_current_enroll treat post interaction home_ownership literate employment income i.city1 i.year, cluster(city)
eststo m5b

estout
esttab using "$output/reg_table_m4-6_2.tex", se replace title(Table)
