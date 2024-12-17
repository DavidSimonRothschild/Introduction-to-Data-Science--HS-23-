# KNN

# remove na from filtered_data



# Spliting

library(tidymodels)

tidymodels_prefer()
set.seed(10)
rsplit <- initial_split(data,
                        prop = 0.75,
                        strata = Policy_Feld)
train <- training(rsplit)
test <- testing(rsplit)





# round Ja_Stimmenanteil

data$Ja_Stimmenanteil <- as.numeric(as.character(data$Ja_Stimmenanteil))
data$Ja_Stimmenanteil <- round(data$Ja_Stimmenanteil, 2)

# are there NA s

data <- na.omit(data, cols = "Ja_Stimmenanteil")



# Sample the rows
small_df <- data[sample(nrow(data), sample_size), ]

# apply knn to data

# Check the structure of 'Ja_Stimmenanteil'
str(train$Ja_Stimmenanteil)

# If it is a list and can be simplified to a vector, use unlist
# Make sure this is appropriate for your data!
train$Ja_Stimmenanteil <- unlist(train$Ja_Stimmenanteil)

# Rerun the recipe
knn_rec <- recipe(Ja_Stimmenanteil ~ ., data = train) %>%
  update_role(BEZIRK, new_role = "Policy_Feld") %>%
  step_BoxCox() %>%
  step_normalize(all_numeric_predictors())

knn_rec


knn_spec <- nearest_neighbor(neighbors = tune(),
                             weight_func = tune(),
                             dist_power = tune()) %>%
  set_mode("regression") %>%
  set_engine("kknn")
knn_spec

knn_flow <- workflow() %>%
  add_model(knn_spec) %>%
  add_recipe(knn_rec)



set.seed(20)
folds <- vfold_cv(train, v = 5, repeats = 2)
folds

knn_metric <- metric_set(rsq)
knn_metric

knn_grid <- crossing(
  neighbors = 1:15,
  weight_func = c("biweight", "cos", "epanechnikov", "gaussian",
                  "inv", "optimal", "rectangula", "triweight"),
  dist_power = 1:2
)
tibble(knn_grid)

knn_tune <- tune_grid(
  knn_flow,
  resamples = folds,
  grid = knn_grid,
  metrics = knn_metric
)


### Naive Bayes

library(tidymodels)
library(discrim)
tidymodels_prefer()
set.seed(10)

library(tidymodels)
tidymodels_prefer()
set.seed(10)

# Convert 'Ja_Stimmenanteil' to a categorical variable (factor)
# Here's an example using base R. Adjust the breaks as needed.
data$Ja_Stimmenanteil <- cut(data$Ja_Stimmenanteil, breaks = 3, labels = c("Low", "Medium", "High"))

# Splitting the dataset
demo_split <- initial_split(data, prop = 0.75, strata = Policy_Feld)
demo_train <- training(demo_split)
demo_test <- testing(demo_split)

# Preprocessing recipe
demo_recipe <- recipe(Ja_Stimmenanteil ~ Policy_Feld, data = demo_train) %>%
  step_normalize(all_numeric_predictors()) %>%
  step_impute_knn(neighbors = 3)

# Naive Bayes model specification
demo_spec <-
  naive_Bayes() %>%
  set_mode("classification") %>%
  set_engine("naivebayes")

# Creating the workflow
demo_flow <- 
  workflow() %>%
  add_model(demo_spec) %>%
  add_recipe(demo_recipe)

# Fitting the model
demo_fit <- fit(demo_flow, demo_train)
