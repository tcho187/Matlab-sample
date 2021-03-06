
% this function calls upon Omega Prime
function thetap = f(t,theta)
thetap = [theta(2) -2*cos(theta(1))*(exp(.6*sin(theta(1)))-exp(-.6*sin(theta(1))))];
end

% Our Runga Kutta Function
%Define theta first. theta= [ pi/4 0]; theta(1)=initial theta and theta(2)
%is initial omega
function [T,THETA] = rkn(t0,theta,tf,n)
% Define our step size
h = (tf-t0)/n;
%Making zero matrices
THETA = zeros(n+1,length(theta));
T = zeros(n+1,1);
T(1) = t0;
t = 0;
THETA(1,:) = theta';
%looping the runga kutta using the f function
for i=1:n
    k1=f(t,theta);
    k2=f(t+h/2,theta+h*k1/2);
    k3=f(t+h/2,theta+h*k2/2);
    k4=f(t+h,theta+h*k3);
    k=(k1+2*k2+2*k3+k4)/6;
    t = t+h;
    theta = theta+h*k;
    T(i+1) = t;
    THETA(i+1,:) = theta';
    %finding the period. Looking at omega values where omega changes from
    %positive to negative
    if THETA(i,2) > 0 && THETA(i+1,2) < 0 
        omega1 = THETA(i,2)
        omega2 = THETA(i+1,2)
        time1 = T(i,1)
        time2 = T(i+1,1)
    end
end
end

% Linear Interpolation equation
%Finding period using the values found from rkn function
omega1=0.0400;
omega2=-0.0836;
time1=4.7000;
time2=4.8000;
Period=(time2-time1)*(-omega1/(omega2-omega1))+time1

%Period was 4.7324

%Running the rkn function for initial thetas between pi/16 and 7pi/16

j=0
for ii=pi/16:pi/16:7*pi/16
    theta=[ii 0];
    j=j+1;
    [T THETA]=rkn(0,theta,10,100);
    newtheta(:,j)=THETA(:,1);
    newomega(:,j)=THETA(:,2);
end



