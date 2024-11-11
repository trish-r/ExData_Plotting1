library(ggplot2)
data<-read.table("C:\\Users\\TRISH\\Dropbox\\My PC (LAPTOP-GQQBJL4A)\\Downloads\\household_power_consumption.txt",header=T,sep=";",na.strings="?")
data<-na.omit(data)
data$Global_active_power <- as.numeric(data$Global_active_power)
plot1<-ggplot(data, aes(x = Global_active_power)) +
  geom_histogram(fill = "red", color = "black", bins = 30) +
  labs(title="Global Active Power",x ="Global Active Power (kilowatts)",y ="Frequency")

ggsave("C:\\Users\\TRISH\\OneDrive - BonGuides\\Desktop\\Coursera_Project\\plot1.png", plot = plot1, width = 480, height = 480, units = "px")
