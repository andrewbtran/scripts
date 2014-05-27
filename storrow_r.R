bridges=read.csv("bridge_beta.csv", stringsAsFactors=FALSE)
library(ggplot)
library(ggplot2)
library(maps)


boston=get_map(location="boston", zoom=11)
storrow = get_map(location=c(lon = -71.094031, lon =42.357925), zoom=13)

WeekdayCounts = as.data.frame(table(bridges$Date))
WeekdayCounts$Var1 = factor(WeekdayCounts$Var1, ordered=TRUE, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday"))
MonthCount = as.data.frame(table(bridges$Month))
MonthCount$Var1 = factor(MonthCount$Var1, ordered=TRUE, levels=c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))
barplot(table(bridges$Year))

ggplot(WeekdayCounts, aes(x=WeekdayCounts$Var1, y=WeekdayCounts$Freq)) + geom_bar(fill="red") + xlab("Day") + ylab("Total Overhead/Oversized vehicle crashes")

ggplot(MonthCount, aes(x=MonthCount$Var1, y=MonthCount$Freq)) + geom_bar(fill="orange") + xlab("Month") + ylab("Total Overhead/Oversized vehicle crashes")
LatLonCounts = as.data.frame(table(bridges$Longitude, bridges$Latitude))
LatLonCounts$Long = as.numeric(as.character(LatLonCounts$Var1))
LatLonCounts$Lat = as.numeric(as.character(LatLonCounts$Var2))

LatLonCounts2=subset(LatLonCounts, Freq >0)
ggmap(storrow) + geom_point(data = LatLonCounts2, aes(x = Long, y = Lat, color = Freq, size=Freq)) + scale_colour_gradient(low="green", high="blue")
ggmap(storrow) + geom_point(data = LatLonCounts2, aes(x = Long, y = Lat, color = Freq, size=Freq)) + scale_colour_gradient(low="red", high="blue")

b2002 = subset(bridges, Year==2002)
b2003 = subset(bridges, Year==2003)
b2004 = subset(bridges, Year==2004)
b2005 = subset(bridges, Year==2005)
b2006 = subset(bridges, Year==2006)
b2007 = subset(bridges, Year==2007)
b2008 = subset(bridges, Year==2008)
b2009 = subset(bridges, Year==2009)
b2010 = subset(bridges, Year==2010)
b2011 = subset(bridges, Year==2011)
b2012 = subset(bridges, Year==2012)
b2013 = subset(bridges, Year==2013)
b2014 = subset(bridges, Year==2014)


table(b2002$Calendar <= "2002-05-05")
table(b2003$Calendar <= "2003-05-05")
table(b2004$Calendar <= "2004-05-05")
table(b2005$Calendar <= "2005-05-05")
table(b2006$Calendar <= "2006-05-05")
table(b2007$Calendar <= "2007-05-05")
table(b2008$Calendar <= "2008-05-05")
table(b2009$Calendar <= "2009-05-05")
table(b2010$Calendar <= "2010-05-05")
table(b2011$Calendar <= "2011-05-05")
table(b2012$Calendar <= "2012-05-05")
table(b2013$Calendar <= "2013-05-05")
table(b2014$Calendar <= "2014-05-05")


