library(tidyverse)

cur_dir <- getwd()
setwd("02-Dictionaries")

source("functions/get_2yr_moving_avg.R")

d <- read_csv("output/mccall_dict_proportions_by_year.csv")

d %>%
  mutate(
    mccall_2yr_ma = get_2yr_moving_avg(dict_explicit_or_implicit), 
    hand_2yr_ma = get_2yr_moving_avg(hand_explicit_or_implicit)
  ) %>%
  with(cor(mccall_2yr_ma, hand_2yr_ma, use = "pairwise"))

setwd(cur_dir)