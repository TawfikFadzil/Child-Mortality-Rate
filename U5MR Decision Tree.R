### Predicting Under 5 Mortality Rate (Decision Tree)

library (tree)

# Read the data 
wbcc <- read.csv("wbcc_bc.csv")

# Keeping Variables for analysis
under5 <- wbcc[c(2,69:79)]
names(under5) <- c("Country", "GenderParity", "Education", "Mortality", "HealthWorker", "Underweight", "Poverty", "PopulationGrowth", "Population", "UrbanGrowth", "UrbanPopulation", "UrbanPercentage")

# Remove rows with missing values in under-five mortality rate
under5 <- subset(under5, (!is.na(under5$Mortality)))

# Subset without country
u5mr <- under5[c(-1)]

# Building regression Tree 
tree.u5mr <- tree(formula = Mortality~., data=u5mr)
plot(tree.u5mr)
text(tree.u5mr, cex=0.4)

# Get MSE for Decision Tree
mse.full <- mean(residuals(tree.u5mr)^2)
