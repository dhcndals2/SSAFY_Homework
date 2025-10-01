clc;
clear;
close all;

##1
x=input('x : ');
if(mod(x,2)==0)
  disp("Even");
else
  disp("Odd");
end

##2
for i=1:10
  disp([i]);
end

n=1;
while(n<=100)
  if(mod(n,3)==0)
  disp([n]);
end
n=n+1;
end


##3
n=input('n : ');
result = factorial_recursive(n);
disp([result])


##4
a=input('a : ');
b=input('b : ');

if(a==b)
  disp("Equal");
elseif (a>b)
  disp("a is greater");
else
  disp("b is greater");
end

##5
x=input('x : ');
y=input('y : ');
z=input('z : ');

if(x>0&&y>0&&z>0)
  disp("All positive");
elseif(x<0||y<0||z<0)
  disp("Contains negative");
else
  disp("Contains zero");
end




