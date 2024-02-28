library(tidyverse)
library(ggplot2)
library(knitr)
online <- read_csv("data/online_review.csv")
level_mapping <- c("School" = 0, "Under Graduate" = 1, "Post Graduate" = 2)
class_mapping <- c("Rich" = 0, "Middle Class" = 1, "Poor" = 2)
online$levels_ed_num <- level_mapping[online$`Level of Education`]
online$class_level <- class_mapping[online$`Economic status`]


# mean for performance in online = 6.7 = mu 

t.test(x = online$`Performance in online`, mu = 6.696031 )
#t_test_result <- t.test(`Performance in online` ~ `class_level`, data = online)


# Linear Regression
online$`Level of Education` <- factor(online$`Level of Education`)
online$`Level of Education` <- relevel(online$`Level of Education`, ref = "Post Graduate")

online$`Economic status` <- factor(online$`Economic status`)
online$`Economic status` <- relevel(online$`Economic status`, ref = "Middle Class")

# Fit linear regression model with updated reference categories
lm_result <- lm(`Performance in online` ~ `Economic status` + `Level of Education`, data = online)
summary(lm_result)
lm_result

# using model with NUMBERS/Binary predictors
performance_model <- lm(`Performance in online` ~ levels_ed_num + class_level, data = online)
summary(performance_model) 
performance_model 

# economic class vs. study time hours
lm_2_result <- lm(`Study time (Hours)` ~ class_level, data = online)
summary(lm_2_result)
lm_2_result


online |> 
  ggplot()
  