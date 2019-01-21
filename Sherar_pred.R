###PREDICTION OF ADULT HEIGHT USING MATURITY-BASED CUMULATIVE HEIGHT VELOCITY CURVES (Sherar et al, 2005)
####How to use Sherar predicted adult stature reference tabe in R
##Create Table of reference values, note separate tables for male/female
###Note Sherar is based off PHV assessment performed using Mirwald
library(tidyverse)
library(data.table)

###Sample data
df <- structure(list(PlayerName = c("Example", "Example1"), 
                     DateOfBirth = structure(c(1069113600, 1095465600), 
                                             class = c("POSIXct", "POSIXt"), 
                                             tzone = "UTC"), 
                     DateOfTest = structure(c(1476316800, 1476403200), 
                                            class = c("POSIXct", "POSIXt"), 
                                            tzone = "UTC"), 
                     Stature = c(151.7, 149.2), SittingHeight = c(77, 75.9), 
                     BodyMass = c(74, 70), 
                     Age = c(12.9034907597536, 12.0711841204654), 
                     LegLength = c(74.7, 73.3), 
                     year_from_phv = c(-0.993206850280964, -1.513740085106), 
                     AgeAtPHV = c(13.8966976100346, 13.5849242055714), 
                     maturation_status = c("Average", "Average")), 
                class = c("data.table", "data.frame"), row.names = c(NA, -2L))

###Sherar reference for males
Sherar_ref_male <- structure(list(year_from_phv = c(-4, -3.8, -3.6, -3.4, -3.2, 
                                                    -3, -2.8, -2.6, -2.4, -2.2, -2, -1.8, -1.6, -1.4, -1.2, -1, -0.8, 
                                                    -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 
                                                    2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 3.4, 3.6, 3.8, 4, -4, -3.8, -3.6, 
                                                    -3.4, -3.2, -3, -2.8, -2.6, -2.4, -2.2, -2, -1.8, -1.6, -1.4, 
                                                    -1.2, -1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 
                                                    1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 3.4, 3.6, 3.8, 
                                                    4, -4, -3.8, -3.6, -3.4, -3.2, -3, -2.8, -2.6, -2.4, -2.2, -2, 
                                                    -1.8, -1.6, -1.4, -1.2, -1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 
                                                    0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 
                                                    3.4, 3.6, 3.8, 4), 
                                  maturation_status = c("Early", "Early", "Early", "Early", "Early", "Early", "Early", 
                                                        "Early", "Early", "Early", "Early", "Early", "Early", "Early", 
                                                        "Early", "Early", "Early", "Early", "Early", "Early", "Early", 
                                                        "Early", "Early", "Early", "Early", "Early", "Early", "Early", 
                                                        "Early", "Early", "Early", "Early", "Early", "Early", "Early", 
                                                        "Early", "Early", "Early", "Early", "Early", "Early", "Average", 
                                                        "Average", "Average", "Average", "Average", "Average", "Average", 
                                                        "Average", "Average", "Average", "Average", "Average", "Average", 
                                                        "Average", "Average", "Average", "Average", "Average", "Average", 
                                                        "Average", "Average", "Average", "Average", "Average", "Average", 
                                                        "Average", "Average", "Average", "Average", "Average", "Average", 
                                                        "Average", "Average", "Average", "Average", "Average", "Average", 
                                                        "Average", "Average", "Average", "Average", "Late", "Late", "Late",
                                                        "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", 
                                                        "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", 
                                                        "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late",
                                                        "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", 
                                                        "Late", "Late", "Late", "Late", "Late", "Late"), 
                                  cm = c("45.29", "44.21", "43.11", "41.99", "40.85", "39.69", "38.52", "37.33", "36.15", 
                                         "34.97", "33.80", "32.62", "31.44", "30.23", "28.98", "27.66", "26.24", "24.68", 
                                         "22.96", "21.07", "19.04", "16.96", "14.92", "13.01", "11.26", "9.6999999999999993", 
                                         "8.33", "7.11", "6.04", "5.0999999999999996", "4.26", "3.52", "2.86", "2.29", "1.78", 
                                         "1.34", "0.96", "0.64", "0.37", "0.16", "0", "40.09", "39.08", "38.07", "37.06", "36.05", 
                                         "35.04", "34.04", "33.05", "32.06", "31.07", "30.06", "29.03", "27.95", "26.83", "25.63", 
                                         "24.36", "22.99", "21.51", "19.88", "18.09", "16.16", "14.21", "12.35", "10.65", 
                                         "9.1199999999999992", "7.78", "6.59", "5.54", "4.62", "3.8", "3.09", "2.48", "1.96", 
                                         "1.52", "1.1599999999999999", "0.87", "0.63", "0.43", "0.27", "0.12", "0", "34.73", "33.83", 
                                         "32.94", "32.05", "31.16", "30.27", "29.38", "28.49", "27.60", "26.70", "25.77", "24.79", 
                                         "23.74", "22.63", "21.45", "20.22", "18.96", "17.68", "16.31", "14.76", "13.05", "11.32",
                                         "9.7100000000000009",  "8.27", "6.94", "5.7", "4.54", "3.51", "2.64", "1.92", "1.35", "0.91", 
                                         "0.57999999999999996", "0.32", "0.13", "0", "0", "0", "0", "0", "0")), 
                             row.names = c(NA, -123L), class = c("tbl_df", "tbl", "data.frame"))
