*=======================================================================================================
*Title: multnonr_monica_answers.do
*Author: Monica Elgawly
*Date Modified: 3/30/2018
*Assignment #3
*=======================================================================================================

cap log close 
clear 
set more off

*=======================================================================================================
*to create a log file for results 
*=======================================================================================================

log using "/Users/monicaelgawly/Downloads/metrics/multnr_monica_answers.log", replace

*=======================================================================================================
*Question 1: *Open the data set on how tuition is valued/ how today values college education
*=======================================================================================================

use "/Users/monicaelgawly/Downloads/HTV.dta"

*=======================================================================================================
*a): Show the range of values that the edu variable takes in the sample (sum, detail) 
*Create a dummy variable that equals 1 if men completed exactly 12 years of education and equals 0 otherwise (gen)
*Show what percentage of men completed exactly 12 years of education (tab) 
*Determine whether the men or their parents have higher levels of education (sum)

sum
ge highschedu=0
replace highschedu=1 if educ==12

tab highschedu
* From the tabulation, 41.74% of the men in 1991 had finished 12 years of education -- that is 
* 498 out of (695+498) 1193 total in the sample
*The sum function shows that the mothers' has a typical education of 12.17519 +/- 2.28 years while the 
*fathers had only slightly higher with 12.44258 years with more variation +/- 3.27. The mean for the men 
*overall was 13.03 +/- 2.35 years. Therefore the men had a year on average more of education over their 
*parents.
*=======================================================================================================
*=======================================================================================================
*b): Estimate the regression model: educi = B0 + B1(mothereduci) + B2(fatheduci) + ui

reg educ motheduc fatheduc
reg educ motheduc fatheduc, r
reg educ motheduc fatheduc, vce(robust) 

*How much of the variation in educ is explained by parents' education? Interpret the coefficient on mothereduc.
*The amount of variation explained by these two regressors is found via R^2 which is approx 25%
*Here, B1 reflects the difference in educations for men whose mothers ranged from highly to least traditionally educated via 
*number of years. Since the coefficient [B1 = .31] > [B2 = .18], men born to more educated mothers were likewise expected
*to be more educated on average and fathers' education [B2] didn't correlate with their sons' education as much.
*=======================================================================================================


*c) Add the variable abil (a measure of cognitive ability) to the model in part (b). Does ability help to 
*explain variation in education, even after controlling for parents' education? Use at least one test statistic 
*to justify your answer. 

reg educ abil motheduc fatheduc
reg educ abil motheduc fatheduc, r

*Adding ability to the regression does help to explain variation based off the observations found in the 
*decrease of the standard error of all the regressors and the increase in width of range whereby we 
*attain more confidence in our observations. From the addition of abil, we see that B1, the coefficient 
*for motheduc, increases numerically from .31 to .49. Eliminating abil introduces positive bias in the regression then. 
*(LC #9) The large t statistic for abil tells us that we reject the null hypothesis at 95% confidence that 
* H0 = abil = motheduc = fatheduc = 0. Disproving this hypothesis shows the validity of the need of all three
*regressors in the equation. The p-value being zero also indicates a rejection of the null (H0 = all are assumed zero).

*d) Compare the coefficient estimates on motheduc and fatheduc from the model in part b) to the model in part c). 
*What do the differences tell us about omitted variable bias in the model in part b)? Be specific.

* There was omitted variable bias with regards to ability from the recognition of the value of 
* R^2 increasing from .25 to .42. The correlation coefficients of motheduc and fatheduc go down
* when abil is added to the regression, revealing that ability is correlated with parents' abilities.
* The same way when children are given more capable parents --maybe providing more opportunities or
* support as there were resources previously passed down to them. So too the sooner that more educated
* parents can pass down that fountain of knowledge to their children. The coefficient then of ability
* reveals the men's educated results owing more to their own merit than to their parents' credit.
* Or, said another way, weighing in numerically the men's childhood environment growing up.

*e) Use the results from part (c) to test the hypothesis that the effect of mothers' education on 
* men's education equals two times the effect of fathers' education on men's education. 
* Write null and alternative hypotheseses. 
* Evaluate the hypothesis using the F-statistic and test command.
* Rearrange the regression model and evaluate the hypothesis using a t-statistic. 
* Do you arrive at the same conclusion using the F- and t- statistics? 

*H0 = B1 = (2 * B2) 
*H1 = B1 \= (2 * B2) 
* to evaluate the hypothesis:
 
test motheduc fatheduc
* We reject the null that B1 = B2 = 0

test motheduc-(2*fatheduc)=0
*The F-test yields a p-value of .7731 so we fail to reject the null.

*We arrive at results that support one another. The t-tests reveal better reliability in 
*the regression once ability is accounted for and the F-test reveals the 
*relationship between the two parents' associated impacts on the men's education.











