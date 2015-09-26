source("load_data.R")

# I subset the data for Baltimore City, Maryland (fips == "24510")
emissionDataInBaltimore <- NEI[NEI$fips == "24510",]

# I summarize the PM2.5 emissions per year
emissionsPerYear <- aggregate(Emissions ~ year, data = emissionDataInBaltimore, sum)

# I plot the results with Base System
par(mar=c(4,4,2,2))
plot(
    emissionsPerYear, 
    type= "l",
    col = "steelblue2",
    main = "Total PM2.5 emissions per year in Baltimore City",
    xlab = "Years",
    ylab = "PM2.5 emitted (tons)",
    lwd = 2.5
)

# I store the plot in a PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()