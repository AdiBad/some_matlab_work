close all
clear
clc 

%Using ODE, model Gut, Central, Periphary and Excretion states
x=[1.8 0 0 0]
tspan = [0:25]

[t,y]=ode45(@odefun,tspan,x);

figure('name','ODE 1')
for i=1:4
    plot(1:length(tspan),y(:,i))
    hold on
end
hold off
xlabel('Time (hr)')
ylabel('Concentration')
title('Comparing the 4 states')
axis('tight')
legend('G','C','P','E')

%Finding relative concentration
figure('name','ODE 2')
temp = 0;
for i=1:4
    plot(1:length(tspan),y(:,i)+temp)
    hold on
    j=j+1;
    temp = y(:,i)+temp;
end
hold off
xlabel('Time (hr)')
ylabel('Relative concentration')
title('Comparing the 4 states')
axis('tight')
legend('G','G+C','G+C+P','G+C+P+E')

%Periodic oral drug uptake for different periods

%Period of 2 hours
tspan = [0:2:25]

[t,y]=ode45(@odefun,tspan,x);

figure('name','Different periodic uptake')
subplot(2,1,1)
for i=1:4
    plot(1:length(tspan),y(:,i))
    hold on
end
hold off
xlabel('Time (hr) - Period of 2 hours')
ylabel('Concentration')
title('Comparing the 4 states')
axis('tight')
legend('G','C','P','E')

%Period of 5 hours
tspan = [0:5:25]

[t,y]=ode45(@odefun,tspan,x);
subplot(2,1,2)
for i=1:4
    plot(1:length(tspan),y(:,i))
    hold on
end
hold off
xlabel('Time (hr) - Period of 5 hours')
ylabel('Concentration')
title('Comparing the 4 states')
axis('tight')
legend('G','C','P','E')

