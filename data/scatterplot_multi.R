library(tidyverse)
library(ggplot2)
library(knitr)
online <- read_csv("data/online_review.csv")
level_mapping <- c("School" = 0, "Under Graduate" = 1, "Post Graduate" = 2)
class_mapping <- c("Rich" = 0, "Middle Class" = 1, "Poor" = 2)
online$levels_ed_num <- level_mapping[online$`Level of Education`]
online$class_level <- class_mapping[online$`Economic status`]


online |> 
  filter(levels_ed_num != 2) |> 
  ggplot(aes(x = levels_ed_num, y = `Performance in online`)) +
           geom_jitter() +
  geom_smooth(method = "lm", se = FALSE) 

online |> 
  filter(class_level != 0) |> 
  ggplot(aes(x = class_level, y = `Performance in online`)) +
  geom_jitter() +
  geom_smooth(method = "lm", se = FALSE) 

