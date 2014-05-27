setwd("C:/Users/andrew.tran/Downloads")
payroll = read.csv("boston_staffing.csv")

payroll$Service.Dt = as.Date(payroll$Service.Dt)
marty = subset(payroll, Service.Dt >= "2014-01-06")
menino = subset(payroll, Service.Dt < "2014-01-06")

foo <- data.frame(do.call('rbind', strsplit(as.character(menino$Employee.Name),',',fixed=TRUE)))
foo2 <- data.frame(do.call('rbind', strsplit(as.character(foo$X2)," ")))
menino$Name = foo2$X1
menino$Last.Name = foo$X1

names = read.csv("malefemalenames.csv")
meninogenders = merge(menino, names, by="Name")
write.csv(meninogenders, "meninonames.csv")

meninounion = table(meninogenders$prob.gender, meninogenders$Union.Status)

write.csv(meninounion, "meninounion.csv")

