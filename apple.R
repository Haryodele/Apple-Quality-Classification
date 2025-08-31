##Loading the necessary package
library(tidyverse) # Data import & wrangling
library(caret) # Model performance evaluation
### STEP 1: DATA PRE-PROCESSING

### Importing the dataset
data <- read_csv("Apple.csv", show_col_types = FALSE)
data

### Data Preparation & Exploration
str(data)
summary(data)
skimr::skim(data)
unique(data$Quality)
table(data$Quality)
view(data)
data <- data %>% 
  select(-A_id) %>% 
  mutate(
    Quality = factor(Quality)
  )
data
levels(data$Quality)

data <- data %>% 
  mutate(
    Quality = factor(Quality, levels=rev(levels(Quality)))
  )
levels(data$Quality)
table(data$Quality)

## Visualize the relationship among the attributes
psych::pairs.panels(data, gap = 0, pch=21)

##Setting seed for reproducibility
set.seed(123)
index <- createDataPartition(data$Quality, p = .80, list = FALSE)
training <- data[index, ]
testing <- data[-index, ]

# Cross check the dimension of the two datasets
dim(training)
dim(testing)
dim(data)
data

### STEP 2: TRAIN THE MODEL
## Cross-validation

# Fit lm model using 10-fold CV
set.seed(123)
modelCV <- train(
  Quality ~., 
  training,
  method = "glm",
  family = "binomial",
  trControl = trainControl(
    method = "repeatedcv", 
    number = 10,
    repeats = 10, 
    summaryFunction = twoClassSummary,
    classProbs = TRUE,
    verboseIter = TRUE
  ),
  metric = "ROC"
)
### STEP 3: EVALUATE THE MODEL
#### Print model to console
modelCV

### Final model
set.seed(123)
modelFinal <- train(
  Quality ~., 
  training,
  method = "glm",
  family = "binomial",
  trControl = trainControl(
    method = "none", 
    summaryFunction = twoClassSummary,
    classProbs = TRUE, 
    verboseIter = TRUE),
  metric = "ROC"
)

summary(modelFinal)

## STEP 4: TEST THE MODEL

## Model's performance metrics
predictions <- predict(modelFinal, testing)

library(pROC)
predictions_prob <- predict(modelFinal, testing, type = "prob")
# AdjustING column indexing based on factor levels
roc_result <- roc(testing$Quality, predictions_prob[, "good"]) 

confusionMatrix(predictions, as.factor(testing$Quality))
auc(roc_result)
