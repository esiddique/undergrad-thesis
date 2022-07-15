global path "/Users/emaansiddique/MEGAsync/Research/ECON191H195B/"
global input "$path/input"
global output "$path/output"
global temp "$path/temp"

import delimited using "$input/years_edu_rural.csv", clear
tempfile years_edu_rural
save `years_edu_rural', replace

import delimited using "$input/total_current_enroll.csv", clear
tempfile total_current_enroll
save `total_current_enroll', replace

use `years_edu_rural', clear
merge 1:1 city year using `total_current_enroll'
rename rate total_current_enroll
rename _merge merge1
tempfile merge_1
save `merge_1', replace

import delimited using "$input/public_school_enroll.csv", clear
tempfile public_school_enroll
save `public_school_enroll', replace

use `merge_1', clear
merge 1:1 city year using `public_school_enroll'
rename rate public_school_enroll
rename _merge merge2
tempfile merge_2
save `merge_2', replace

import delimited using "$input/controls.csv", clear
tempfile controls
save `controls', replace

use `merge_2', clear
merge 1:1 city year using `controls'
rename _merge merge3

drop v1 merge1 merge2 merge3

save "$output/merged_dataset.dta", replace

*** Women only ***

import delimited using "$input/years_edu_rural_WOMEN.csv", clear
tempfile years_edu_rural
save `years_edu_rural', replace

import delimited using "$input/total_current_enroll_WOMEN.csv", clear
tempfile total_current_enroll
save `total_current_enroll', replace

use `years_edu_rural', clear
merge 1:1 city year using `total_current_enroll'
rename rate total_current_enroll
rename _merge merge1
tempfile merge_1
save `merge_1', replace

import delimited using "$input/public_school_enroll_WOMEN.csv", clear
tempfile public_school_enroll
save `public_school_enroll', replace

use `merge_1', clear
merge 1:1 city year using `public_school_enroll'
rename rate public_school_enroll
rename _merge merge2
tempfile merge_2
save `merge_2', replace

import delimited using "$input/controls.csv", clear
tempfile controls
save `controls', replace

use `merge_2', clear
merge 1:1 city year using `controls'
rename _merge merge3

drop v1 merge1 merge2 merge3

/*
replace employment = (employment[_n + 1] + employment[_n - 1])/2 if employment==.
replace income = (income[_n + 1] + income[_n - 1])/2 if income==.
by city: ipolate home_ownership year, generate(home_ownership_2) epolate
replace home_ownership=home_ownership_2 if home_ownership==.
drop home_ownership_2
*/

save "$output/merged_dataset_WOMEN.dta", replace
