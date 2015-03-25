% % Our Runga Kutta Function
% %Define theta first. theta= [ pi/4 0]; theta(1)=initial theta and theta(2)
% %is initial omega
% function [T,THETA] = rkn(t0,theta,tf,n)
% % Define our step size
% h = (tf-t0)/n;
% %Making zero matrices
% THETA = zeros(n+1,length(theta));
% T = zeros(n+1,1);
% T(1) = t0;
% t = 0;
% THETA(1,:) = theta';
% %looping the runga kutta using the f function
% for i=1:n
%     k1=f(t,theta);
%     k2=f(t+h/2,theta+h*k1/2);
%     k3=f(t+h/2,theta+h*k2/2);
%     k4=f(t+h,theta+h*k3);
%     k=(k1+2*k2+2*k3+k4)/6;
%     t = t+h;
%     theta = theta+h*k;
%     T(i+1) = t;
%     THETA(i+1,:) = theta';
%     %finding the period. Looking at omega values where omega changes from
%     %positive to negative
%     if THETA(i,2) > 0 && THETA(i+1,2) < 0 
%         omega1 = THETA(i,2)
%         omega2 = THETA(i+1,2)
%         time1 = T(i,1)
%         time2 = T(i+1,1)
%     end
% end
% end
%  
% % 
% % %this is for part 1-6
% % function [omega1,omega2,time1,time2,T,THETA] = rkn(t0,theta,tf,n)
% % h = (tf-t0)/n;
% % % h=0.1;
% % THETA = zeros(n+1,length(theta));
% % T = zeros(n+1,1);
% % T(1) = t0;
% % t = 0;
% % % OM1=zeros(100,1);
% % % OM2=zeros(100,1);
% % % TM1=zeros(100,1);
% % % TM2=zeros(100,1);
% % THETA(1,:) = theta';
% % for i=1:n
% %     k1=f(t,theta);
% %     k2=f(t+h/2,theta+h*k1/2);
% %     k3=f(t+h/2,theta+h*k2/2);
% %     k4=f(t+h,theta+h*k3);
% %     k=(k1+2*k2+2*k3+k4)/6;
% %     t = t+h;
% %     theta = theta+h*k;
% %     T(i+1) = t;
% %     THETA(i+1,:) = theta';
% %     if THETA(i,2) > 0 && THETA(i+1,2) < 0 
% %         omega1 = THETA(i,2)
% %         omega2 = THETA(i+1,2)
% %         time1= T(i,1)
% %         time2= T(i+1,1)
% %         OM1(i,1)=omega1
% %         OM2(i,1)=omega2
% %         TM1(i,1)=time1
% %         TM2(i,1)=time2
% %         break
% %     end
% % end
% % end

% This for part II damped system

function [T,THETA] = rkn(t0,theta,tf,n,ii)
h = (tf-t0)/n;
THETA = zeros(n+1,length(theta));
T = zeros(n+1,1);
T(1) = t0;
t = 0;
THETA(1,:) = theta';
    for i=1:n
        k1=f(t,theta,ii);
        k2=f(t+h/2,theta+h*k1/2,ii);
        k3=f(t+h/2,theta+h*k2/2,ii);
        k4=f(t+h,theta+h*k3,ii);
        k=(k1+2*k2+2*k3+k4)/6;
        t = t+h;
        theta = theta+h*k;
        T(i+1) = t;
        THETA(i+1,:) = theta';
 
        
    end
end
