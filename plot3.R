library(ggplot2)
data<-read.table("C:\\Users\\TRISH\\Dropbox\\My PC (LAPTOP-GQQBJL4A)\\Downloads\\household_power_consumption.txt",header=T,sep=";",na.strings="?")
data<-na.omit(data)
# data$Global_active_power <- as.numeric(data$Global_active_power)
plot3<-ggplot(data) +
  geom_line(aes(x = Time, y = Sub_metering_1, color = "Sub_metering_1")) +
  geom_line(aes(x = Time, y = Sub_metering_2, color = "Sub_metering_2")) +
  geom_line(aes(x = Time, y = Sub_metering_3, color = "Sub_metering_3")) +
  scale_color_manual(values = c("red", "blue", "black")) +
  labs(title = "Energy Sub Metering", x = "Time", y = "Energy (watt-hour)") +
  theme(legend.title = element_blank())

ggsave("C:\\Users\\TRISH\\OneDrive - BonGuides\\Desktop\\Coursera_Project\\plot3.png", plot = plot3, width = 480, height = 480, units = "px")
