source("load_data.R")

# I subset NEI by EI.Sector that match coal combustion-related sources
# I observed that just 3 EI.Sector match this condition
CoalCombustionRelated <- SCC[
    SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal" |
    SCC$EI.Sector == "Fuel Comb - Electric Generation - Coal" | 
    SCC$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal",
]

# I add a new column Short.Name from SCC to NEI
mergedDataSet <- merge(NEI, CoalCombustionRelated, by = "SCC")

# I summarize the PM2.5 emissions per year
emissionsPerYear <- aggregate(Emissions ~ year, data = mergedDataSet, sum)

# I plot the results with Base System
par(mar=c(4,4,2,2))
plot(
    emissionsPerYear, 
    type= "l",
    col = "steelblue2",
    main = "Total PM2.5 emissions in coal combustion-related sources",
    xlab = "Years",
    ylab = "PM2.5 emitted (tons)",
    lwd = 2.5,
    cex.main = 0.9
)

# I store the plot in a PNG file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
