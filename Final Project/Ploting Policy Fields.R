Policy_Felder
library(ggplot2)

library(readxl)
Policy_Felder <- read_excel("Policy Felder.xlsx")

# make a barchart of the Policy_Felder
ggplot(Policy_Felder, aes(x = Policy_Feld, y= Anzahl)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Number of policy proposals per policy field", x = "Policy-Feld", y = "Number of proposals") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label=Anzahl), vjust=1.6, color="white", size=3.5)


##################

df <- KANTON_ZUERICH_abstimmungsarchiv_kanton

# from ABBSTIMMUNGSTAG extract the year
df$ABSTIMMUNGSTAG <- as.Date(df$ABSTIMMUNGSTAG, format = "%d.%m.%Y")
df$Jahr<- format(df$ABSTIMMUNGSTAG, "%Y")

# plot ABBSTIMMUNGSTAG and ID

library(ggplot2)
library(dplyr)

# Assuming 'df' is your original dataframe and 'Jahr' is the year column, 'ID' is the identifier

# Convert 'Jahr' to numeric if it's not already
df$Jahr <- as.numeric(as.character(df$Jahr))

# Summarise data to get count of IDs per year
df_summary <- df %>%
  group_by(Jahr) %>%
  summarise(count = n())

# Find the range for x-axis to cover all years
xrange <- range(df_summary$Jahr)

# Plot
library(ggplot2)
library(dplyr)

# Assuming 'df' is your original dataframe and 'Jahr' is the year column, 'ID' is the identifier

# Convert 'Jahr' to numeric if it's not already
df$Jahr <- as.numeric(as.character(df$Jahr))

# Summarise data to get count of IDs per year
df_summary <- df %>%
  group_by(Jahr) %>%
  summarise(count = n())

# Find the range for x-axis to cover all years
xrange <- range(df_summary$Jahr)

# Plot
ggplot(data = df_summary, aes(x = Jahr, y = count)) +
  geom_rect(aes(xmin=1830, xmax=1848, ymin=-Inf, ymax=+Inf), fill="lightblue", alpha=0.02) + # Blue background for 1831-1848
  geom_rect(aes(xmin=2001, xmax=max(xrange), ymin=-Inf, ymax=+Inf), fill="green", alpha=0.02) + # Green background for after 2000
  geom_col() +  # Use geom_col for bar plot
  labs(title = "Number of proposals per year", x = "Year", y = "Number of proposals") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label=count), vjust=-0.3, color="black", size=3.5)+
  theme_minimal()


# Plot 2000 - 2023

library(ggplot2)
library(dplyr)

# Assuming 'df' is your original dataframe and 'Jahr' is the year column, 'ID' is the identifier

# Convert 'Jahr' to numeric if it's not already
df$Jahr <- as.numeric(as.character(df$Jahr))

# Filter data to keep only entries from the year 2000 onwards
df_filtered <- df %>% 
  filter(Jahr > 1999)

# Summarise data to get count of IDs per year
df_summary <- df_filtered %>%
  group_by(Jahr) %>%
  summarise(count = n())

# Plot
library(ggplot2)
library(dplyr)

# Assuming 'df' is your original dataframe and 'Jahr' is the year column, 'ID' is the identifier

# Convert 'Jahr' to numeric if it's not already
df$Jahr <- as.numeric(as.character(df$Jahr))

# Filter data to keep only entries from the year 2000 onwards
df_filtered <- df %>% 
  filter(Jahr > 1999)

# Summarise data to get count of IDs per year
df_summary <- df_filtered %>%
  group_by(Jahr) %>%
  summarise(count = n())

# Plot
ggplot(data = df_summary, aes(x = Jahr, y = count)) +
  geom_col() +  # Use geom_col for bar plot
  labs(title = "Number of proposals per year (between 2000 and 2023)", x = "Year", y = "Number of proposals") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label=count), vjust=-0.3, color="black", size=3.5)# Adjust geom_text for count
  + theme_minimal()
