
CÓDIGOS DO R

# Criar Função de Tabelas

criar_tabela_frequencia <- function(dados, variavel) {

  freq_simples <- table(dados[[variavel]], useNA = "ifany")
  
  freq_relativa <- prop.table(freq_simples) * 100
  
  tabela <- as.data.frame(cbind(Frequência = freq_simples, 
                                "Frequência Relativa (%)" = round(freq_relativa, 2)))

  rownames(tabela) <- NULL
  tabela <- cbind(Categoria = names(freq_simples), tabela)
  colnames(tabela)[1] <- variavel
  
  return(tabela)
}


# Iniciar Tabelas
tabela_natureza <- criar_tabela_frequencia(Base, "Natureza")
tabela_meio <- criar_tabela_frequencia(Base, "Meio Empregado")
tabela_genero <- criar_tabela_frequencia(Base, "Gênero")
tabela_escolaridade <- criar_tabela_frequencia(Base, "Escolaridade da Vítima")
tabela_raca <- criar_tabela_frequencia(Base, "Raça da Vítima")
tabela_dia_semana <- criar_tabela_frequencia(Base, "Dia da Semana")
tabela_data <- criar_tabela_frequencia(Base, "Data")
tabela_hora <- criar_tabela_frequencia(Base, "Hora")



# Tabela cruzada para "Meio Empregado" vs "Gênero"
cat("Tabela Cruzada: Meio Empregado vs Gênero\n")
# Frequência simples
tabela_meio_genero <- table(Base$"Meio Empregado", Base$"Gênero", useNA = "ifany")
cat("\nFrequência Simples:\n")
print(tabela_meio_genero)

# Frequência relativa (em %)
tabela_meio_genero_rel <- round(prop.table(tabela_meio_genero) * 100, 2)
cat("\nFrequência Relativa (%):\n")
print(tabela_meio_genero_rel)

# Tabela cruzada para "Escolaridade da Vítima" vs "Raça da Vítima"
cat("\n\nTabela Cruzada: Escolaridade da Vítima vs Raça da Vítima\n")
# Frequência simples
tabela_escol_raca <- table(Base$"Escolaridade da Vítima", Base$"Raça da Vítima", useNA = "ifany")
cat("\nFrequência Simples:\n")
print(tabela_escol_raca)

# Frequência relativa (em %)
tabela_escol_raca_rel <- round(prop.table(tabela_escol_raca) * 100, 2)
cat("\nFrequência Relativa (%):\n")
print(tabela_escol_raca_rel)


# Printar Tabelas e Mostrar Título
cat("\nTabela de Frequências - Natureza\n")
print(tabela_natureza)
cat("\nTabela de Frequências - Meio Empregado\n")
print(tabela_meio)
cat("\nTabela de Frequências - Gênero\n")
print(tabela_genero)
cat("\nTabela de Frequências - Escolaridade da Vítima\n")
print(tabela_escolaridade)
cat("\nTabela de Frequências - Raça da Vítima\n")
print(tabela_raca)
cat("\nTabela de Frequências - Dia da Semana\n")
print(tabela_dia_semana)
cat("\nTabela de Frequências - Data")
print(tabela_data)
cat("\nTabela de Frequências - Hora")
print(tabela_hora)


install.packages('xtable')

print(xtable(tabela_hora, type='latex'))
print(xtable(tabela_data, type='latex'))
print(xtable(tabela_escol_raca, type='latex'))
print(xtable(tabela_meio_genero, type='latex'))


R.version.string



# Gráfico de Gênero
pie(table(Base$`Gênero`), col=c("green", "yellow", "blue"), main = "Gráfico de setor de Gênero")


# Gráfico de Meio Empregado
pie(table(Base$`Meio Empregado`), col=c("green", "yellow", "blue"), main = "Gráfico de setor de Meio Empregado")




