*============================================================================================
*Title: mult2_answers_monica.do
*Author: Monica Elgawly
*Date Modified: 4/05/2018
*Assignment 3 Part 2
*============================================================================================

cap log close 
clear
set more off

*============================================================================================

*============================================================================================
*2a) Use OLS to estimate the equation: log(wagei) = B0 + B1edu1 + B2experi + B3exper^2^i + ui
*Write the regression results in standard form (i.e. plug in the correct values for the parameters 
*estimates and their standard errors): log(wagei) = B0 + B1edu1 + B2experi + B3exper^2^i

gen lwage = log(wage)
*already defined upon use of data file

gen exper2 = exper^2
regress lwage educ exper exper2

*============================================================================================

*============================================================================================
*b) Interpret B1 and test its statistical significance at the 1% level. What can we say about 
*the relationship between education and log(wage)?

*B1 represents the coefficient of the multiplicative effect the number of years of education has 
*on longterm wage outcomes. When we test B1 for statistical significance we take the coefficient
*subtract from its null hypothesized value of insignificance zero and divide by the standard error
*(.0903658 - 0)/.007468 to give 12.10. This value is greater than the critical value of 2.58 which 
*is the value used to test for 1% significance. |12.10| > 2.58 means B1 is significant at the 
*1% level. 

*The relationship between education and log(wage) is a log-linear relationship as found in lecture #15 
*slide 6/19 where it is iterated that a one unit increase in education is expected to increase
*wages by (100 * .0903658) which is 9.04%. 

*============================================================================================

*============================================================================================
*c) Test whether experience has a statistically significant effect on log(wage).

*To test whether experience has a statistically significant effect on log(wage), we look at the
*t statistic value provided by the regression. This could've been a simplier way of looking at 
*the educational statistical significance as well, but I preferred to utilize breaking down 
*the information for my own understanding purposes. 

*The t for experience is 7.89 which is again greater than 2.58. Experience is statistically significiant 
*at the 1% level. 
*============================================================================================

*============================================================================================
*d) Is exper^2 statistically significant at the 5% level? What does this hypothesis test say 
*about the relationship between log(wage) and experience?

*|-6.16| > 1.96 so exper^2 is statistically significant at the 5% level. 
*This hypothesis test says that the relationship between experience and log(wage) is 
*in fact nonlinear. The null hypothesis would have been B2 = 0. The alternative B2 \= 0.
*Since |-6.16| > 1.95 or even 2.58 we reject the null, understanding that the exper^2 should not
*be ommitted from the regression.
*============================================================================================

*============================================================================================
*e) Use the approximation of the marginal effect of experience: 
*%change in wagei = dlog(wagei)/dexperi = [B_2_ + 2B_3_exper_i_] * 100%
*to find the approx return to going from 5 to 6 years of experience. What is the approx
*return to going from 20 to 21 years of experience? Do you think experience exhibits 
*diminishing marginal returns? 

*change from 5 to 6 years of experience:
* = [.0410089 + 2(-.0007136 * 6)] - [.0410089 + 2(-.0007136 * 5)] 
* = .0324457 - .0338729
* = -.0014272 * 100%
* = -.14272% 

*This means that a one year change in experience from 5 to 6 years of work results in an 
*overall negative percent change of -.14% from increasing years of experience's effect on wage.
*This is an example of diminishing marginal returns.

*change from 20 to 21 years of experience:
* = [.0410089 + 2(-.0007136 * 21)] - [.0410089 + 2(-.0007136 * 20)] 
* = .0110377 - .0124649
* = -.0014272 * 100%
* = -.14272% 

*This means that a one year change in experience from 20 to 21 years of work results in an 
*overall negative percent change of -.14% from increasing years of experience's effect on wage.
*This again exhibits the regression is an example of diminishing marginal returns.
*============================================================================================

*============================================================================================
*f) Find the predicted difference in log(wage) between someone with 10 years of experience
*and someone with 20 years of experience. Is the difference statistically significant?
*Note: Do not use the approx in (e). We only use approx in (e) when change in x = 1.
*In this case, change in x = 10.) 

*for 20 years:
* = [.0410089 + 2(-.0007136 * 20)]
* = .0124649
* = 1.25%

*for 10 years:
* = [.0410089 + 2(-.0007136 * 10)]
* = .0267369
* = 2.67%

*change from 10 to 20 years of experience:
* = [.0410089 + 2(-.0007136 * 20)] - [.0410089 + 2(-.0007136 * 10)] 
* = .0124649 - .0267369
* = -.014272 * 100%
* = -1.4272% 

*At 20 years of experience you get less of an increase in wage than from 10 years.

*H0 = change in 10 years of experience = 0
*H1 = change in 10 years of experience \= 0

*As this is a log-level model, a 10 unit increase in experience decreases wage by -1.43% on average.
*We know the difference is statistically significant from parts (c) and (d).

*============================================================================================

*============================================================================================
*g) At what value of exper does an additional year of experience reduce predicted log(wage)?
*How many people have experience beyond that turning point in the sample? Do you think the 
*turning point is a problem or do you think the results make sense?

tab exper
sum exper

*Turning point for where experience has a diminishing/increasing return on salary:
*-b/2a = -(.0410089)/(2 * -.0007136) = 28.73381446

*[.0410089 + 2(-.0007136 * 5)] * 100 = 3.39%  presumes an increase in log(wage)
*[.0410089 + 2(-.0007136 * 35)] * 100 = -8.94% presumes a decrease in log(wage) 

*Beyond 28.7 there are 121 observations from a total of 526. That is 23% of the sample.
*Less than a fourth of the sample reaches the turning point so the scatterplot would be 
*left-skewed in its results. 

*The turning point does not make sense because it assumes that loyalty to an occupation only pays
*off after a dedication of nearly 30 years. The correlation between experience and wages should
*make sense that the more experienced one is at a job there's a certain leveling effect where their
*experience makes them better equiped to cope with the stressors of the occupation and be a more 
*productive employee. It doesn't typically take an employee 29 years of experience for that 
*experience to show itself in wage returns. It does however suggest that if higher paying jobs 
*are offered that it is in the interest in the employee to leave and not give their 
*loyalty to one position.

*============================================================================================

*============================================================================================
*h) What if you think that there should not be a turning point for experience, but you still think 
*there are diminishing marginal returns to experience. How might you change the model? (Hint: You
*need to change the functional form of experience.) 

*I think the coefficient for the value of exper^2 could be changed to a positive value. 
*There is a ceiling to which overcharging based solely on experience is dangerous but I would 
*tend to think that with more experience, especially someone who doesn't tire of their chosen 
*field and is solely first and foremost an expert on it, there should be reference point on whether
*the regression is representative of the population of a country or whether it refers to an employee's 
*wages within a firm. Because it could be the case that working for a firm over too-long a period may lead
*an employee to grow stagnant and not warrant their increase in wage due to having reached their heights 
*at a particular firm. Maybe it should be a consideration for highly skilled employees as a marker
*of recognizing that maybe they could bring more value to a firm by taking a more free-lance, contract 
*work in addition their current employment - build an online course to generate passive income to 
*make the highest use of their time in a changing economy.

*On the whole of the population I don't believe people prefer to be workaholics so there is a ceiling to 
*where the squared variable may very well be reflective on the population of a community as a whole. 
*However in terms of economic opportunity I would like to think that in term of someone's potential 
*for earnings the negative variable does not reflect that possibility. 
*============================================================================================

