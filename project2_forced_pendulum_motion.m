%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Coded by Tzuyin Wu  11/8  2013.
%  This program solves the following equation for a forced pendulum motion:
%       x''+ c*x'+ sin(x) = a*sin(w*t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clear all                                   % Clear memory.
tic                                         % Start counting elapsed time.
c=0.05;                                     % Set parameters values.
a=2.5;
w=1.0;
T=2.*pi/w;                                  % Period of the driving force.
N=10000;                                    % Number of periods to be calculated.
tp=0:T:N*T;                                 % Set Poincare plane, with stroboscopic time T.
Nd=50;                                      % Number of initial calculations to be discarded.                                                 
dx=@(t,x) [x(2);-c*x(2)-sin(x(1))+a*sin(w*t)];    % Input equations.
[t,x]=ode45(dx,tp,[1.0,1.0]);                     % Solve equations by using R-K method.
plot(mod(x(Nd:end,1),2.*pi),x(Nd:end,2),'.','markersize',1)        % Plot trjectory on Poincare plane.
axis([0 2.*pi -6 2])                        % Set plotting range.
xlabel('x'); ylabel('dx/dt')                % Input axes labels.
toc                                         % Stop counting elapsed time.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Code by Jheng-Yu Wang 12/13  2016.
%  This program solves the following equation for a forced pendulum motion:
%       x''+ delta*x'- beat*x+ x^3 = gamma*cos(wt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
clear all                                   % Clear memory.
tic                                         % Start counting elapsed time.
delta=0.25;                                     % Set parameters values.
beta=1;
w=1.0;
gamma=0.1;
T=2.*pi/w;                                  % Period of the driving force.
N=10000;                                    % Number of periods to be calculated.
tp=0:T:N*T;                                 % Set Poincare plane, with stroboscopic time T.
Nd=50;                                      % Number of initial calculations to be discarded.                                                 
dx=@(t,x) [x(2);-delta*x(2)+beta*x(1)-x(1).^3+gamma*cos(w*t)];    % Input equations.
[t,x]=ode45(dx,tp,[1.0,1.0]);                     % Solve equations by using R-K method.
plot(mod(x(Nd:end,1),2.*pi),x(Nd:end,2),'.','markersize',1)        % Plot trjectory on Poincare plane.
axis([0 2.*pi -6 2])                        % Set plotting range.
xlabel('x'); ylabel('dx/dt')                % Input axes labels.
toc                                         % Stop counting elapsed time.

plot(x(:,1),x(:,2),'.');                    % phase plane
xlabel('x'); ylabel('dx/dt')                % Input axes labels.

w=0.3;
gamma=0.3;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%