# barplot(table(Base$`Escolaridade da Vítima`), xlab="Escolaridade", ylab="Vítimas", ylim=c(0,6000), col=c("green", "yellow","red"), main="Escolaridade da Vítima")

#Gráfico de Escolaridade
escolaridade <- c("Alfabetizado", "EF Completo", "EF Incompleto", 
                  "EM Completo", "EM Incompleto", "Não Alfabetizado", 
                  "Não Informada", "S Completo", "S Incompleto")
frequencia <- c(5451, 2046, 3330, 1710, 1154, 673, 1968, 123, 95)


par(mar = c(5, 4, 4, 2) + 0.1)


bp <- barplot(frequencia, 
              xlab = "Escolaridade",     
              ylab = "Vítimas",         
              ylim = c(0, 6500),        
              col = c("green", "yellow", "red", "blue", "purple", "orange", "gray", "pink", "brown"),
              main = "Escolaridade da Vítima",  
              names.arg = NULL)       


text(bp, frequencia + 150, labels = escolaridade, pos = 3, cex = 0.7, adj = 0)


par(mar = c(5, 4, 4, 2) + 0.1)



# Gráfico de Dia da Semana

dia_semana <- c("Domingo", "Quarta", "Quinta", "Sábado", "Segunda", "Sexta", "Terça")
frequencia <- c(2898, 2170, 2132, 2835, 2168, 2297, 2050)


par(mar = c(5, 4, 4, 2) + 0.1)


bp <- barplot(frequencia, 
              xlab = "Dia da Semana",    
              ylab = "Vítimas",         
              ylim = c(0, 4000),        
              col = c("green", "yellow", "red", "blue", "purple", "orange", "gray"), 
              main = "Vítimas por Dia da Semana", 
              names.arg = NULL)         


text(bp, frequencia + 100, labels = dia_semana, pos = 3, cex = 0.7, adj = 0)


par(mar = c(5, 4, 4, 2) + 0.1)






install.packages("ggplot2")
library(ggplot2)




# Criar data frame para Gênero
dados_genero <- data.frame(
  Categoria = c("Feminino", "Masculino"),
  Frequencia = c(1528, 15022)
)

# Calcular percentuais
dados_genero$Percentual <- dados_genero$Frequencia / sum(dados_genero$Frequencia) * 100

