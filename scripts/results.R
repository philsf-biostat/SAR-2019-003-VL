source('scripts/input.R')
library(atable)

tabela.desc <- atable::atable(face, target_cols = c(
  "SEXO",
  "IDADE",
  "ALTURA",
  "PESO",
  "IMC"
), format_to = "Console")

t.test(dreno ~ group, face.long, paired = TRUE)
