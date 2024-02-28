## hello ##
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
mean_value_performance <- mean(online$'Performance in online')
mean_value_performance

# Compute the size
n_performance <- length(online$'Performance in online')

# Find the standard deviation
standard_deviation_performance <- sd(online$'Performance in online')

# Find the standard error
standard_error_performance <- standard_deviation_performance / sqrt(1032)


alpha = 0.05
degrees_of_freedom = 1032
t_score = qt(p=alpha/2, df=degrees_of_freedom,lower.tail=F)
print(t_score)

margin_error_performance <- t_score * standard_error_performance

# Calculate the lower bound 
lower_bound_performance <- mean_value_performance - margin_error_performance

# Calculate the upper bound 
upper_bound_performance <- mean_value_performance + margin_error_performance

lower_bound_performance
upper_bound_performance

#creating histogram
online |> 
  ggplot(aes(x = `Performance in online`)) +
  geom_bar(fill= "white", color = "black")+ 
  geom_vline(xintercept = mean_value_performance, 
             color = "red", linetype = "dashed") + 
  geom_vline(xintercept = upper_bound_performance, 
             color = "purple", linetype = "dashed") + 
  geom_vline(xintercept = lower_bound_performance, 
             color = "pink", linetype = "dashed") +
  labs(title = "Performance in Online School with 95% Confidence Interval")

