library(ggplot2)
source("load_data.R")

# I subset the data for Baltimore City, Maryland (fips == "24510")
# or  Los Angeles County, California (fips == "06037")
emissionDataSubSet <- NEI[
    (NEI$fips == "24510" | 
    NEI$fips == "06037") &
    NEI$type == "ON-ROAD",
]

#I set the cities' names
emissionDataSubSet$city = rep(NA, nrow(emissionDataSubSet))
emissionDataSubSet[emissionDataSubSet$fips == "24510", ]$city = "Baltimore City";
emissionDataSubSet[emissionDataSubSet$fips == "06037", ]$city = "Los Angeles County";

# I summarize the PM2.5 emissions per year
emissionsPerYear <- aggregate(Emissions ~ year+city, 
                                     data = emissionDataSubSet, sum)

# I plot the results with ggplot2
qplot(
    year, 
    Emissions, 
    data = emissionsPerYear,
    geom = c("point","line"), 
    col = city,
    main = "Total PM2.5 emissions for vehicles in Baltimore City and Los Angeles County",
    xlab = "Years",
    ylab = "PM2.5 emitted (tons)"
)+theme(plot.title = element_text(size = 12))

# I store the plot in a PNG file
ggsave(filename = "plot6.png")