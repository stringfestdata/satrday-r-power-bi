
library(Ecdat)
data



dataset <- read.csv('C:/RFiles/contestants.csv')
contestants

library(tidymodels)
tidy(t.test(contestants$post, contestants$pre, paired = TRUE, rm.na = TRUE))


library(tidyverse)

library(CGPfunctions)


?newggslopegraph

dataset %>% 
  na.omit() %>% 
  group_by(cohort) %>% 
  summarise(pre = round(mean(pre), 0), post = round(mean(post), 0)) %>% 
  pivot_longer(cols = c(pre, post), names_to = 'period', values_to = 'score') %>% 
  newggslopegraph(period, score, cohort,
                  Title = 'Pre vs post scores by cohort',
                  SubTitle = 'for satRday Columbus :)',
                  DataTextSize = 4,
                  Caption = '',
                  WiderLabels = TRUE, 
                  DataLabelPadding = .01)

