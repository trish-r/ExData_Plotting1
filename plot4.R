# library(ggplot2)
# library(gridExtra)
# data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
# p1 <- ggplot(data, aes(x=datetime, y=Global_active_power)) +
#   geom_line() +
#   labs(y="Global Active Power", x="") +
#   theme_bw() +
#   theme(plot.margin = unit(c(0.2,0.2,0.2,0.2), "cm"))
# 
# p2 <- ggplot(data, aes(x=datetime, y=Voltage)) +
#   geom_line() +
#   labs(y="Voltage", x="datetime") +
#   theme_bw() +
#   theme(plot.margin = unit(c(0.2,0.2,0.2,0.2), "cm"))
# 
# p3 <- ggplot(data) +
#   geom_line(aes(x=datetime, y=Sub_metering_1, color="Sub_metering_1")) +
#   geom_line(aes(x=datetime, y=Sub_metering_2, color="Sub_metering_2")) +
#   geom_line(aes(x=datetime, y=Sub_metering_3, color="Sub_metering_3")) +
#   scale_color_manual(values=c("black", "red", "blue")) +
#   labs(y="Energy sub metering", x="") +
#   theme_bw() +
#   theme(legend.title=element_blank(),
#         legend.position="right",
#         plot.margin = unit(c(0.2,0.2,0.2,0.2), "cm"))
# 
# p4 <- ggplot(data, aes(x=datetime, y=Global_reactive_power)) +
#   geom_line() +
#   labs(y="Global_reactive_power", x="datetime") +
#   theme_bw() +
#   theme(plot.margin = unit(c(0.2,0.2,0.2,0.2), "cm"))
# 
# combined_plot <- grid.arrange(p1, p2, p3, p4, ncol=2)
# ggsave("plot4.png", 
#        combined_plot, 
#        width=480/72, 
#        height=480/72, 
#        units="px",
#        dpi=72)

# Load required libraries
library(ggplot2)
library(gridExtra)

# Assuming data is already loaded
# Convert Date and Time to datetime
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Create the four individual plots
# Top left - Global active power
p1 <- ggplot(data, aes(x=datetime, y=Global_active_power)) +
  geom_line() +
  labs(y="Global Active Power", x="") +
  theme_bw()

# Top right - Voltage
p2 <- ggplot(data, aes(x=datetime, y=Voltage)) +
  geom_line() +
  labs(y="Voltage", x="datetime") +
  theme_bw()

# Bottom left - Energy sub metering
p3 <- ggplot(data) +
  geom_line(aes(x=datetime, y=Sub_metering_1, color="Sub_metering_1")) +
  geom_line(aes(x=datetime, y=Sub_metering_2, color="Sub_metering_2")) +
  geom_line(aes(x=datetime, y=Sub_metering_3, color="Sub_metering_3")) +
  scale_color_manual(values=c("black", "red", "blue")) +
  labs(y="Energy sub metering", x="") +
  theme_bw() +
  theme(legend.title=element_blank(),
        legend.position="right")

# Bottom right - Global reactive power
p4 <- ggplot(data, aes(x=datetime, y=Global_reactive_power)) +
  geom_line() +
  labs(y="Global_reactive_power", x="datetime") +
  theme_bw()

# Arrange all plots in a 2x2 grid
combined_plot <- grid.arrange(p1, p2, p3, p4, ncol=2)

# Save the plot with exact pixel dimensions (480x480)
png("plot4.png", width=480, height=480)
grid.arrange(p1, p2, p3, p4, ncol=2)
dev.off()