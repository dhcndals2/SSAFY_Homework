clc;
clear;
close all;


##1
x =linspace(-10,10,100);
y=2*x+1;

figure;
hold on;
grid on;

plot(x,y,'r--','linewidth',1);
xlabel("x-axis");
ylabel("y-axis");
title("Linear Function");


##2

x =linspace(-5,5,20);
y=power(x,2);

figure;
hold on;
grid on;

plot(x,y,'b-','linewidth',1);

for i=1:length(x);
  x_point=x(i);
  y_point=y(i);
  plot(x_point,y_point,'go','markersize',5,'markerfacecolor','g');
end

xlabel("x-axis");
ylabel("y-axis");
title("Quadratic Function");




##3

x =linspace(0,2*pi,50);
y1=sin(x);
y2=cos(x)

figure;
hold on;
grid on;

plot(x,y1,'g--','linewidth',1);
plot(x,y2,'b-','linewidth',1);

legend("sin(x)","cos(x)");
xlabel("x-axis");
ylabel("y-axis");
title("Sine and Cosine Function");


4
x =linspace(0,5,100);

y=exp(-x).*sin(2*pi*x);


figure;
hold on;
grid on;
xlim([0 ,5]);
ylim([-1 ,1]);
xticks(0:0.5:5);
yticks(-1:0.2:1);
plot(x,y,'m-','linewidth',1);

xlabel("Times");
ylabel("y-axis");
title("Damped Oscillation");





