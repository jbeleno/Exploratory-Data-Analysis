library(ggplot2)
source("load_data.R")

# I subset the data for Baltimore City, Maryland (fips == "24510")
emissionDataInBaltimore <- NEI[NEI$fips == "24510",]

# I summarize the PM2.5 emissions per year
emissionsPerYearAndType <- aggregate(Emissions ~ year+type, 
                                     data = emissionDataInBaltimore, sum)

# I plot the results with ggplot2
qplot(
    year, 
    Emissions, 
    data = emissionsPerYearAndType,
    geom = "line", 
    col = type,
    main = "Total PM2.5 emissions per year and type in Baltimore City",
    xlab = "Years",
    ylab = "PM2.5 emitted (tons)"
)

# I store the plot in a PNG file
ggsave(filename = "plot3.png")