library(XML)
library(CSS)

list <- read.csv("airbnbcrawl.csv", stringsAsFactors=FALSE)

list_length <- 1:length(list$Link)

baseURL <- "http://www.airbnb.com"

r.page <- readLines("https://www.airbnb.com/rooms/6976?s=fKj3")

doc = htmlParse(r.page, useInternal = TRUE)

bed_x <- "//*[@id='details-column']/div/div[2]/div[2]/div/div[1]/div[1]/strong"
title_x <- "/html/head/title"
property_type_x <- "//*[@id='details-column']/div/div[2]/div[2]/div/div[1]/div[2]/strong"
accomodates_x <- "//*[@id='details-column']/div/div[2]/div[2]/div/div[1]/div[3]/strong"
bedrooms_x <- "//*[@id='details-column']/div/div[2]/div[2]/div/div[1]/div[4]/strong"
bathrooms_x <- "//*[@id='details-column']/div/div[2]/div[2]/div/div[2]/div[1]/strong"
beds_x <- "//*[@id='details-column']/div/div[2]/div[2]/div/div[2]/div[2]/strong"
extra_c <- "#extra_people_price_string"
weekly_c <- "#weekly_price_string"
monthly_c <- "#monthly_price_string"
description_c <- "#description_text_wrapper > div.long-version"
minimum_c <- "#details-column > div > div:nth-child(16) > div.col-9 > div > div:nth-child(1) > div > strong"
reviews_c <- "#reviews > div > div > div > div > div.panel-body > h4"
neighborhood_c <- "#hover-card > div.sliding-carousel.neighborhood-sliding-carousel > div.carousel-view > ul > li:nth-child(1) > div > div.title.text-center.row.row-table.text-contrast.row-space-top-3 > div > div > a"
neighborhood_x <- "//*[@id='hover-card']/div[1]/div[1]/ul/li[1]/div/div[2]/div/div/a"
address_c <- "#hover-card > div:nth-child(3) > div"
address_x <- "//*[@id='hover-card']/div[3]/div"

title <- unlist(xpathApply(doc, title_x, xmlValue))
price <- cssApply(doc, "#pricing>.text-special", cssNumeric)
who <- cssApply(doc, ".row>.text-center>.text-wrap", cssCharacter)
profile_link <- cssApply(doc, ".long-version.hide >p>a", cssLink)
profile_link<- paste(baseURL, Profile_Link, sep="")
bed_type <- xpathApply(doc, bed_x, xmlValue)
property_type <- xpathApply(doc, property_type_x, xmlValue)
accomodates <- xpathApply(doc, accomodates_x, xmlValue)
bedrooms <- xpathApply(doc, bedrooms_x, xmlValue)
bathrooms <- xpathApply(doc, bathrooms_x, xmlValue)
extra <- cssApply(doc, extra_c, cssCharacter)
weekly <- cssApply(doc, weekly_c, cssNumeric)
monthly <- cssApply(doc, monthly_c, cssNumeric)
description <- unlist(cssApply(doc, description_c, cssCharacter))
description <- gsub('\\n', ' ', description)
minimum <- cssApply(doc, minimum_c, cssNumeric)
reviews <- cssApply(doc, reviews_c, cssNumeric)
neighborhood <- cssApply(doc, neighborhood_c, cssNumeric)
address <- cssApply(doc, address_c, cssNumeric)


cssApply(doc, ".row>.col-9>.text-center>.col-3", cssNumeric)

>.hide >a"

.row>.col-9>.text-center>.col-3
#room>#summary>.page-container>.row>.col-4>

title <- "/html/head/title"

description <- "/html/head/meta[5]"

city <- "/html/head/meta[16]"

unlist(xpathApply(html, "/html/head/title", xmlValue))


doc <- htmlParse(r.page)

//*[@id='host-profile']

//*[@id="summary"]/div/div/div[1]/div/div[2]/div[1]/a

doc.text = unlist(xpathApply(doc.html, '//p', xmlValue))

cssApply(doc, ".col-9>.row-space-2>.review-text", cssCharacter)

<div class="col-9">
  <div class="row-space-2">
  <div data-review-id="13120367" data-original-text="" class="review-text">


//*[@id="listing_name"]

doc.text = gsub('\\n', ' ', doc.text)

doc.text = paste(doc.text, collapse = ' ')