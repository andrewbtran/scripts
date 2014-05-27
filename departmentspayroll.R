
totals=read.csv("merger.csv")

females=subset(totals, totals$prob.gender=="Female")

males=subset(totals, totals$prob.gender=="Male")

titles = table(totals$Department, totals$prob.gender)

meandepartments = tapply(totals$TOTAL.EARNINGS, totals$Department, mean)

mediandepartments = tapply(totals$TOTAL.EARNINGS, totals$Department, median)

df = data.frame(Department=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Department=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Department")

femmeddept=tapply(females$TOTAL.EARNINGS, females$Department, median)

femmeandept=tapply(females$TOTAL.EARNINGS, females$Department, mean)

fm1 = data.frame(Department=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Department=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Department")

department3=merge(departments, departments2, by="Department")

menmeddept=tapply(males$TOTAL.EARNINGS, males$Department, median)
menmeandept=tapply(males$TOTAL.EARNINGS, males$Department, mean)

mmd=data.frame(Department=names(menmeddept), Male_Median=menmeddept)

mmd2=data.frame(Department=names(menmeandept), Male_Mean=menmeandept)

mendept = merge(mmd, mmd2, by="Department")

department=merge(department3, mendept, by="Department")

diff = department$Female_Median - department$Male_Median

mediandiff = data.frame(Department=names(diff), Median_Diff=diff)

diff2 = department$Female_Mean - department$Male_Mean

meandiff = data.frame(Department=names(diff2), Mean_Diff=diff2)

diffs = merge(mediandiff, meandiff, by="Department")


DEPARTMEN=merge(department, diffs, by="Department")
write.csv(DEPARTMEN, file="Departments.csv")
