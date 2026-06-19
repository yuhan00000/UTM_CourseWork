age <-datasets[ ,2]
heartRate <-datasets[,6]

x<-c(age)
y<-c(heartRate)

Age <- as.numeric(unlist(x))
HeartRate <- as.numeric(unlist(y))

cor(age,heartRate)

plot(Age,HeartRate,xlab = "Age", ylab = "Heart Rate", main = "Relationship between Age and Heart Rate")
cor.test(Age,HeartRate,method="pearson")

r<-cor(age,heartRate)
n<-8763
df_2=n-2
t2=(r/(sqrt((1-r^2)/(n-2))))
t2

