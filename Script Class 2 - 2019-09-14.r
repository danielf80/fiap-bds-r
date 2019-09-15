# WhatsApp: dontpad.com/shift-fiap-bgs
# Aula 1 - Geração de Amostras

# Set Working Directory
setwd("C:/Users/logonrmlocal/Documents/DF")

# Read CSV File
MyData <- read.csv(file="sample.csv", header=TRUE, sep=",")

# Write CSV file
write.csv(MyData, file="output.csv")

# Remove DATA from memory
rm(MyData)

# Package Installation
# 	ggplot2 = Create Elegant Data Visualisations Using the Grammar of Graphics
#	http://www.cookbook-r.com/Graphs/
install.packages("ggplot2")

# Load packages into memory
library(ggplot2)

# Atribuir dados a variaveis
d <- diamonds
# Media
mean(d$price)
# Mediana
median(d$price)
# Standard Desv.
sd(d$price)

# Geração de Amostras (by sequencial subset)
a1 <- d[1:3000,]

# Compare "a1" agains "d"
mean(d$price)
median(d$price)
sd(d$price)

mean(a1$price)
median(a1$price)
sd(a1$price)

a2 <- d[1:3000,]
mean(a2$price)
median(a2$price)
sd(a2$price)

# Geração de amostra (Atemporais -> Aleatoria)
    # Create seed 
    set.seed(33)

    # sample(max value, size) - Create array of 'size' values from 1 to 'max value' 
    va <- sample(5,2)

    # Generate sample
    a3 <- d[va[1:3000],]

    # Refactored
    set.seed(33)
    va <- sample(length(d$price), 3000)
    a3 <- d[va,]
    abs((mean(a3$price) - mean(d$price))/mean(d$price))
    abs((median(a3$price) - median(d$price))/median(d$price))
    abs((sd(a3$price) - sd(d$price))/sd(d$price))

# Geração de amostra (Temporais -> Janela Temporal)
    # TODO next class

# Histogram (Data Distribution Representation)
hist(d$price)
    
    # Show more the 1 graph per RStudio screen
    par(mfrow=c(2,2))
    hist(d$price)
    hist(a1$price)
    hist(a2$price)
    hist(a3$price)

# Box Plot (Min, Max, Q1, Q3 and Median)
summary(d)  # All Variables
summary(d$price)

    # Box Plot
    par(mfrow=c(1,1))
    boxplot(d$price)
    boxplot(d$price~d$cut)  # Grouped by a category variable (cut)

# Scatter Plot
m<-mtcars
plot(m$mpg~m$wt)
plot(m$hp,m$mpg)

# Coeficiente de correção linear (Com ordem de grandeza) [-1 <= P <= 1]
# -1) Relação inversamento proporcional
#  1) Relação diretamente proporcional
#  0) Sem relação
# |P| Magnitide [0 < P < 1] (proximidade de relação linear)
# 0 = Relação linear menos evidente
# 1 = Relação linear mais evidente
# Ref.: Método de Pearson
cor(m$mpg,m$wt)
cor(m)

#Exercise:
install.packages("swirl")
library("swirl")
swirl()