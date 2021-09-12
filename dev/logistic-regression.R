# https://towardsdatascience.com/modelling-binary-logistic-regression-using-tidymodels-library-in-r-part-1-c1bdce0ac055


library(tidymodels)
library(tidyverse)


# dataset <- read_csv('../data/contestants.csv')
dataset$mentor <- as_factor(dataset$mentor)


set.seed(1234)


fitted_logistic_model <- logistic_reg() %>%
  set_engine('glm') %>%
  set_mode('classification') %>%
  fit(mentor ~ style + technique + agility, data = dataset)


contestants_predict <- predict(fitted_logistic_model,
        new_data = dataset,
        type = 'class') %>% bind_cols(dataset)



View(contestants_predict)




grid.table(with(contestants_predict, table(mentor, .pred_class))  )



    
