### set up population dynamics
myfun = function(x, r, K){
    x + r*x*(1 - x/K)
}

### simulation
data = data.frame(matrix(0, 1, 3))
colnames(data) = c('Nt', 'Nt+1', 't')

# initial value
data[1, ] = c(100, 0 , 1)

# generate population size data
for (i in 1:999){
    data[i, 2] = myfun(data[i, 1], r = 3, K = 1000)
    data[(i+1), 3] = (i+1)
    data[(i+1), 1] = data[i, 2]
}

plot(data[1:100, 1], xlab = 'Time (t)', ylab = 'Population size (N)', type = 'l',
     col = 'blue', ylim = c(0, 1500), lwd = 2, main = 'r = 3')

### bifurcation (in terms of growth rate 'r')
r = seq(from = 0, to = 3, by = 0.01)
bifur = data.frame(matrix(0, 1000, length(r)))
colnames(bifur) = r

for (i in 1:length(r)){
    for (j in 1:999){
        data[j, 2] = myfun(data[j, 1], r = r[i], K = 1000)
        data[(j+1), 3] = (j+1)
        data[(j+1), 1] = data[j, 2]
    }
    bifur[, i] = data[, 1]
}

plot(x = r, y = rep(0, length(r)), type = 'n', xlab = 'Growth rate (r)', 
     ylab = 'N at equalibrium', ylim = c(0, 1500))
for (i in 1:length(r)){
    points(rep(r[i], 100), bifur[901:1000, i], col = 'blue', pch = 20, cex = 0.8)
}




