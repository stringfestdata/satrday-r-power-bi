# https://towardsdatascience.com/modelling-binary-logistic-regression-using-tidymodels-library-in-r-part-1-c1bdce0ac055


library(tidymodels)
library(tidyverse)


dataset <- read_csv('../data/contestants.csv') %>% 
  mutate_if(is.numeric, zoo::na.aggregate) %>% 
  mutate(mentor = as.factor(mentor))



mentor_log_reg <- glm(mentor ~ style + technique + agility, data = dataset, family = 'binomial')


dataset <- dataset %>% 
  bind_cols(mentor_pred = predict(mentor_log_reg, type = 'response')) 


dataset <- dataset %>% 
  mutate(mentor_class = ifelse(mentor_pred > .5, 'yes', 'no'))


dataset