# Criar gráfico de setor
ggplot(dados_genero, aes(x = "", y = Frequencia, fill = Categoria)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(title = "           Distribuição por Gênero - CVLI (2020-2024)") +
  geom_text(aes(label = paste0(round(Percentual, 1), "%")), 
            position = position_stack(vjust = 0.5)) +
  scale_fill_manual(values = c("#FF9999", "#66B2FF")) +
  theme_void() +
  theme(legend.position = "bottom")


 # Criar data frame para Meio Empregado
dados_meio <- data.frame(
  Categoria = c("Arma Branca", "Arma de Fogo", "Outros Meios"),
  Frequencia = c(1385, 14223, 942)
)

# Calcular percentuais
dados_meio$Percentual <- dados_meio$Frequencia / sum(dados_meio$Frequencia) * 100

# Criar gráfico de setor
ggplot(dados_meio, aes(x = "", y = Frequencia, fill = Categoria)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(title = "Distribuição por Meio Empregado - CVLI (2020-2024)") +
  geom_text(aes(label = paste0(round(Percentual, 1), "%")), 
            position = position_stack(vjust = 0.5)) +
  scale_fill_manual(values = c("#FFCC99", "#FF6666", "#99CC99")) +
  theme_void() +
  theme(legend.position = "bottom")



# Criar data frame para Dia da Semana
dados_dia <- data.frame(
  Dia = c("Domingo", "Quarta", "Quinta", "Sábado", "Segunda", "Sexta", "Terça"),
  Frequencia = c(2898, 2170, 2132, 2835, 2168, 2297, 2050)
)

# Garantir a ordem dos dias
dados_dia$Dia <- factor(dados_dia$Dia, levels = dados_dia$Dia)

# Criar gráfico de barras
ggplot(dados_dia, aes(x = Dia, y = Frequencia)) +
  geom_bar(stat = "identity", fill = "#66B2FF") +
  labs(title = "Frequência por Dia da Semana - CVLI (2020-2024)", 
       x = "Dia da Semana", 
       y = "Frequência") +
  geom_text(aes(label = Frequencia), vjust = -0.5) + # Valores acima das barras
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rótulos inclinados



# Criar data frame para Escolaridade da Vítima
dados_escolaridade <- data.frame(
  Escolaridade = c("Alfabetizado", "Ens. Fund. Completo", "Ens. Fund. Incompleto", 
                   "Ens. Médio Completo", "Ens. Médio Incompleto", "Não Alfabetizado", 
                   "Não Informada", "Superior Completo", "Superior Incompleto"),
  Frequencia = c(5451, 2046, 3330, 1710, 1154, 673, 1968, 123, 95)
)

# Garantir a ordem das categorias
dados_escolaridade$Escolaridade <- factor(dados_escolaridade$Escolaridade, 
                                          levels = dados_escolaridade$Escolaridade)

# Criar gráfico de barras
ggplot(dados_escolaridade, aes(x = Escolaridade, y = Frequencia)) +
  geom_bar(stat = "identity", fill = "#FF9999") +
  labs(title = "Frequência por Escolaridade da Vítima - CVLI (2020-2024)", 
       x = "Escolaridade", 
       y = "Frequência") +
  geom_text(aes(label = Frequencia), vjust = -0.5) + # Valores acima das barras
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rótulos inclinados









# Extrair a coluna "Idade da Vítima" da base
idades <- Base$"Idade da Vítima"



# Remover "anos" ou outros textos
idades <- gsub(" anos", "Não informada", Base$"Idade da Vítima") # Remove " anos"
idades <- as.numeric(idades) # Converte para numérico
idades <- na.omit(idades) # Remove NAs





# Verificar os primeiros valores para diagnosticar o problema
cat("Primeiros 5 valores de 'Idade da Vítima':\n")
print(head(idades, 5))

# Converter para numérico, removendo possíveis caracteres indesejados
idades <- as.numeric(as.character(idades)) # Converte para character primeiro, depois numeric

# Verificar se há valores ausentes (NA) após conversão e removê-los
idades <- na.omit(idades)
cat("Número de valores válidos após remoção de NA:", length(idades), "\n")

# Média
media <- mean(idades)
cat("Média da Idade da Vítima:", media, "anos\n")

# Mediana
mediana <- median(idades)
cat("Mediana da Idade da Vítima:", mediana, "anos\n")

# Moda (função personalizada)
calcular_moda <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)] # Retorna todas as modas, se houver mais de uma
}
moda <- calcular_moda(idades)
cat("Moda da Idade da Vítima:", paste(moda, collapse = ", "), "anos\n")

# Quartis (Q1, Q2, Q3)
quartis <- quantile(idades, probs = c(0.25, 0.5, 0.75))
cat("Quartis da Idade da Vítima:\n")
print(quartis)

# Decis (D1 a D9)
decis <- quantile(idades, probs = seq(0.1, 0.9, by = 0.1))
cat("Decis da Idade da Vítima:\n")
print(decis)

# Percentis (P10, P25, P50, P75, P90)
percentis <- quantile(idades, probs = c(0.10, 0.25, 0.50, 0.75, 0.90))
cat("Percentis selecionados (P10, P25, P50, P75, P90) da Idade da Vítima:\n")
print(percentis)

# Resumo completo
cat("Resumo estatístico da Idade da Vítima:\n")
summary(idades)

















# Extrair a coluna "Idade da Vítima" da base
idades <- Base$"Idade da Vítima"

