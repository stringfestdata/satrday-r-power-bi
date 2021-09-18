library(psych)
data(package = 'sat.act')

head(sat.act)

library(Ecdat)
data



contestants <- read.csv('C:/RFiles/contestants-3.csv')
contestants


tidy(t.test(contestants$post, contestants$pre, paired = TRUE, rm.na = TRUE))


contestants %>% 
  group_by(mentor) %>% 
  summarise(pre = round(mean(pre), 0), post = round(mean(post), 0)) %>% 
  pivot_longer(cols = c(pre, post), names_to = 'period', values_to = 'score') %>% 
  newggslopegraph(period, score, mentor,
                  Title = 'Pre vs post scores',
                  SubTitle = 'satRday Columbus :)',
                  Caption = '')

