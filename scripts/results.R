source('scripts/input.R')
library(atable)
library(tableone)

tabela.desc <- atable::atable(face, target_cols = c(
  "SEXO",
  "IDADE",
  "ALTURA",
  "PESO",
  "IMC"
), format_to = "Console")

# t.test(dreno ~ group, face.long, paired = TRUE)
tabela.comp <- print(
  CreateTableOne(vars = "dreno", strata = "group", data = face.long, argsExact = list(paired = TRUE)),
  printToggle = FALSE, smd = TRUE, exact = TRUE)
