-----

# Estudo Descritivo dos Crimes Violentos Letais Intencionais (CVLI) no Ceará (2020-2024)

Este projeto apresenta uma **análise descritiva dos Crimes Violentos Letais Intencionais (CVLI)** no estado do Ceará, Brasil, abrangendo o período de 2020 a 2024. O estudo foi desenvolvido utilizando a linguagem **R** no ambiente **RStudio**, e o relatório final é gerado em **LaTeX**.

-----

## Sobre o Projeto

O objetivo principal é identificar padrões, tendências sazonais e variações na incidência de CVLI por meio de estatísticas descritivas. Os dados utilizados são provenientes de fontes oficiais da Secretaria da Segurança Pública e Defesa Social (SSPDS/CE), garantindo a confiabilidade das informações.

### Principais Análises Realizadas:

  * **Frequências Simples e Relativas:** Distribuição de variáveis categóricas como "Natureza do Crime", "Meio Empregado", "Gênero", "Escolaridade da Vítima", "Raça da Vítima" e "Dia da Semana".
  * **Tabelas Cruzadas:** Relação entre pares de variáveis como "Meio Empregado vs. Gênero" e "Escolaridade da Vítima vs. Raça da Vítima".
  * **Gráficos de Distribuição:** Representações visuais da frequência relativa por gênero e meio empregado.
  * **Gráficos de Barras:** Distribuição de vítimas e ocorrências por dia da semana.
  * **Gráficos de Linhas:** Tendências temporais de homicídios por ano e por hora.
  * **Medidas de Posição e Separatrizes:** Análise da "Idade da Vítima" (média, mediana, moda, quartis, decis e percentis).
  * **Medidas de Dispersão:** Avaliação da variabilidade da "Idade da Vítima" (amplitude, variância, desvio padrão, coeficiente de variação e erro padrão).
  * **Boxplot:** Visualização da distribuição e identificação de outliers na "Idade da Vítima".

-----

## Como Replicar o Estudo

Para replicar este estudo, você precisará ter o **R** e o **RStudio** instalados, além de um compilador LaTeX para gerar o PDF.

### Pré-requisitos

  * **R** (versão 4.0 ou superior recomendada)
  * **RStudio**
  * **TeX Live** ou outra distribuição LaTeX (para compilar o documento `.tex`)

### Instalação e Execução

1.  **Clone o Repositório**:

    ```bash
    git clone https://github.com/Nandobez/WebRTC-test-for-a-project.git # Substitua pelo link correto do repositório se for diferente
    cd WebRTC-test-for-a-project # Navegue até a pasta do projeto
    ```

2.  **Instale as Dependências do R**:
    Abra o arquivo `.R` (que contém o código da análise) no RStudio. Instale os pacotes necessários que você utilizou no script R. Por exemplo, se você usa `dplyr`, `ggplot2`, etc., precisará instalá-los:

    ```r
    # Exemplo: Se seus scripts R utilizam esses pacotes
    install.packages("dplyr")
    install.packages("ggplot2")
    # Adicione outros pacotes que você usou
    ```

3.  **Execute o Script de Análise em R**:
    Execute o script R que gera as tabelas e gráficos (presumindo que esses arquivos `.svg` e `.png` sejam gerados por um script R a partir dos dados brutos).

4.  **Compile o Documento LaTeX**:
    Após a geração dos gráficos e tabelas pelo R, compile o arquivo `.tex` para gerar o relatório em PDF. Você pode fazer isso usando um editor LaTeX (como TeXstudio, VS Code com extensão LaTeX) ou via linha de comando:

    ```bash
    pdflatex seu_documento.tex
    ```

    (Substitua `seu_documento.tex` pelo nome real do arquivo LaTeX, que neste caso parece ser o próprio conteúdo fornecido).

-----

## Resultados e Conclusões

O estudo detalha estatísticas sobre a natureza dos crimes, meios empregados, perfil das vítimas (gênero, escolaridade, raça, idade) e padrões temporais (dias da semana, horários e anos).

  * **Gênero:** Vítimas do sexo masculino são aproximadamente **dez vezes mais numerosas** que as femininas, indicando uma alta vulnerabilidade desse grupo.
  * **Meio Empregado:** A **arma de fogo** é o meio mais prevalente, correspondendo a **85,94%** dos casos, seguido por arma branca (8,37%).
  * **Raça:** A análise por raça foi limitada por um **alto percentual de dados não informados (69,84%)**, o que prejudica conclusões precisas sobre o impacto racial. Entre os dados informados, pardos representam **24,67%** e brancos **3,76%** das vítimas.
  * **Idade:** A **idade média das vítimas é de 30,63 anos**, com uma mediana de 28 anos e moda de 24 anos, indicando uma concentração de vítimas em faixas etárias mais jovens.

Esses achados visam subsidiar a formulação de políticas públicas de segurança mais eficazes no Ceará.
