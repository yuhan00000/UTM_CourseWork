install.packages("ggplot2")
library(ggplot2)

heartAttack = read.csv("C:\\Users\\User\\Desktop\\UTM\\Y1S2\\PSDA\\project2\\dataset.csv")

Cholesterol <- datasets[,4]
BMI <- datasets[,19]

x <- c(Cholesterol)
y <- c(BMI)

Cholesterol <- as.numeric(unlist(x))
BMI <- as.numeric(unlist(y))

plot(Cholesterol, BMI, xlab = "Cholesterol", ylab = "BMI", main = "Relationship between BMI against cholesterol")

ggplot(data, aes(x = Cholesterol, y = BMI)) + geom_point()

lmHeartAttack = lm(Cholesterol ~ BMI, data = heartAttack)
summary(lmHeartAttack)

sse <- sum((fitted(lmHeartAttack) - heartAttack$Cholesterol)^2)
sse

ssr <- sum((fitted(lmHeartAttack) - mean(heartAttack$Cholesterol))^2)
ssr

sst = ssr + sse
sst

R2 = ssr / sst

lmHeartAttack <- lm (Cholesterol ~ BMI)
lmHeartAttack

plot (Cholesterol, BMI)
abline (lmHeartAttack)

plot (Cholesterol, BMI, xlab = "Cholesterol", ylab = "BMI", main = "Relationship between BMI against cholesterol")
abline (lmHeartAttack)
