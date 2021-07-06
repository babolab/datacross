install.packages('curl')
library(readr,dslabs)
library(tidyverse)

operations <- read_csv("https://www.data.gouv.fr/fr/datasets/r/fae6bc13-fe4c-4838-b281-b16628b7babe")
ops_stats <- read_csv("https://www.data.gouv.fr/fr/datasets/r/5d3c65fb-c861-4b22-b8aa-1eab58e3d9db")
