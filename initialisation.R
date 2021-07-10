install.packages("readr")
library(dslabs,curl)
library(tidyverse)
library(lubridate)
library(ggthemes)

operations <- read_csv("https://www.data.gouv.fr/fr/datasets/r/fae6bc13-fe4c-4838-b281-b16628b7babe")
ops_stats <- read_csv("https://www.data.gouv.fr/fr/datasets/r/5d3c65fb-c861-4b22-b8aa-1eab58e3d9db")

radio <- read_delim("https://data.anfr.fr/api/records/2.0/downloadfile/format=csv&resource_id=a4fa7f74-c454-46c3-81bb-fe161037e16e&use_labels_for_header=true", 
                    ";", escape_double = FALSE, col_types = cols(date_ouverture = col_date(format = "%Y-%m-%d"), 
                                                                 date_fermeture = col_date(format = "%Y-%m-%d")), 
                    trim_ws = TRUE)
                    