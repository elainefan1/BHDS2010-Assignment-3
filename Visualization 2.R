library(tidyverse)

df <- readr::read_csv("TextMessages.csv")

# reshape data to combine our time (baseline and 6 months) into one column

df_combine <- df %>% 
  pivot_longer(
    cols = c(Baseline, Six_months),
    names_to = "Time",
    values_to = "Messages"
  )

# create our facted bar plot

ggplot(df_combine, aes(x = Time, y = Messages, fill = Time)) +
  geom_col() +
  facet_wrap(~ Group) +
  labs(
    title = "Text messages by Group and Time",
    x = "Time",
    y = "# of Text messages",
    fill = "Time"
  ) +
  theme_minimal()
