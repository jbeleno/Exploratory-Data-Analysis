source("load_data.R")

# I subset the data for Baltimore City, Maryland (fips == "24510") and 
# vehicles has the type as "ON-ROAD"
emissionDataOFVehiclesInBaltimore <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]

# I summarize the PM2.5 emissions per year
emissionsPerYear <- aggregate(Emissions ~ year, 
                              data = emissionDataOFVehiclesInBaltimore, sum)

# I plot the results with Base System
par(mar=c(4,4,2,2))
plot(
    emissionsPerYear, 
    type= "l",
    col = "steelblue2",
    main = "Total PM2.5 emissions for vehicles sources in Baltimore City",
    xlab = "Years",
    ylab = "PM2.5 emitted (tons)",
    lwd = 2.5,
    cex.main = 0.9
)

# I store the plot in a PNG file
dev.copy(png, file = "plot5.png", width=480, height=480)
dev.off()