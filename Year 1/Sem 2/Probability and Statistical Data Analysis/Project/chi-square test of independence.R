library(MASS)
tbl = table (Heart_attack_risk$Smoking, Heart_attack_risk$`Heart Attack Risk`)

chisq.test(tbl, correct = FALSE)

alpha <- 0.05
x2.alpha <- qchisq(alpha, df=2, lower.tail = FALSE)
x2.alpha
