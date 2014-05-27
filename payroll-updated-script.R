
totalsmenino=read.csv("meninonames.csv")

femalesmenino=subset(totalsmenino, totalsmenino$prob.gender=="Female")

malesmenino=subset(totalsmenino, totalsmenino$prob.gender=="Male")

#Department.Name

titlesmenino = table(totalsmenino$Department.Name, totalsmenino$prob.gender)

meandepartments = tapply(totalsmenino$Annual.Rt, totalsmenino$Department.Name, mean)

mediandepartments = tapply(totalsmenino$Annual.Rt, totalsmenino$Department.Name, median)

df = data.frame(Title=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Title=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Title")

femmeddept=tapply(femalesmenino$Annual.Rt, femalesmenino$Department.Name, median)


femmeandept=tapply(femalesmenino$Annual.Rt, femalesmenino$Department.Name, mean)

fm1 = data.frame(Title=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Title=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Title")

department3=merge(departments, departments2, by="Title")

menmeddept=tapply(malesmenino$Annual.Rt, malesmenino$Department.Name, median)
menmeandept=tapply(malesmenino$Annual.Rt, malesmenino$Department.Name, mean)

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

##NOW FOR TITLES

titlesmenino = table(totalsmenino$Position.Title, totalsmenino$prob.gender)

meandepartments = tapply(totalsmenino$Annual.Rt, totalsmenino$Position.Title, mean)

mediandepartments = tapply(totalsmenino$Annual.Rt, totalsmenino$Position.Title, median)

df = data.frame(Title=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Title=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Title")

femmeddept=tapply(femalesmenino$Annual.Rt, femalesmenino$Position.Title, median)


femmeandept=tapply(femalesmenino$Annual.Rt, femalesmenino$Position.Title, mean)

fm1 = data.frame(Title=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Title=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Title")

department3=merge(departments, departments2, by="Title")

menmeddept=tapply(malesmenino$Annual.Rt, malesmenino$Position.Title, median)
menmeandept=tapply(malesmenino$Annual.Rt, malesmenino$Position.Title, mean)

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
write.csv(DEPARTMEN, file="MeninoTitles.csv")


#Hold up here.

write.csv(meninogenders, "meninogenders.csv")
#Changed Annual.Rt to a number

meninogenders = read.csv("meninogenders.csv")
#Bringing it back in

meninomerge1 = table(meninogenders$Position.Title, meninogenders$prob.gender)

write.csv(meninomerge1, "meninomerge1.csv")
#more adjustments - Add Title to column
meninomerge1 = read.csv("meninomerge1.csv")

meninodepartments = read.csv("MeninoDepartments.csv")

meninomerge2=table(meninogenders$Department.Name, meninogenders$prob.gender)

write.csv(meninomerge2, "meninomerge2.csv")



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
