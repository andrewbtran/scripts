meetups = read.csv("bostonsiliconvalley.csv")

cities = table(meetups$City, meetups$Category)
write.csv(cities, "cities.csv")
cities = table(meetups$Area, meetups$Category)
write.csv(cities, "cities2.csv")

meet = read.csv("meetups-2014-05-08.csv")
cities = table(meet$City, meet$Category)
write.csv(cities, "cities2.csv")
towns = table(meet$Town, meet$Category)
write.csv(towns, "towns.csv")



m2003=subset(meet, Year_Started==2003)
m2004=subset(meet, Year_Started==2004)
m2005=subset(meet, Year_Started==2005)
m2006=subset(meet, Year_Started==2006)
m2007=subset(meet, Year_Started==2007)
m2008=subset(meet, Year_Started==2008)
m2009=subset(meet, Year_Started==2009)
m2010=subset(meet, Year_Started==2010)
m2011=subset(meet, Year_Started==2011)
m2012=subset(meet, Year_Started==2012)
m2013=subset(meet, Year_Started==2013)
m2014=subset(meet, Year_Started==2014)

write.csv(table(m2002$City, m2002$Category), "m2002.csv")

write.csv(table(m2003$City, m2003$Category), "m2003.csv")

write.csv(table(m2004$City, m2004$Category), "m2004.csv")

write.csv(table(m2005$City, m2005$Category), "m2005.csv")

write.csv(table(m2006$City, m2006$Category), "m2006.csv")

write.csv(table(m2007$City, m2007$Category), "m2007.csv")

write.csv(table(m2008$City, m2008$Category), "m2008.csv")

write.csv(table(m2009$City, m2009$Category), "m2009.csv")

write.csv(table(m2010$City, m2010$Category), "m2010.csv")

write.csv(table(m2011$City, m2011$Category), "m2011.csv")

write.csv(table(m2012$City, m2012$Category), "m2012.csv")

write.csv(table(m2013$City, m2013$Category), "m2013.csv")

write.csv(table(m2014$City, m2014$Category), "m2014.csv")

boston = subset(meet, City=="Boston")
sf = subset(meet, City=="San Francisco")
tapply(sf$Members, sf$Category, sum)
sfmembers = tapply(sf$Members, sf$Category, sum)
write.csv(sfmembers, "sfmembers.csv")
bostonmembers = tapply(boston$Members, boston$Category, sum)
write.csv(bostonmembers, "bostonmembers.csv")

