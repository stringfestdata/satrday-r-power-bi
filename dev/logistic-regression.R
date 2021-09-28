# https://towardsdatascience.com/modelling-binary-logistic-regression-using-tidymodels-library-in-r-part-1-c1bdce0ac055


library(tidymodels)
library(tidyverse)


dataset <- read_csv('https://raw.githubusercontent.com/stringfestdata/stringfest-resource-library/main/datasets/contestants.csv') %>% 
  mutate_if(is.numeric, zoo::na.aggregate) %>% 
  mutate(mentor = as.factor(mentor))

psych::describe(dataset)


dataset %>% slice(n = 1)

mentor_log_reg <- glm(mentor ~ style + technique + agility, data = dataset, family = 'binomial')

tidy(mentor_log_reg)

dataset <- dataset %>% 
  bind_cols(mentor_pred = predict(mentor_log_reg, type = 'response')) 


dataset <- dataset %>% 
  mutate(mentor_class = ifelse(mentor_pred > .5, 'yes', 'no'))


mentor_t <- t.test(style ~ mentor, data = dataset) %>% tidy()
mentor_t


psych::describe(dataset)


dataset %>% 
  rowwise() %>% 
  mutate(avg_score = mean(style:agility)) %>% 
  ungroup() %>% 
  slice_max(order_by = avg_score, n = 5) 

       

mtcars %>% slice_max(mpg, n = 5)
