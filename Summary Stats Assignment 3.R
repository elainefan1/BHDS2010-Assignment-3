library(tidyverse)

readr::read_csv("TextMessages.csv")

# reshape data to combine our time (baseline and 6 months) into one column

df_combine <- df %>% 
  pivot_longer(
    cols = c(Baseline, Six_months),
    names_to = "Time",
    values_to = "Messages"
  )

# output our summary statistics

summary_stats <- df_combine %>% 
  group_by(Group, Time) %>% 
  summarise(
    mean = mean(Messages),
    sd = sd(Messages),
    n = n(),
    var = var(Messages),
    .groups = "drop"
  )

# place summary stats in a table

knitr::kable(summary_stats, digits = 2,
             caption = "Summary Statistics for Messages by Group and Time")
