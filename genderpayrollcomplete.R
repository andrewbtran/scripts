#Step 1. Convert dollars to real numbers
#Step 2. Change date format to 2001-01-01 (Might be easy to find under Locale: English (United Kingdom))
#Step 3. Bring in the csv
#Step 4. payroll <- read.csv("05-27-update.csv")
#Step 5. payroll$Start.Date <- (as.Date(payroll$Start.Date, "%Y-%m-%d"))
#Step 6. menino <- subset(payroll, Start.Date < "2014-01-06")
#Step 7. menino <- subset(menino, Start.Date >= "1993-07-12")


genderpayroll <- function(dataset, genderclm, salaryclm, departmentclm, titleclm, unionclm, ethnicclm) {

library(xlsx)
  
females=subset(dataset, genderclm=="F")

males=subset(dataset, genderclm=="M")

titles = table(departmentclm, genderclm)

write.xlsx(titles, "Mahty.xlsx", sheetName="Sheet1", col.names=TRUE, row.names=TRUE)

meandepartments = tapply(salaryclm, departmentclm, mean)

mediandepartments = tapply(salaryclm, departmentclm, median)

df = data.frame(Title=names(mediandepartments), Median=mediandepartments)

df2 = data.frame(Title=names(meandepartments), Mean=meandepartments)

departments=merge(df, df2, by="Title")

femmeddept=tapply(females$Annual.Rt, females$Dept, median)

femmeandept=tapply(females$Annual.Rt, females$Dept, mean)

fm1 = data.frame(Title=names(femmeddept), Female_Median=femmeddept)

fm2 = data.frame(Title=names(femmeandept), Female_Mean=femmeandept)

departments2=merge(fm1, fm2, by="Title")

department3=merge(departments, departments2, by="Title")

menmeddept=tapply(males$Annual.Rt, males$Dept, median)
menmeandept=tapply(males$Annual.Rt, males$Dept, mean)

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
##write.csv(DEPARTMEN, file="MartyDepartments.csv")

write.xlsx(DEPARTMEN, "Mahty.xlsx", sheetName="Sheet2", col.names=TRUE, row.names=TRUE, append=TRUE)


#Title time

titles = table(titleclm, genderclm)

##write.csv(titles, "martytitlestotal.csv")

write.xlsx(titles, "Mahty.xlsx", sheetName="Sheet3", col.names=TRUE, row.names=TRUE, append=TRUE)


meantitles = tapply(salaryclm, titleclm, mean)

mediantitles = tapply(salaryclm, titleclm, median)

df = data.frame(Title=names(mediantitles), Median=mediantitles)

df2 = data.frame(Title=names(meantitles), Mean=meantitles)

titles=merge(df, df2, by="Title")

femmedtitle=tapply(females$Annual.Rt, females$Job.Title, median)

femmeantitle=tapply(females$Annual.Rt, females$Job.Title, mean)

fm1 = data.frame(Title=names(femmedtitle), Female_Median=femmedtitle)

fm2 = data.frame(Title=names(femmeantitle), Female_Mean=femmeantitle)

titles2=merge(fm1, fm2, by="Title")

titles3=merge(titles, titles2, by="Title")

menmedtitle=tapply(males$Annual.Rt, males$Job.Title, median)
menmeantitle=tapply(males$Annual.Rt, males$Job.Title, mean)

mmd=data.frame(Title=names(menmedtitle), Male_Median=menmedtitle)

mmd2=data.frame(Title=names(menmeantitle), Male_Mean=menmeantitle)

mentitle = merge(mmd, mmd2, by="Title")

title=merge(titles3, mentitle, by="Title")

diff = title$Female_Median - title$Male_Median

mediandiff = data.frame(Title=names(diff), Median_Diff=diff)

diff2 = title$Female_Mean - title$Male_Mean

meandiff = data.frame(Title=names(diff2), Mean_Diff=diff2)

diffs = merge(mediandiff, meandiff, by="Title")

Titles=merge(title, diffs, by="Title")

##write.csv(Titles, file="MartyTitles.csv")

write.xlsx(Titles, "Mahty.xlsx", sheetName="Sheet4", col.names=TRUE, row.names=TRUE, append=TRUE)


#summary time

total <- table(genderclm)

total <- cbind(total, table(genderclm, unionclm))

write.xlsx(total, "Mahty.xlsx", sheetName="Sheet6", col.names=TRUE, row.names=TRUE, append=TRUE)

maleAverage <- mean(males$Annual.Rt, na.rm=TRUE)
femaleAverage <-mean(females$Annual.Rt)
maleMedian <- median(males$Annual.Rt, na.rm=TRUE)
femaleMedian <- median(females$Annual.Rt)

summary <- rbind(maleAverage, femaleAverage, maleMedian, femaleMedian)

write.xlsx(summary, "Mahty.xlsx", sheetName="Sheet7", col.names=TRUE, row.names=TRUE, append=TRUE)

menMedian <- tapply(males$Annual.Rt, males$Union.Status, median, na.rm=TRUE)
womenMedian <- tapply(females$Annual.Rt, females$Union.Status, median)
menAverage <- tapply(males$Annual.Rt, males$Union.Status, mean, na.rm=TRUE)
womenAverage <- tapply(females$Annual.Rt, females$Union.Status, mean)

summary2 <- rbind(menAverage, womenAverage, menMedian, womenMedian)

write.xlsx(summary2, "Mahty.xlsx", sheetName="Sheet8", col.names=TRUE, row.names=TRUE, append=TRUE)

summary3 <- table(ethnicclm)

EthnicityAverage <- tapply(salaryclm, ethnicclm, mean)
EthnicityMedian <- tapply(salaryclm, ethnicclm, median)

ethnicity <- rbind(summary3, EthnicityAverage, EthnicityMedian)

write.xlsx(ethnicity, "Mahty.xlsx", sheetName="Ethnicity", col.names=TRUE, row.names=TRUE, append=TRUE)



}


