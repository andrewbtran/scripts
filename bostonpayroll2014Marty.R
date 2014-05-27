foo <- data.frame(do.call('rbind', strsplit(as.character(marty$Employee.Name),',',fixed=TRUE)))
foo2 <- data.frame(do.call('rbind', strsplit(as.character(foo$X2)," ")))
marty$Name = foo2$X1
marty$Last.Name = foo$X1

names = read.csv("malefemalenames.csv")
martygenders = merge(marty, names, by="Name")
write.csv(martygenders, "martynames.csv")


martyunion = table(martygenders$prob.gender, martygenders$Union.Status)
write.csv(martyunion, "martyunion.csv")
