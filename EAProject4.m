clear
clc

A = [ -1        9       9
    49.5    -50.5    49.5
   -49.5     40.5   -59.5];

x0=[2
    1
    0];

[V,E] = eig(A);

C = V\x0;
eig1 = E(1,1);
eig2 = E(2,2);
eig3 = E(3,3);
v1 = V(:,1)./V(3,1);
v2 = V(:,2)./V(3,2);
v3 = V(:,3)./V(3,3);

t = 1;
X = C(1)*exp(E(1)*t)*V(:,1)+C(2)*exp(E(5)*t)*V(:,2)+C(3)*exp(E(9)*t)*V(:,3);

fprintf('%1.6f\n',X)

options1 = odeset('reltol',10^(-9));
[t1,x1]=ode45(@ODEFUN,[0 10],x0,options1);

ode45t1 = x1(end,:);
fprintf('%1.6f\n',ode45t1)

options2 = odeset('reltol',10^(-6));
[t2,x2]=ode15s(@ODEFUN,[0 10],x0,options2);

ode15st1 = x2(end,:);
fprintf('%1.6f\n',ode15st1)

figure(1);
plot(t1,x1);
axis([4 10 -0.5 0.5]);
figure(2);
plot(t2,x2)
axis([4 10 -0.5 0.5]);
