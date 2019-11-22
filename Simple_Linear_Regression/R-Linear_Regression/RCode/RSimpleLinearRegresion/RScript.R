# Simple Linear Regresion 

#Importar el data set

dataset = read.csv("/Users/Erick/Desktop/Erick/Developer/Data-Science/Simple_Linear_Regression/R-Linear_Regression/RCode/RSimpleLinearRegresion/Salary_Data.csv")

#Dividir el dataset en entrenamiento y en prueba
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualizar resultados del set de entrenamiento
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salario vs Experiencia (Set de entrenamiento)') +
  xlab('Años de experiencia') +
  ylab('Salario')

# Visualizar los resultados del set de prueba
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  #Titulo
  ggtitle('Salario segun la experiencia (Set de prueba)') +
  xlab('Años de experiencia') +
  ylab('Salario')


