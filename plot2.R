library(ggplot2)
data<-read.table("C:\\Users\\TRISH\\Dropbox\\My PC (LAPTOP-GQQBJL4A)\\Downloads\\household_power_consumption.txt",header=T,sep=";",na.strings="?")
data<-na.omit(data)
# data$Global_active_power <- as.numeric(data$Global_active_power)
plot2<-ggplot(data, aes(x = Time, y = Sub_metering_1)) +
  geom_line(color = "black") +
  labs(title = "Sub Metering 1", x = "Time", y = "Sub Metering 1 (watt-hour)")

ggsave("C:\\Users\\TRISH\\OneDrive - BonGuides\\Desktop\\Coursera_Project\\plot2.png", plot = plot2, width = 480, height = 480, units = "px")
