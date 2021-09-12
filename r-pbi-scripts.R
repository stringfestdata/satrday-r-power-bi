library(tidyverse)
library(readxl)


# Read in data
dataset <- read_csv('data/contestants.csv')
dataset



# 'dataset' holds the input data for this script



is_email <- function(x) {
  grepl("\\<[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\>", as.character(x), ignore.case=TRUE)
}

# 1. Invalid emails

output <- dataset
output$is_valid_email <- is_email(output$email)


# 2. Missing values


library(mice)

imp <- mice(dataset, method = "mean", m = 1, maxit = 1)
complete_data <- complete(imp)


# 3. Pairplot 

library(GGally)
library(tidyverse)

dataset %>% 
  select(mentor, style, technique) %>% 
  ggpairs(mapping = aes(color = mentor))



# Bonus! Pick a winner

library(gridExtra)
library(tidyverse)

tibble('Winner!' = rdunif(1, 1, 10)) %>% 
  grid.table(rows = '') %>% 
  ttheme_default(base_size = 30)




