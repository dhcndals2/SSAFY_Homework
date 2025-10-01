clc;
clear;
close all;
##1
A_1 = (12+7)*3/4-power(5,2)
B_1 = sqrt(81)+log(1)+exp(0)

##2
a=7
v=[1,2,3,4,5,6,7,8,9,10]
M=[1,2,3;
4,5,6;
7,8,9]

##3
v2=v*a
M2=M+M
M3=M'

##4
M(2,:)
M(3,:)
for i=1:3
  for j=1:3
    if(M(i,j)==5)
      disp([num2str(i), ',', num2str(j)])
      fprintf('5를 찾은 위치 (행, 열): %d, %d\n', i, j)
    end
  endfor
end



##5
sum=0;
for i=1:10
  sum+=v(i);
end

disp([sum])

for i=1:3
  sum=0;
  for j=1:3
    sum+=M(j,i);
  end
  sum=sum/3;
  disp([sum]);
end

max =0;
for i=1:3
  for j=1:3
    if(M(i,j)>max)
      max=M(i,j);
    end

  endfor
end
disp([max])


##6
[n,m]=size(M);
if n!=m
  disp("행렬 크기가 달라서 없음")
else
  det_M=det(M);
  if(abs(det_M)<0.000000000001)
    det_M=0;
  end

  if det_M~=0
    disp("존재")
    disp(inv(A=M))
  else
    disp("det 값이 0이므로 없음")
  endif
end
