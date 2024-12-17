data =data_subsample

data$Ja_Stimmenanteil <- as.numeric(as.character(data$Ja_Stimmenanteil))
data$Ja_Stimmenanteil <- round(data$Ja_Stimmenanteil, 2)

# are there NA s

data <- na.omit(data, cols = "Ja_Stimmenanteil")





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
