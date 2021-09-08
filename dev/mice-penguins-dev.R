# https://datasciencebeginners.com/2018/11/11/a-brief-introduction-to-mice-r-package/

library(palmerpenguins)
library(mice)

penguins

# Imputing the values using mice
imputed_penguins <- mice(penguins, m=5, method = 'pmm', seed = 101)

# checking the summary
summary(imputed_penguins)


# Get complete data ( 3rd out of 5)
wholeData <- complete(imputed_penguins, 3)
view(wholeData)

View(complete(imputed_penguins))

# Building regression model
model_fit <- with(data = imputed_sleep, exp = lm(BodyWgt ~ BrainWgt + Sleep)) 

# combining results of all 5 models using pool() function
pooled_output <- pool(model_fit)
summary(pooled_output)