# Remover "anos" ou outros textos e converter para numérico
idades <- gsub(" anos", "", idades) # Remove " anos" (corrigi o argumento incorreto no seu código)
idades <- as.numeric(as.character(idades)) # Converte para character primeiro, depois numeric
idades <- na.omit(idades) # Remove NAs

# Verificar os primeiros valores para diagnóstico
cat("Primeiros 5 valores de 'Idade da Vítima':\n")
print(head(idades, 5))
cat("Número de valores válidos após remoção de NA:", length(idades), "\n")

# Calcular medidas de posição
media <- mean(idades)
mediana <- median(idades)
calcular_moda <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)] # Retorna todas as modas, se houver mais de uma
}
moda <- calcular_moda(idades)[1] # Pega apenas a primeira moda, se houver várias

# Calcular separatrizes
quartis <- quantile(idades, probs = c(0.25, 0.5, 0.75))
decis <- quantile(idades, probs = seq(0.1, 0.9, by = 0.1))
percentis <- quantile(idades, probs = c(0.10, 0.25, 0.50, 0.75, 0.90))







# Dataframe para medidas de posição
medidas_posicao <- data.frame(
  Medida = c("Média", "Mediana", "Moda"),
  Valor = c(media, mediana, moda)
)

# Dataframe para separatrizes
separatrizes <- data.frame(
  Separatriz = c("Quartis", "Decis", "Percentis"),
  P10 = c(NA, decis[1], percentis[1]),
  P25 = c(quartis[1], decis[2], percentis[2]),
  P50 = c(quartis[2], decis[5], percentis[3]),
  P75 = c(quartis[3], decis[7], percentis[4]),
  P90 = c(NA, decis[9], percentis[5])
)



# Tabela de Medidas de Posição
tabela_posicao <- xtable(medidas_posicao, 
                         caption = "Medidas de Posição da Idade da Vítima - CVLI (2020-2024)", 
                         label = "tab:medidas_posicao_idade",
                         digits = 2) # 2 casas decimais
print(tabela_posicao, 
      type = "latex", 
      include.rownames = FALSE, # Remove numeração das linhas
      floating = TRUE, # Usa ambiente table
      table.placement = "H") # Posicionamento fixo com [H]

# Tabela de Separatrizes
tabela_separatrizes <- xtable(separatrizes, 
                              caption = "Separatrizes da Idade da Vítima - CVLI (2020-2024)", 
                              label = "tab:separatrizes_idade",
                              digits = 2)
print(tabela_separatrizes, 
      type = "latex", 
      include.rownames = FALSE, 
      floating = TRUE, 
      table.placement = "H")






# Extrair a coluna "Idade da Vítima" da base
idades <- Base$"Idade da Vítima"

# Remover "anos" ou outros textos e converter para numérico
idades <- gsub(" anos", "", idades) # Remove " anos"
idades <- as.numeric(as.character(idades)) # Converte para character primeiro, depois numeric
idades <- na.omit(idades) # Remove NAs

# Verificar os primeiros valores para diagnóstico
cat("Primeiros 5 valores de 'Idade da Vítima':\n")
print(head(idades, 5))
cat("Número de valores válidos após remoção de NA:", length(idades), "\n")

# Calcular medidas de dispersão
amplitude <- max(idades) - min(idades)
variancia <- var(idades)
desvio_padrao <- sd(idades)
coef_variacao <- (desvio_padrao / mean(idades)) * 100 # Em porcentagem
erro_padrao <- desvio_padrao / sqrt(length(idades))

# Criar dataframe para medidas de dispersão (corrigido o escape do %)
medidas_dispersao <- data.frame(
  Medida = c("Amplitude", "Variância", "Desvio Padrão", "Coeficiente de Variação", "Erro Padrão"),
  Valor = c(amplitude, variancia, desvio_padrao, coef_variacao, erro_padrao),
  Unidade = c("anos", "anos²", "anos", "\\%", "anos") # Corrigido para "\\%"
)

# Exibir o dataframe para verificar os valores
print(medidas_dispersao)


