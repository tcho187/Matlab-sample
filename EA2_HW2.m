% Thomas Cho


n=afile(1,13:26);
d=0.127;

%PLOT 1

n1=0.127*n;

time=0:(1/30):(13/30);

subplot(4,1,1)

plot(time,n1)
xlabel('Seconds [s]')
ylabel('Centimeters [cm]')
title('Centimeters in terms of time')

%PLOT 2

n2=n1/100;

time2=(1/60):(1/30):(25/60);

v=diff(n2,1)/(d/100)

subplot(4,1,2)
plot(time2,v)
xlabel('Seconds [s]')
ylabel('Velocity [m/s]')
title('Velocity in terms of time')

%PLOT 3

time3=((13:24)/30)-(13/30)
a=diff(n2,2)/(d/100)

subplot(4,1,3)
plot(time3,a)
xlabel('Seconds [s]')
ylabel('Acceleration [m/s^2]')
title('Acceleration in terms of time')

%PART II

%A

x2=4.905*((time).^2);
v2=9.81*(time2);
a2=9.81;

%B

subplot(4,1,1)
hold on;
plot(time,x2)

subplot(4,1,2)
hold on;
plot(time2,v2)

subplot(4,1,3)
hold on;
plot(time3,a2)








