library(deSolve)

# model settings: forced duffing equation (fde)
mymodel = function(time, state, pars){
    with(as.list(c(state, pars)),{
        du = v
        dv = beta*u - u^3 - delta*v + gamma*cos(theta)
        dtheta = omega
        return(list(c(du, dv, dtheta)))
    })
}

# set up parameters
pars = c(beta=1, delta=0.25, gamma=0.1, omega=1.0) 

N = 10000
int = 16
times = seq(0, N*2*pi/pars[4], 2*pi/(int*pars[4]))  # time interval
ini = c(u=1, v=1, theta=times[1])  # initial value

# ?ode
fde <- ode(y=ini, func=mymodel, times=times, parms=pars)

# phase plane
plot(x=fde[,2], y=fde[,3], xlab='x', ylab='dx/dt', pch=19, main='Phase plane')

# Poincare plane
length = dim(fde)[1]
plot(x=fde[,2][seq(1,length,int)], y=fde[,3][seq(1,length,int)], xlab='x', ylab='dx/dt', pch=19, main='Poincare plane')


## gamma=0.3
pars = c(beta=1, delta=0.25, gamma=0.3, omega=1.0) 


## other parameters
pars = c(beta=1, delta=0.25, gamma=0.1, omega=2.0) 
pars = c(beta=1, delta=0.25, gamma=0.3, omega=2.0) 

pars = c(beta=1, delta=0.25, gamma=0.1, omega=0.5) 
pars = c(beta=1, delta=0.25, gamma=0.05, omega=0.5) 
pars = c(beta=1, delta=0.25, gamma=0.05, omega=1.0) 

pars = c(beta=1, delta=0.25, gamma=0.05, omega=3.0) 
pars = c(beta=1, delta=0.25, gamma=0.1, omega=3.0) 

