library(pwr)

# cálculo amostral --------------------------------------------------------

pwr.t.test(power = 0.8, type = "paired", d = 0.6)

# análise de poder --------------------------------------------------------

# sample size = 23
pwr.t.test(power = 0.8, type = "paired", n = 23)
