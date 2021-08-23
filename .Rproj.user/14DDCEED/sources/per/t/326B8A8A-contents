library(tidyverse)


# Read in data
contestants <- read_csv('data/contestants.csv')
contestants

# Invalid emails

contestants <- contestants %>% 
  mutate(is_email = str_detect(email, "\\<[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\>"))


# Missing values

# dataset <- read.csv(file="<Your File Path>/EuStockMarkets_NA.csv", header=TRUE, sep=",")
# library(mice)
# tempData <- mice(dataset,m=1,maxit=50,meth='pmm',seed=100)
# completedData <- complete(tempData,1)
# output <- dataset
# output$completedValues <- completedData$"SMI missing values"


# Plot 


