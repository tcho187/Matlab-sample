% EA 3 Thomas Cho

n=afile(1,25:48);

%Plot 1

ncentimeter= .03*n;

secpframe= ((24:48)/30)-0.8;

%Plot 2
nmeter = ncentimeter/100; %from centimeters to meters
D = 0.0333333333333333;
secpframe= ((24:48)/30)-0.8;
v = diff(nmeter,1)/D;

%Plot 3
a = diff(nmeter,2)/D;
secpframe= ((24:48)/30)-0.8;

%Plot 4
n4= BFall_1(83:116,1);
n4a = BFall_1(83:116,2);
secpframe= ((24:48)/30)-0.8;

%Plot 5
FramSec5 = ((24:48)/30)-0.8;
R = n4(4:3:30);
M= 172;
g= 9.81;
ms = 8;
E = ((M*g)-(ms*a)-R')/(M*g);


subplot(5,1,1)
plot (secpframe,ncentimeter)
xlabel('Seconds [s]')
ylabel('Centimeters [cm]')
title('Centimeters in terms of time')

subplot(5,1,2)
plot(FramSec1,v)
xlabel('Seconds [s]')
ylabel('Velocity [m/s]')
title('Velocity in terms of time')

subplot(5,1,3)
plot(FramSec2,a)
xlabel('Seconds [s]')
ylabel('Acceleration [m/s^2]')
title('Acceleration in terms of time')

subplot(5,1,4)
plot(FramSec4,n4a) %Assumes that time is from 0.833333 seconds to 1.1666667 seconds. Need to change scale so that it starts at 0
xlabel('Seconds [s]')
ylabel('Weight [N]')
title('Weight in terms of time')

subplot(5,1,5)
plot(R,E)
xlabel('Seconds [s]')
ylabel('Relative Error')
title('Relative error in terms of time')


%Part 3
%a. Polyfit
p=polyfit(secpframe,ncentimeter,1);
c=p(1)

%b. 
t=secpframe;
syms b
for ii = 1:11
    S(ii)=solve(2*c/b*log(1+exp(b*t(ii)/2))-c*t(ii) == ncentimeter(ii),b);
    
end
b= round(mean(S))
