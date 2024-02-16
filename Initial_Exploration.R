library(tidyverse)
library(ggplot2)
online <- read_csv("data/online_review.csv")

###
online_clean <- online |> 
  mutate(
    `Level of Education` = fct_recode(`Level of Education`,
                          1 = School))

online$`Level of Education` <- as.integer(online$`Level of Education`)

levels(online$`Level of Education`)
###

level_mapping <- c("School" = 0, "Under Graduate" = 1, "Post Graduate" = 2)

online$levels_ed_num <- level_mapping[online$`Level of Education`]

online |> 
summarise(mean = mean(levels_ed_num),
          median = median(levels_ed_num),
          sd = sd(levels_ed_num),
          min = min(levels_ed_num),
          max = max(levels_ed_num),
          mode = mode(levels_ed_num))


