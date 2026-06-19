datasets <- datasets
View(datasets)

gender.freq <- table(datasets[,3])
View(gender.freq)
heartrate.freq <- table(datasets[,6])
View(heartrate.freq)
library(dplyr)

mean_sd_count_heart_rates <- datasets %>%
  group_by(Sex) %>%
  summarize(
    mean_heartRate = mean(`Heart Rate`, na.rm = TRUE),
    sd_heartRate = sd(`Heart Rate`, na.rm = TRUE),
    count = n()
  )

print(mean_sd_count_heart_rates)

xbar1 = 75.36237
xbar2 = 74.87383
s1 = 20.64224
s2 = 20.51114
n1 = 2652
n2 = 6111
t0 = (xbar1-xbar2-0)/(sqrt((s1^2/n1)+(s2^2/n2))) 
v = ((s1^2/n1)+(s2^2/n2))^2/((((s1^2/n1)^2)/(n1-1))+(((s2^2/n2)^2)/(n2-1)))
alpha = 0.05
t.alpha = qt(alpha/2, floor(v))



str(datasets)
male_heart_rate <- datasets %>% filter(Sex == "Male") %>% pull(`Heart Rate`)
female_heart_rate <- datasets %>% filter(Sex == "Female") %>% pull(`Heart Rate`)    
t_test_result <- t.test(female_heart_rate, male_heart_rate)
print(t_test_result)

p_value <- t_test_result$p.value
cat("The p-value is:", p_value, "\n")

