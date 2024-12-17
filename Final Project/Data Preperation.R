library(readr)
KANTON_ZUERICH_abstimmungsarchiv_kanton <- read_csv("https://www.web.statistik.zh.ch/ogd/data/KANTON_ZUERICH_abstimmungsarchiv_kanton.csv")
View(KANTON_ZUERICH_abstimmungsarchiv_kanton)
df <- KANTON_ZUERICH_abstimmungsarchiv_kanton

# Laden Sie das dplyr-Paket, falls es noch nicht geladen ist
library(tidyverse)

# Ihr DataFrame df sollte bereits geladen sein

# Erstellen Sie leere Vektoren für die Ergebnisse
gesamtanzahl_stimmen <- numeric()
ja_stimmenanteil <- numeric()

# Schleife über jede Zeile im DataFrame
# for (i in 1:nrow(df)) {
#   gesamtanzahl <- df[i, "AZ_JA_STIMMEN"] + df[i, "AZ_NEIN_STIMMEN"] + df[i, "AZ_LEERE_STIMMZETTEL"]
#   ja_anteil <- (df[i, "AZ_JA_STIMMEN"] / gesamtanzahl) * 100
#   
#   gesamtanzahl_stimmen <- c(gesamtanzahl_stimmen, gesamtanzahl)
#   ja_stimmenanteil <- c(ja_stimmenanteil, ja_anteil)
# }

# Fügen Sie die neuen Spalten zum DataFrame hinzu
# df$Gesamtanzahl_Stimmen <- gesamtanzahl_stimmen
# df$Ja_Stimmenanteil <- ja_stimmenanteil

# wenn ja_stimmenanteil über 50% dann 1 sonst 0 und als neue varoable angenommen speichern





# df enthält jetzt die neuen Spalten Gesamtanzahl_Stimmen und Ja_Stimmenanteil
# Die Ergebnisse werden im DataFrame gespeichert

# ein subset erstellen

df_subset_KT <- df %>% select(ABSTIMMUNGSTAG,VORLAGE_KURZBEZ,STAT_VORLAGE_ID,ABSTIMMUNGSART_BEZ,ANNEHMENDE_GEBIETE,ABLEHNENDE_GEBIETE,JA_ANTEIL_PROZENT)


save(df_subset_KT, file = "df_subset_KT.RData")







