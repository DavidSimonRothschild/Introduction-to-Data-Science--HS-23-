# Load the necessary library
library(tidyverse)
load("~/Documents/Introduction to Data Science/Final Project/df_subset_KT.RData")

df_subset <- df_subset_KT

# Assuming your data frame is named 'your_data_frame'

# Convert the 'ABSTIMMUNGSTAG' column to Date type
df_subset$ABSTIMMUNGSTAG <- as.Date(df_subset$ABSTIMMUNGSTAG, format = "%d.%m.%Y")

# Filter the data for dates after January 1, 1970
filtered_data <- df_subset %>% 
  filter(ABSTIMMUNGSTAG > as.Date("2000-01-01"))


# print unique values in the VORLAGE_KURZBEZ column
unique(filtered_data$VORLAGE_KURZBEZ)
# how many unique values are there?
length(unique(filtered_data$VORLAGE_KURZBEZ))

# add a coloum to the dataset with the name Vorlagetyp
filtered_data$Policy_Feld <- NA
filtered_data$Policy_Feld_Code <- NA

# Umwelt und Verkehr
filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(173,276,377,2477,2463,1991,347,274,248,2461,2482,2481,2466,260,299,2403,2438,172,308,275,2511,272,2454,2559,173,171,307,319,350,2483,2479,2453,2478,2512,2555,170,2424,5,2506,168,183,2001,7,199,203,243,273,304,325,352,369,372,386,2404,2407,2434,2455,2457,2476,2486,2495,2496,2497,2522,2522,2523,2525,2565,202,2445)] <- "Umwelt+Verkehr"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Umwelt+Verkehr"] <- 1

# Gesundheit

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(375,292,2938,291,2415,286,2460,210,298,253,287,252,2532,179,285,259,2520,258,2534,182,195,200,264,266,267,268,281,302,336,340,362,364,365,366,367,368,2398,2408,2524,2528,2566)] <- "Gesundheit"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Gesundheit"] <- 2


# Soziales

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(274,2561,245,1992,2556,2556,2465,2107,180,262,289,2468,2104,2115,254,237,2442,235,317,323,2416,2401,351,382,383,2402,2450,2452,2530,177,176,2103,305,2485,2557,188,2102,198,201,215,225,226,227,265,269,313,314,315,316,341,342,343,354,374,384,392,2448,2444,2489,2492,2508,2529,2554,193,2428,355)] <- "Soziales"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Soziales"] <- 3

# Wirtschaft

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(213,2399,2562,169,2105,2459,2535,2437,2560,249,2449,1990,1993,191,346,370,385,2410,2458,2474,2516,2564)] <- "Wirtschaft"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Wirtschaft"] <- 4


# Demokratie

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(376,290,205,238,306,2484,2533,2400,175,165,166,194,280,361,393,2551,2552)] <- "Demokratie"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Demokratie"] <- 5

# Kirche und Staat

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(208,2435,310,2110,2455,206,207,230,2531,186,241,311,338,339,2405,2412,2447,2446,2493,2514,2541,2542,2548,2553,2567,167,2101,2427)] <- "Kirche+Staat"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Kirche+Staat"] <- 6
# Migration

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(256,255,320,2436,232,233,321,244,2469,250,2505,174,2106,2418,4,240,279,300,357,358,359,394,2406,2433,2447,2456)] <- "Migrarion"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Migrarion"] <- 7

# Andere

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(246,2563,247,348,380,239,2439,234,236,349,381,322,378,2440,261,379,181,6,214,312,326,353,360,2413,2430,2443,2448,2471,2473,2487,2488,2494,2510,2517,2527,2544,2547,2550,192)] <- "Andere"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Andere"] <- 8

# Bildung

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(2441,282,283,2422,296,373,2462,251,263,284,2432,2431,3,1,2,1989,204,242,337,344,371,387,388,389,391,2421,2423,2472)] <- "Bildung"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Bildung"] <- 9

# Sicherheit und Armee

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(2509,2451,209,278,211,178,184,185,189,190,196,197,2411)] <- "Sicherheit+Armee"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Sicherheit+Armee"] <- 10

# Finanzen

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(222,223,2480,212,2414,297,2420,2454,246,2467,277,2111,2417,2419,2464,271,2558,2507,1987,1988,187,2000,8,228,301,327,328,329,330,331,332,333,334,335,356,363,390,396,2425,2426,2449,2470,2475,2491,2498,2499,2543,2429)] <- "Finanzen"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Finanzen"] <- 11

# Law and Order

filtered_data$Policy_Feld[filtered_data$STAT_VORLAGE_ID %in% c(288,293,294,295,309,318,2397,2513,164,257,216,303,324,345,395,2409,2490,2515,2518,2519,2521,2526)] <- "Law+Order"
filtered_data$Policy_Feld_Code[filtered_data$Policy_Feld == "Law+Order"] <- 12

# subset the data where in Policy_Feld is NA
fd<- filtered_data[is.na(filtered_data$Policy_Feld),]
unique(fd$STAT_VORLAGE_ID)

View(filtered_data)

# save the data as csv

write.csv(filtered_data, file = "DATA_2.csv", row.names = FALSE)



###
# DATA <- DATA %>%
#   mutate(Category = factor(case_when(
#     Policy_Feld_Code <= 1 ~ "Umwelt+Verkehr",
#     Policy_Feld_Code <= 2 ~ "Gesundheit",
#     Policy_Feld_Code <= 3 ~ "Soziales",
#     Policy_Feld_Code <= 4 ~ "Wirtschaft",
#     Policy_Feld_Code <= 5 ~ "Demokratie",
#     Policy_Feld_Code <= 6 ~ "Kirche+Staat",
#     Policy_Feld_Code <= 7 ~ "Migration",
#     Policy_Feld_Code <= 8 ~ "Andere",
#     Policy_Feld_Code <= 9 ~ "Bildung",
#     Policy_Feld_Code <= 10 ~ "Armee",
#     Policy_Feld_Code <= 11 ~ "Finanzen",
#     Policy_Feld_Code <= 12 ~ "Law+Order"))) %>%
#   select(Policy_Feld_Code, JA_ANTEIL_PROZENT)






