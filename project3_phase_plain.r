# model setting
fun1 = function(x, y){a1*x^2 + b1*x*y + c1*y^2 + d1*x + e1*y + f1}
fun2 = function(x, y){a2*x^2 + b2*x*y + c2*y^2 + d2*x + e2*y + f2}

a1 = 0.43
b1 = 0
c1 = 0
d1 = 0
e1 = 1
f1 = 1

a2 = 0
b2 = 0
c2 = 0
d2 = 0.73
e2 = 0
f2 = 0

# simulation
a1 = -0.93
d2 = 0.53

result = matrix(0, 2000, 2)
result[1, ] = c(0.54, 0.54)

for (i in 2:dim(result)[1]){
    result[i, ] = c(fun1(x=result[(i-1),1],y=result[(i-1),2]), fun2(x=result[(i-1),1],y=result[(i-1),2]))
}

phase.x = cbind(result[,1], c(result[,1][-1],NA))
phase.y = cbind(result[,2], c(result[,2][-1],NA))

phase.xx = phase.x[-c(1:100), ]
phase.yy = phase.y[-c(1:100), ]

par(mar=c(5.1, 4.1, 5, 2.1), xpd=TRUE)
plot(V2~V1, data = phase.xx, pch = 19, xlab = 'x(t)', ylab = 'x(t+1)')
legend("topleft", inset=c(0,-0.15), horiz = T, bty = 'n',
       legend=c(paste0('a = ',a1), paste0('b = ',d2)))

par(mar=c(5.1, 4.1, 5, 2.1), xpd=TRUE)
plot(V2~V1, data = phase.yy, pch = 19, xlab = 'y(t)', ylab = 'y(t+1)')
legend("topleft", inset=c(0,-0.15), horiz = T, bty = 'n',
       legend=c(paste0('a = ',a1), paste0('b = ',d2)))

result[1, ] = c(2.22, 2.22)

