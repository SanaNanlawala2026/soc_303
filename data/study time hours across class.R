library(ggplot2)
ggplot(online, aes(x = `Study time (Hours)`, fill = `Economic status`)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 1, color = "black", position = "identity", alpha = 0.5) +
  labs(title = "Histogram of Study Time Hours by Class", x = "Study Time Hours", y = "Frequency") +
  scale_fill_manual(values = c("Poor" = "pink", "Middle Class" = "red", "Rich" = "purple"))

