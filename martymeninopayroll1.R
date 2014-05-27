setwd("C:/Users/andrew.tran/Downloads")
payroll = read.csv("newpayroll.csv")
payroll$Service.Dt = as.Date(payroll$Service.Dt)
marty = subset(payroll, Service.Dt >= "2014-01-06")
menino = subset(payroll, Service.Dt < "2014-01-06")
menino = subset(menino, Service.Dt >= "1993-07-12")

#martyA = subset(marty, Department.Name =="Mayor's Office")
#meninoA = subset(menino, Department.Name=="Mayor's Office")

#martyB = subset(marty, Department.Name =="Mayor's Office-Public Info")
#meninoB = subset(menino, Department.Name=="Mayor's Office-Public Info")

#marty = rbind(martyA, martyB)
#menino = rbind(meninoA, meninoB)

foo <- data.frame(do.call('rbind', strsplit(as.character(menino$Employee.Name),',',fixed=TRUE)))
foo2 <- data.frame(do.call('rbind', strsplit(as.character(foo$X2)," ")))
menino$Name = foo2$X1
menino$Last.Name = foo$X1

names = read.csv("malefemalenames.csv")
meninogenders = merge(menino, names, by="Name")
write.csv(meninogenders, "meninonames.csv")

meninounion = table(meninogenders$prob.gender, meninogenders$Union.Status)

write.csv(meninounion, "meninounion.csv")

foo <- data.frame(do.call('rbind', strsplit(as.character(marty$Employee.Name),',',fixed=TRUE)))
foo2 <- data.frame(do.call('rbind', strsplit(as.character(foo$X2)," ")))
marty$Name = foo2$X1
marty$Last.Name = foo$X1

names = read.csv("malefemalenames.csv")
martygenders = merge(marty, names, by="Name")
write.csv(martygenders, "martynames.csv")

meninogenders = read.csv("meninonames.csv")

martyunion = table(martygenders$prob.gender, martygenders$Union.Status)

write.csv(martyunion, "martyunion.csv")

malemenino = subset(meninogenders, prob.gender=="Male")
femalemenino = subset(meninogenders, prob.gender=="Female")
unknownmenino = subset(meninogenders, prob.gender=="Unknown")

median(malemenino$Annual.Rt)
median(femalemenino$Annual.Rt)
median(unknownmenino$Annual.Rt)


mean(malemenino$Annual.Rt)
mean(femalemenino$Annual.Rt)
mean(unknownmenino$Annual.Rt)

tapply(malemenino$Annual.Rt, malemenino$Union.Status, median)
tapply(femalemenino$Annual.Rt, femalemenino$Union.Status, median)
tapply(unknownmenino$Annual.Rt, unknownmenino$Union.Status, median)

tapply(malemenino$Annual.Rt, malemenino$Union.Status, mean)
tapply(femalemenino$Annual.Rt, femalemenino$Union.Status, mean)
tapply(unknownmenino$Annual.Rt, unknownmenino$Union.Status, mean)

malemarty = subset(martygenders, prob.gender=="Male")
femalemarty = subset(martygenders, prob.gender=="Female")
unknownmarty = subset(martygenders, prob.gender=="Unknown")

median(malemarty$Annual.Rt)
median(femalemarty$Annual.Rt)
median(unknownmarty$Annual.Rt)


mean(malemarty$Annual.Rt)
mean(femalemarty$Annual.Rt)
mean(unknownmarty$Annual.Rt)


tapply(malemarty$Annual.Rt, malemarty$Union.Status, median)
tapply(femalemarty$Annual.Rt, femalemarty$Union.Status, median)
tapply(unknownmarty$Annual.Rt, unknownmarty$Union.Status, median)

tapply(malemarty$Annual.Rt, malemarty$Union.Status, mean)
tapply(femalemarty$Annual.Rt, femalemarty$Union.Status, mean)
tapply(unknownmarty$Annual.Rt, unknownmarty$Union.Status, mean)

