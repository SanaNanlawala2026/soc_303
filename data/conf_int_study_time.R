library(tidyverse)
library(ggplot2)
online <- read_csv("data/online_review.csv")
level_mapping <- c("School" = 0, "Under Graduate" = 1, "Post Graduate" = 2)

online$levels_ed_num <- level_mapping[online$`Level of Education`]

online |> 
  summarise(mean = mean(levels_ed_num),
            median = median(levels_ed_num),
            sd = sd(levels_ed_num),
            min = min(levels_ed_num),
            max = max(levels_ed_num),
            mode = mode(levels_ed_num))

# R program to determine the mean

# Calculate the mean of the Sepal.Length
mean_value <- mean(online$'Study time (Hours)')
mean_value

# Compute the size
n <- length(online$'Study time (Hours)')

# Find the standard deviation
standard_deviation <- sd(online$'Study time (Hours)')

# Find the standard error
standard_error <- standard_deviation / sqrt(n)


alpha = 0.05
degrees_of_freedom = 1032
t_score = qt(p=alpha/2, df=degrees_of_freedom,lower.tail=F)
print(t_score)

margin_error <- t_score * standard_error

# Calculate the lower bound 
lower_bound <- mean_value - margin_error

# Calculate the upper bound 
upper_bound <- mean_value + margin_error

lower_bound
upper_bound

#creating histogram
online |> 
  ggplot(aes(x = `Study time (Hours)`)) +
  geom_bar(fill= "white", color = "black")+ 
  geom_vline(xintercept = mean_value, 
             color = "red", linetype = "dashed") + 
  geom_vline(xintercept = upper_bound, 
             color = "purple", linetype = "dashed") + 
  geom_vline(xintercept = lower_bound, 
             color = "pink", linetype = "dashed") +
  labs(title = "Study Time Hours with 95% Confidence Interval")

