library(tidyverse)

#as.factor(crime$violentcrime)


# Categorize the violent crime rate
library(dplyr)

library(dplyr)

# Assuming DATA is your dataframe
DATA <- DATA %>%
  mutate(Category = factor(case_when(
    Policy_Feld_Code <= 1 ~ "Umwelt+Verkehr",
    Policy_Feld_Code <= 2 ~ "Gesundheit",
    Policy_Feld_Code <= 3 ~ "Soziales",
    Policy_Feld_Code <= 4 ~ "Wirtschaft",
    Policy_Feld_Code <= 5 ~ "Demokratie",
    Policy_Feld_Code <= 6 ~ "Kirche+Staat",
    Policy_Feld_Code <= 7 ~ "Migration",
    Policy_Feld_Code <= 8 ~ "Andere",
    Policy_Feld_Code <= 9 ~ "Bildung",
    Policy_Feld_Code <= 10 ~ "Armee",
    Policy_Feld_Code <= 11 ~ "Finanzen",
    Policy_Feld_Code <= 12 ~ "Law+Order"))) %>%
  select(Policy_Feld_Code, JA_ANTEIL_PROZENT)




library(tidymodels)
tidymodels_prefer()
set.seed(10)


# Convert JA_ANTEIL_PROZENT to a factor
as.factor(DATA$JA_ANTEIL_PROZENT)

# Check the structure of the data
str(train)




rsplit <- initial_split(policy_field, prop = 0.75, strata = Category)
train <- rsample::training(rsplit)
test <- rsample::testing(rsplit)


knn_rec <- recipe(JA_ANTEIL_PROZENT ~ ., data = train) %>%
  update_role("Policy_Feld_Code", new_role = "id") %>%
  step_dummy(all_nominal_predictors()) %>%
  step_normalize(all_numeric_predictors())



knn_spec <- nearest_neighbor(
  neighbors = tune(),
  weight_func = "optimal",
  dist_power = 2) %>%
  set_mode("classification") %>%
  set_engine("kknn")

init_flow <- workflow() %>%
  add_recipe(knn_rec) %>%
  add_model(knn_spec)


# TUNING

set.seed(20)
cv_folds <- vfold_cv(train,
                     v = 10,
                     repeats = 5)

# We set an odd number of neighbors to avoid ties in voting.
knn_grid <- tibble(neighbors = seq(1, 51, 2)) 

knn_perf <- metric_set(mn_log_loss)
knn_perf


set.seed(30)
knn_tune <- init_flow %>%
  tune_grid(cv_folds, grid = knn_grid, metrics = knn_perf)




autoplot(knn_tune) +
  theme_light() +
  labs(title='Hyperparameter Tuning for kNN')
