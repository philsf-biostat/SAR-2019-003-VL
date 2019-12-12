library(readxl)
library(data.table)
library(stringr)

# colunas extras (vazias) não importadas do dataset
face <- read_excel("dataset/Resultados TXA Felipe.xlsx", 
                   sheet = "face", skip = 1)
face <- data.table(face)

# data management ---------------------------------------------------------
face[str_to_lower(`LADO TXA`) == "esq"]$`LADO TXA` <- "Esq"
face[str_to_lower(`LADO TXA`) == "dir"]$`LADO TXA` <- "Dir"
face$`LADO TXA` <- factor(face$`LADO TXA`)
face$SEXO <- factor(face$SEXO, levels = c("F", "M"))
face$IMC <- face$PESO/(face$ALTURA^2)

face$txa <- rep(as.numeric(NA), nrow(face))
face$ctr <- rep(as.numeric(NA), nrow(face))

face[`LADO TXA` == "Dir"]$txa <- face[`LADO TXA` == "Dir"]$DIR
face[`LADO TXA` == "Esq"]$txa <- face[`LADO TXA` == "Esq"]$ESQ
face[`LADO TXA` == "Dir"]$ctr <- face[`LADO TXA` == "Dir"]$ESQ
face[`LADO TXA` == "Esq"]$ctr <- face[`LADO TXA` == "Esq"]$DIR

# trim cols ---------------------------------------------------------------

face <- face[, .(
  SEQ,
  SEXO,
  IDADE,
  ALTURA,
  PESO,
  IMC,
  DATA,
  DIR,
  ESQ,
  LADO=`LADO TXA`,
  COR=COLORAÇÃO,
  txa,
  ctr
  )]

# long format -------------------------------------------------------------
face.long <- tidyr::gather(data = face[, -"COR" ], key = "group", value = "dreno", ctr, txa)
