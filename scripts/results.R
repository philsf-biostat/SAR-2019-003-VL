source('scripts/input.R')
library(atable)

with(face, (t.test(txa, ctr, paired = TRUE)))
