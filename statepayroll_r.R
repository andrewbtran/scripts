setwd("C:/Users/andrew.tran/Downloads")

csv = "state-payroll-2014.csv"

payroll = read.csv(csv)

names = read.csv("malefemalenames.csv")

payrollgenders = merge(payroll, names, by="Name")

payrollgenders[12:13] = list(NULL)

write.csv(payrollgenders, "statepayrollnames.csv")

totals=payrollgenders

females=subset(totals, totals$prob.gender=="Female")

males=subset(totals, totals$prob.gender=="Male")

#Titles

titles = table(totals$Job.Title, totals$prob.gender)

meandepartments = tapply(totals$Previous.Year.Earnings, totals$Job.Title, mean)

mediandepartments = tapply(totals$Previous.Year.Earnings, totals$Job.Title, median)

df = data.frame(Title=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Title=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Title")

femmeddept=tapply(females$Previous.Year.Earnings, females$Job.Title, median)

femmeandept=tapply(females$Previous.Year.Earnings, females$Job.Title, mean)

fm1 = data.frame(Title=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Title=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Title")

department3=merge(departments, departments2, by="Title")

menmeddept=tapply(males$Previous.Year.Earnings, males$Job.Title, median)
menmeandept=tapply(males$Previous.Year.Earnings, males$Job.Title, mean)

mmd=data.frame(Title=names(menmeddept), Male_Median=menmeddept)

mmd2=data.frame(Title=names(menmeandept), Male_Mean=menmeandept)

mendept = merge(mmd, mmd2, by="Title")

department=merge(department3, mendept, by="Title")

diff = department$Female_Median - department$Male_Median

mediandiff = data.frame(Title=names(diff), Median_Diff=diff)

diff2 = department$Female_Mean - department$Male_Mean

meandiff = data.frame(Title=names(diff2), Mean_Diff=diff2)

diffs = merge(mediandiff, meandiff, by="Title")


DEPARTMEN=merge(department, diffs, by="Title")
write.csv(DEPARTMEN, file="Titles.csv")

#Departments

titles = table(totals$Department, totals$prob.gender)

meandepartments = tapply(totals$Previous.Year.Earnings, totals$Department, mean)

mediandepartments = tapply(totals$Previous.Year.Earnings, totals$Department, median)

df = data.frame(Title=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Title=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Title")

femmeddept=tapply(females$Previous.Year.Earnings, females$Department, median)

femmeandept=tapply(females$Previous.Year.Earnings, females$Department, mean)

fm1 = data.frame(Title=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Title=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Title")

department3=merge(departments, departments2, by="Title")

menmeddept=tapply(males$Previous.Year.Earnings, males$Department, median)
menmeandept=tapply(males$Previous.Year.Earnings, males$Department, mean)

mmd=data.frame(Title=names(menmeddept), Male_Median=menmeddept)

mmd2=data.frame(Title=names(menmeandept), Male_Mean=menmeandept)

mendept = merge(mmd, mmd2, by="Title")

department=merge(department3, mendept, by="Title")

diff = department$Female_Median - department$Male_Median

mediandiff = data.frame(Title=names(diff), Median_Diff=diff)

diff2 = department$Female_Mean - department$Male_Mean

meandiff = data.frame(Title=names(diff2), Mean_Diff=diff2)

diffs = merge(mediandiff, meandiff, by="Title")


DEPARTMEN=merge(department, diffs, by="Title")
write.csv(DEPARTMEN, file="Departments.csv")

summary(females$Previous.Year.Earnings)
summary(males$Previous.Year.Earnings)