###Sherar reference for females
Sherar_ref_female <- structure(list(year_from_phv = c(-4, -3.8, -3.6, -3.4, -3.2, -3, -2.8, -2.6, -2.4, -2.2, -2, -1.8, -1.6, 
                                                      -1.4, -1.2, -1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1, 1.2,
                                                      1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 3.4, 3.6, 3.8, 4, -4, -3.8,
                                                      -3.6, -3.4, -3.2, -3, -2.8, -2.6, -2.4, -2.2, -2, -1.8, -1.6, -1.4,-1.2, 
                                                      -1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8,
                                                      2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 3.4, 3.6, 3.8, 4, -4, -3.8, -3.6, -3.4, -3.2,
                                                      -3, -2.8, -2.6, -2.4, -2.2, -2, -1.8, -1.6, -1.4, -1.2, -1, -0.8, -0.6, -0.4,
                                                      -0.2, 0, 0.2, 0.4,0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8, 3, 3.2, 
                                                      3.4, 3.6, 3.8, 4), 
                                    maturation_status = c("Early", "Early", "Early", "Early", "Early", "Early", "Early", "Early", "Early",
                                                          "Early", "Early", "Early", "Early", "Early", "Early", "Early", "Early", "Early", 
                                                          "Early", "Early", "Early", "Early", "Early", "Early","Early", "Early", "Early", 
                                                          "Early", "Early", "Early", "Early", "Early", "Early", "Early", "Early", "Early",
                                                          "Early", "Early", "Early", "Early", "Early", "Average", "Average", "Average", 
                                                          "Average", "Average", "Average", "Average", "Average", "Average", "Average","Average",
                                                          "Average", "Average", "Average", "Average", "Average", "Average", "Average", "Average",
                                                          "Average", "Average", "Average", "Average", "Average", "Average", "Average", "Average",
                                                          "Average", "Average", "Average", "Average", "Average", "Average", "Average", "Average",
                                                          "Average", "Average", "Average", "Average", "Average", "Average", "Late", "Late", "Late", 
                                                          "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late",
                                                          "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late","Late", "Late",
                                                          "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late", "Late",
                                                          "Late", "Late", "Late",  "Late", "Late"), 
                                    cm = c("42.61", "41.49", "40.39", "39.30", "38.21", "37.13", "36.04", "34.94", "33.82", "32.68", "31.53", "30.44",
                                           "29.36", "28.24", "27.09", "25.87", "24.54", "23.09", "21.50", "19.77", "17.940000000000001", "16.09", "14.3",
                                           "12.64", "11.11", "9.69", "8.39", "7.2", "6.14", "5.19", "4.3600000000000003", "3.63", "2.99", "2.42", "1.92",
                                           "1.47", "1.07", "0.72", "0.43", "0.19", "0", "38.81", "37.67", "36.55", "35.44", "34.34", "33.25", "32.16", "31.04",
                                           "29.91", "28.76", "27.58", "26.39", "25.21", "24.03", "22.85", "21.66", "20.44", "19.16", "17.80", "16.33", "14.75",
                                           "13.13", "11.56", "10.11", "8.77", "7.52", "6.37", "5.33",  "4.42", "3.64", "2.99", "2.4500000000000002", "1.99", 
                                           "1.6",  "1.26", "0.96", "0.69", "0.46", "0.26", "0.11", "0", "34.35", "33.27", "32.20", "31.14", "30.09", "29.04",
                                           "27.99", "26.93", "25.87", "24.79", "23.71", "22.63", "21.55", "20.47", "19.37",  "18.25", "17.07", "15.81", "14.44",
                                           "12.94", "11.36", "9.81", "8.42", "7.2", "6.12", "5.13", "4.24", "3.46", "2.8", "2.25", "1.82", "1.46", "1.18", "0.94", 
                                           "0.74", "0.56999999999999995", "0.41", "0.28000000000000003", "0.17", "0.08", "0")),
                               row.names = c(NA, -123L), class = c("tbl_df", "tbl", "data.frame"))

####Set both reference df and original data as DT 
setDT(df)
setDT(Sherar_ref_male)
  
# look up rows in reference matching rows in df
# join on the Maturation_stat and year_from_phv columns --- !!!must have same name in both!!! 
# roll='nearest' means find the nearest year_from_phv if we can't match it
df2 <- Sherar_ref_male[df, on=.(maturation_status, year_from_phv), roll='nearest'] %>%
  select(c(4:12, 1:3)) %>%
  mutate_at(
    vars("cm"), as.numeric
  ) %>%
  mutate(
    Pred_Adult = Stature + cm,
    PerCent_Adult = Stature / Pred_Adult
  )




