## Read in personal_info 

library(tidyverse)
personal_info <- read_csv('https://raw.githubusercontent.com/stringfestdata/satrday-r-power-bi/main/data/personal_info.csv')
personal_info


# Invalid email addresses

is_email <- function(x) {
  grepl("\\<[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\>", as.character(x), ignore.case=TRUE)
}

output <- dataset
output$is_valid_email <- is_email(output$email)

# Paired t-test

library(tidymodels)
contestants_t <- tidy(t.test(dataset$pre, dataset$post, paired = TRUE, rm.na = TRUE))

# Slopeplot

library(tidyverse)
library(CGPfunctions)

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