# Tabela de Medidas de Dispersão
tabela_dispersao <- xtable(medidas_dispersao, 
                           caption = "Medidas de Dispersão da Idade da Vítima - CVLI (2020-2024)", 
                           label = "tab:medidas_dispersao_idade",
                           digits = 2) # 2 casas decimais
print(tabela_dispersao, 
      type = "latex", 
      include.rownames = FALSE, # Remove numeração das linhas
      floating = TRUE, # Usa ambiente table
      table.placement = "H") # Posicionamento fixo com [H]








# Verificar a base carregada
cat("Total de linhas na base:", nrow(Base), "\n")
cat("Amostra dos dados (primeiras 5 linhas):\n")
print(head(Base, 5))

# Extrair ano e hora inteira
Base$ano <- as.numeric(format(Base$Data, "%Y"))  # Extrai ano de "YYYY-MM-DD"
Base$hora_inteira <- as.numeric(format(Base$Hora, "%H"))  # Extrai hora inteira (00-23)

# Contar homicídios por ano
frequencia_ano <- table(Base$ano)
anos_df <- as.data.frame(frequencia_ano)
colnames(anos_df) <- c("ano", "homicidios")
anos_df$ano <- as.numeric(as.character(anos_df$ano))
anos_df <- anos_df[anos_df$ano >= 2020 & anos_df$ano <= 2024, ]

# Mostrar resultados por ano
cat("\nHomicídios por ano (2020-2024):\n")
print(anos_df)
cat("Total de homicídios por ano:", sum(anos_df$homicidios), "\n")

# Contar homicídios por hora inteira
frequencia_hora <- table(Base$hora_inteira)
horas_df <- data.frame(hora_inteira = 0:23)
horas_temp <- as.data.frame(frequencia_hora)
colnames(horas_temp) <- c("hora_inteira", "homicidios")
horas_temp$hora_inteira <- as.numeric(as.character(horas_temp$hora_inteira))
horas_df <- merge(horas_df, horas_temp, by = "hora_inteira", all.x = TRUE)
horas_df$homicidios[is.na(horas_df$homicidios)] <- 0

# Mostrar resultados por hora
cat("\nHomicídios por hora inteira (00-23):\n")
print(horas_df)
cat("Total de homicídios por hora:", sum(horas_df$homicidios), "\n")

# Gerar gráfico de linhas para anos com intervalos de 100 no eixo y
max_y_anos <- max(anos_df$homicidios) * 1.2  # Limite superior com margem
y_ticks <- seq(0, ceiling(max_y_anos / 100) * 100, by = 100)  # Intervalos de 100

plot(anos_df$ano, anos_df$homicidios, type = "l", col = "blue", lwd = 2,
     xlab = "Ano", ylab = "Número de Homicídios",
     main = "Homicídios por Ano (2020-2024)",
     xaxt = "n", yaxt = "n", ylim = c(0, max_y_anos))  # Desativa eixo y padrão
points(anos_df$ano, anos_df$homicidios, pch = 16, col = "blue", cex = 1.5)
axis(1, at = 2020:2024)  # Eixo x com anos
axis(2, at = y_ticks)    # Eixo y com intervalos de 100
dev.copy(png, "grafico_ano.png", width = 800, height = 600)
dev.off()

# Gerar gráfico de linhas para horas (sem alteração no eixo y)
plot(horas_df$hora_inteira, horas_df$homicidios, type = "l", col = "red", lwd = 2,
     xlab = "Hora (00-23)", ylab = "Número de Homicídios",
     main = "Homicídios por Hora Inteira (2020-2024)",
     xaxt = "n", ylim = c(0, max(horas_df$homicidios) * 1.2))
points(horas_df$hora_inteira, horas_df$homicidios, pch = 16, col = "red", cex = 1.5)
axis(1, at = 0:23)
dev.copy(png, "grafico_hora.png", width = 800, height = 600)
dev.off()
