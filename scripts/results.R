source('scripts/input.R')
library(atable)

t.test(dreno ~ group, face.long, paired = TRUE)
