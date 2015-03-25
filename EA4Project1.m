% 
% %Pprime m-file
% function F = Pprime(t,P)
% F=P*(-1+P-(.1+.099*sin(1.5*t))*(P^2));
% end
% 
% %Pprime2 m-file
% function F = Pprime2(t,P)
% F=P*(-1+P-.1*P^2);
% end
% 
% %Estimate m-file
% function F = Estimate(t,P)
% F=.0004*P^2-.06*P;
% end
% 
% %EA4Project1 m-file
% 
% 
% % Task 6
% 
% %plotting the computed solution for P(0)=200 and t=[0,20]
% [t,P]=ode45(@Estimate,[0,20],200);
% % plotting the exact solution for P(0)=200 and t=[0,20]
%  exact=(600*exp(-0.06*t))./(4*exp(-0.06*t)-1);
%  plot (t,P,'g',t,exact,'ro');
% %Took the absolute difference of the computed and exact solutions to get
% %the error when P(0)=200
%  ErrorA=abs(P-exact);
% %plot t versus Error graph
% plot(t,ErrorA);
% 
% %plotting the computed solution for P(0)=100 and t=[0,20]
% [t,P]=ode45(@Estimate,[0,20],100);
% %plotting the exact solution for P(0)=100 and t=[0,20]
% exact2= (300)./(2+exp(0.06*t));
% plot (t,P,'g',t,exact2,'ro');
% %Took the absolute difference of the computed and exact solutions to get
% %the error when P(0)=100
% ErrorB=abs(P-exact2);
% %plot t versus Error graph
% plot(t,ErrorB)
% 
% %took values of a=0.1 and a=1 and P(0)=1,P(0)=8,P(0)=9 and plotted
% [t1,P1] = ode45(@Pprime2, [0,20],1,options);
% [t8,P8] = ode45(@Pprime2, [0,20],8,options);
% [t9,P9] = ode45(@Pprime2, [0,20],9,options);
% 
% subplot(3,1,1),plot(t1,P1)
% subplot(3,1,2), plot(t8,P8)
% subplot(3,1,3),plot(t9,P9)
% 
% %took tolerance
% options= odeset('Reltol',1e-5);
% 
% %Task 7
% %Computed and plotted Equation 4 with different values of E and t=[0,30]
% options= odeset('Reltol',1e4);
% [t,P]=ode45(@Pprime,[0,30],8);
% plot(t,P)
% %Computed Amplitude by taking max and min and subtracting
% A01=max(P)-min(P)
% %Computed Pbig and Psmall
% Pbig=98.99
% Psmall=3.921
% %plotted
% plot(t,P,'b',t,Pbig,'g',t,Psmall,'g')
% %time when solution goes exinct
% [t,P]=ode45(@Pprime,[0,30],1.2);
% plot(t,P)
% %time when solution oscillates
% [t,P]=ode45(@Pprime,[0,30],1.5);
% plot(t,P)
% 
% %Task 8 
% % dy/dt initial cond.
% % time interval
% options= odeset('Reltol',1e-8);
% [t,P] = ode45(@Pprime, [0,30], 8,options);
% %the solution when t=30
% t1 = find(t==30);
% %print solution
% %fprintf('P(30) = %6.4f\n', P(t1))
% %Computed both Pbig values
% PbigAaddE = max(P);
% PbigAminusE = min(P);
% %plotted
% plot (t,P,'g',t, PbigAaddE, 'b',t, PbigAminusE, 'b')
% 
% %options= odeset('Reltol',1e-10);
% %[t,P]=ode45(@Pprime2,[0,30],0,options);
% 
% %plot (t,P)
%  
% 
% 
% % exact2= (300)./(2+exp(0.06*t));
% 
% 
% % plot (t,P,'g',t,exact2,'ro');
% % 
% % plot (t,P,'g',t,exact,'ro');
% 
% % ErrorA=abs(P-exact);
% % 
% % plot(t,ErrorA);
% 
% 
% % 
% % ErrorB=abs(P-exact2);
% 
% % plot(t,ErrorB)
% % options= odeset('Reltol',1e-2);
% % [t1,P1] = ode45(@Pprime2, [0,20],1,options);
% % [t8,P8] = ode45(@Pprime2, [0,20],8,options);
% % [t9,P9] = ode45(@Pprime2, [0,20],9,options);
% % 
% % subplot(3,1,1),plot(t1,P1)
% % subplot(3,1,2), plot(t8,P8)
% % subplot(3,1,3),plot(t9,P9)
% % options= odeset('Reltol',1e4);
% % [t,P]=ode45(@Pprime,[0,30],8);
% % 
% % 
% % A01=max(P)-min(P)
% % 
% % 
% % Pbig=98.99
% % Psmall=3.921
% % 
% % plot(t,P,'b',t,Pbig,'g',t,Psmall,'g')
% 
% 
% 
% 
% [t,P]=ode45(@Pprime,[0,30],1.5);
% plot(t,P)
% 
% 
% 


% Task 8 
% dy/dt initial cond.
% time interval
options= odeset('Reltol',1e-8);
[t,P] = ode45(@Pprime, [0,30], 8,options);
% the solution when t=30
t1 = find(t==30);
% print solution
fprintf('P(30) = %6.4f\n', P(t1))
% Computed both Pbig values
PbigAaddE = max(P);
PbigAminusE = min(P);
% plotted
plot (t,P,'g',t, PbigAaddE, 'b',t, PbigAminusE, 'b')