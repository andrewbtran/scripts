
totals=read.csv("meninonames.csv")

females=subset(totals, totals$prob.gender=="Female")

males=subset(totals, totals$prob.gender=="Male")

titles = table(totals$Department.Name, totals$prob.gender)

meandepartments = tapply(totals$Annual.Rt, totals$Department.Name, mean)

mediandepartments = tapply(totals$Annual.Rt, totals$Department.Name, median)

df = data.frame(Title=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Title=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Title")

femmeddept=tapply(females$Annual.Rt, females$Department.Name, median)


femmeandept=tapply(females$Annual.Rt, females$Department.Name, mean)

fm1 = data.frame(Title=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Title=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Title")

department3=merge(departments, departments2, by="Title")

menmeddept=tapply(males$Annual.Rt, males$Department.Name, median)
menmeandept=tapply(males$Annual.Rt, males$Department.Name, mean)

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
write.csv(DEPARTMEN, file="MeninoDepartments.csv")

write.csv(meninogenders, "meninogenders.csv")
#Changed Annual.Rt to a number

meninogenders = read.csv("meninogenders.csv")
#Bringing it back in

meninomerge1 = table(meninogenders$Position.Title, meninogenders$prob.gender)

write.csv(meninomerge1, "meninomerge1.csv")
#more adjustments - Add Title to column
meninomerge1 = read.csv("meninomerge1.csv")

meninodepartments = read.csv("MeninoDepartments.csv")

meninotitles = read.csv("MeninoTitles.csv")
#UH OH, FILE DOESNT EXIST. WTF.

menino = merge(meninotitles, meninomerge1, by="Title")
write.csv(menino, "titles.csv")


write.csv(meninogenders, "meninogenders.csv")
#Changed Annual.Rt to a number

meninogenders = read.csv("meninogenders.csv")
#Bringing it back in

meninomerge2 = table(meninogenders$Department.Name, meninogenders$prob.gender)

write.csv(meninomerge2, "meninomerge2.csv")
#more adjustments - added Title
meninomerge1 = read.csv("meninomerge2.csv")
meninotitles = read.csv("MeninoDepartments.csv")
menino = merge(meninotitles, meninomerge1, by="Title")
write.csv(menino, "departments.csv")

malemenino = subset(meninogenders, prob.gender=="Male")
femalemenino = subset(meninogenders, prob.gender=="Female")
unknownmenino = subset(meninogenders, prob.gender=="Unknown")

tapply(malemenino$Annual.Rt, malemenino$Union.Status, median)
tapply(femalemenino$Annual.Rt, femalemenino$Union.Status, median)
tapply(unknownmenino$Annual.Rt, unknownmenino$Union.Status, median)

malemarty = subset(martygenders, prob.gender=="Male")
femalemarty = subset(martygenders, prob.gender=="Female")
unknownmarty = subset(martygenders, prob.gender=="Unknown")

tapply(malemarty$Annual.Rt, malemarty$Union.Status, median)
tapply(femalemarty$Annual.Rt, femalemarty$Union.Status, median)
tapply(unknownmarty$Annual.Rt, unknownmarty$Union.Status, median)
