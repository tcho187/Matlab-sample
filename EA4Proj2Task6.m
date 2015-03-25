% Task 1 

% Set counters = 0
n=0;
m=0;
t=0;

% Input given values 
h=0.1;
I0=1.1;
epsilon=0.1;
hmin=1.0*10^(-6);
Omega0=sqrt(I0^2-1);
%Omega=Omega0-1.5*epsilon;
v0=0;

% Create empty matrices to accumulate calculated values
V=[];
T=[];
H=[];
OmegaM=[];
OmegaAvM=[];
f=0;

%Set a while loop with 2 conditions
%1. Running the program until tfinal
%2. Limiting how small the sections of time can be to run matlab

for i = -2:.1:2
    Omega = Omega0 + i*epsilon
    T=2*pi/Omega;
    tfinal=1000*T;
    while t<tfinal && h>hmin
    % Take one Euler Step
    dvdt=I0-cos(v0)+epsilon*sin(Omega*t);
    v1=v0+h*dvdt;
    % Then take one improved Euler step
    dvdt2=I0-cos(v1)+epsilon*sin(Omega*(t+h));
    v2=v0+(h/2)*(dvdt+dvdt2);
    % Calculate the difference of the steps with Error
    Error= v2-v1;
    n=n+1;
    % Determine if Error is too large and halve step size
    if abs(Error)>5.0*10^(-4)
        h=h/2;
        continue
    else
        t=t+h;
        m=m+1;
        % Input calculated into matrices  
        V(m)=v2;
        T(m)=t;
        H(m)=h;
        v0=v2;
        % Determine if Error is too small and double step size
        if abs(Error)<5.0*10^(-6)
            h=2*h;
        end
    end
    end
   
    f=f+1;
    OmegaAv = V(end)/tfinal;
    OmegaM(f)=Omega;
    OmegaAvM(f)=OmegaAv;
    
end

O = abs(OmegaAvM-OmegaM)
plot(O,OmegaM)


% Find signal current 'I'
%I=I0+epsilon*sin(Omega*T);

% Find values of 'I' with calculated 'V' values 
%IV=I0-cos(V)+epsilon*sin(Omega*T);

% Plot the two values of signal current vs. time
%plot(T,I,'r',T,IV,'b')
%axis([2000 2100 0 2.3])
%xlabel('Time [T]')
%ylabel('Signal (red) and Voltage (blue)')

% Plot step size vs. time
%plot(T,H)
%axis([2000 2100 0 .2])
%xlabel('Time [T]')
%ylabel('Step Size [T]')

% Calculate the average value of Omega
%OmegaAv = V(end)/tfinal;
%fprintf('OmegaAverage= %6.5f\n', OmegaAv);
