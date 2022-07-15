clear all
global path "/Users/emaansiddique/MEGAsync/Research/ECON191H195B"
global input "$path/input"
global output "$path/output"
global temp "$path/temp"

use "$output/merged_dataset.dta"
keep if (year <= 2013)
drop if year==2001 | year==1998
drop if (city == "TRG") 

ssc install dataex

estpost sum years_edu total_current_enroll home_ownership literate employment income
esttab . using "$output/table_all_13.tex", cell((mean(label(Mean) fmt(2)) sd(label(Std. Dev.)) p50(label(Median)) min(label(Minimum)) max(label(Maximum)))) title(Table 1) nonumber  label replace

***
preserve
keep if treat == 1
keep if (year <= 2013)

estpost sum years_edu total_current_enroll home_ownership literate employment income
esttab . using "$output/table_treat_13.tex", cell((mean(label(Mean) fmt(2)) sd(label(Std. Dev.)) p50(label(Median)) min(label(Minimum)) max(label(Maximum)))) title(Table 1) nonumber  label replace
restore
***

preserve
keep if treat == 0
keep if (year <= 2013)

estpost sum years_edu total_current_enroll home_ownership literate employment income
esttab . using "$output/table_control_13.tex", cell((mean(label(Mean) fmt(2)) sd(label(Std. Dev.)) p50(label(Median)) min(label(Minimum)) max(label(Maximum)))) title(Table 1) nonumber  label replace
restore
***
