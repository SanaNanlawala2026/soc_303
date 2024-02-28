library(tidyverse)
library(vtable)
library(knitr)

## this function is used to calculate the mode ##
calculate_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

## performance in online ##
online |> 
  summarise(count = n(),
            mean = mean(`Performance in online`),
            median = median(`Performance in online`),
            sd = sd(`Performance in online`),
            min = min(`Performance in online`),
            max = max(`Performance in online`),
            mode = calculate_mode(`Performance in online`)) %>% 
  kable()

## study time hours ##
online |> 
  summarise(count = n(),
            mean = mean(`Study time (Hours)`),
            median = median(`Study time (Hours)`),
            sd = sd(`Study time (Hours)`),
            min = min(`Study time (Hours)`),
            max = max(`Study time (Hours)`),
            mode = calculate_mode(`Study time (Hours)`)) %>% 
  kable()

## level of education ##
online |> 
  summarise(count = n(),
            mean = mean(levels_ed_num),
            median = median(levels_ed_num),
            sd = sd(levels_ed_num),
            min = min(levels_ed_num),
            max = max(levels_ed_num),
            mode = calculate_mode(levels_ed_num)) %>% 
  kable()
