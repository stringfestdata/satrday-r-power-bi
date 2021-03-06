# https://datasciencebeginners.com/2018/11/11/a-brief-introduction-to-mice-r-package/

library(mice)

install.packages('VIM')
library(VIM)


sleep <- VIM::sleep
md.pattern(sleep)

# Imputing the values using mice
imputed_sleep <- mice(sleep, m=5, method = 'pmm', seed = 101)

# checking the summary
summary(imputed_sleep)


# Get complete data ( 3rd out of 5)
wholeData <- complete(imputed_sleep,3)


# Building regression model
model_fit <- with(data = imputed_sleep, exp = lm(BodyWgt ~ BrainWgt + Sleep)) 

# combining results of all 5 models using pool() function
pooled_output <- pool(model_fit)
summary(pooled_output)



