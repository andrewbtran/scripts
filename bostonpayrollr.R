
totals=read.csv("merger.csv")

females=subset(totals, totals$prob.gender=="Female")

males=subset(totals, totals$prob.gender=="Male")

titles = table(totals$TITLE, totals$prob.gender)

meandepartments = tapply(totals$TOTAL.EARNINGS, totals$TITLE, mean)

mediandepartments = tapply(totals$TOTAL.EARNINGS, totals$TITLE, median)

df = data.frame(Title=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Title=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Title")

femmeddept=tapply(females$TOTAL.EARNINGS, females$TITLE, median)

femmeandept=tapply(females$TOTAL.EARNINGS, females$TITLE, mean)

fm1 = data.frame(Title=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Title=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Title")

department3=merge(departments, departments2, by="Title")

menmeddept=tapply(males$TOTAL.EARNINGS, males$TITLE, median)
menmeandept=tapply(males$TOTAL.EARNINGS, males$TITLE, mean)

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



