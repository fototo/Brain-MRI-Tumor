library(flexclust)

## Reading in the healthy data
healthy = read.csv("healthy.csv", header = FALSE)
healthyMatrix = as.matrix(healthy)
healthyVector = as.vector(healthyMatrix)

## Plotting the original healthy brain image using greyscale
png(filename = "healthy.png", width = 800, height = 600, units = "px")
image(healthyMatrix, axes = FALSE, col = grey(seq(0, 1, length = 256)))
dev.off()

## K Means clustering
set.seed(1)
k = 5
KMC = kmeans(healthyVector, centers = k, iter.max = 1000)
healthyClusters = KMC$cluster
dim(healthyClusters) = dim(healthyMatrix)

## Plotting the original healthy brain image using clusters
png(filename = "healthykmc.png", width = 800, height = 600, units = "px")
image(healthyClusters, axes = FALSE, col = rainbow(5))
dev.off()

## Reading in the tumor data
tumor = read.csv("tumor.csv", header = FALSE)
tumorMatrix = as.matrix(tumor)
tumorVector = as.vector(tumorMatrix)

## Plotting the original brain image with tumor using greyscale
png(filename = "tumor.png", width = 600, height = 800, units = "px")
image(tumorMatrix, axes = FALSE, col = grey(seq(0, 1, length = 256)))
dev.off()

## Training the new data using healthy data
set.seed(1)
KMC.kcca = as.kcca(KMC, healthyVector)
tumorClusters = predict(KMC.kcca, newdata = tumorVector)
dim(tumorClusters) = dim(tumorMatrix)

## Plotting the brain image with tumor using the predictions
png(filename = "tumorkmc.png", width = 600, height = 800, units = "px")
image(tumorClusters, axes = FALSE, col = rainbow(5))
dev.off()

