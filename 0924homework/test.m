clc; clear; close all;

##A=[1,2,3;
##  4,5,6;
##  7,8,9]
##A(1,2)=10
##A(1,:)
####
##det(A)
##disp(['det(A): ',num2str(det(A))])
##x=5;
##y=3;
##disp(x==y)
##if x>y
##  disp("x는y보다 큽니다.")
##elseif x<y
##  disp("y는 x보다 큽니다.")
##else
##  disp("x와 y는 같습니다.")
## end
##

##a=input("a : ");
##if a>0
##  disp("a는 양수")
##elseif a<0
##  disp("a는 음수")
##else
##  disp("a는 0")
##end
##
##grade =input("grade : ");
##
##if grade>=90
##  disp("A")
##elseif grade>=80
##  disp("B")
##  elseif grade>=70
##  disp("C")
##  elseif grade>=60
##  disp("D")
##  else
##  disp("F")
##  end
##A = [1,0,0;0,2,0;0,0,3];
##B = [1,2,3;0,2,3;0,0,3];
##C = [1,0,0;2,2,0;3,3,3];
##
##[n,m]=size(A)
##
##is_diagonal =true;
##is_upper_triangular=true;
##is_lower_triangular=true;
##
##for i=1:n
##  for j=1:m
##    if i~=j && A(i,j)~=0
##      is_diagonal=false;
##    endif
##    if i>j && A(i,j)~=0
##     is_upper_triangular=false;
##    endif
##    if i<j && A(i,j)~=0
##      is_lower_triangular=false;
##    endif
##  endfor
##end
##
##if is_diagonal
##  disp("is_diagonal matrix")
##elseif is_upper_triangular
##  disp("is_upper_triangular")
##elseif is_lower_triangular
##  disp("is_lower_triangular")
##else
##end
##
##
##A=[1,2;1,5];
##[n,m]=size(A);
##if n!=m
##  disp("아님")
##else
##  det_A=det(A);
##
##  if det_A~=0
##    disp("존재")
##    disp(inv(A))
##  else
##    disp("없음")
##  endif
##end


##xlim([-2,2])
##ylim([-2,2])
##########################################
##x=linspace(0,2*pi,50);
##y1=sin(x);
##y2=cos(x);
##
##figure;
##hold on;
##grid on;
##axis equal;
##
##plot(x,y1,'r-o','LineWidth',2,'MarkerSize',4);
##plot(x,y2,'b--s','LineWidth',2,'MarkerSize',6);
##xlabel('X')
##ylabel('Y')
##title('sin(x),cos(x)')
##legend('sin(x)','cos(x)')

##radius =0.5;
##center_x=1.0;
##center_y=0.5;
##
##theta =linspace(0,2*pi,100);
##
##x_circle =center_x+radius*cos(theta);
##y_circle =center_y+radius*sin(theta);
##grid on;
##plot(x_circle,y_circle,'r--','LineWidth',1.5);
##axis equal;
##xlabel('X');
##ylabel('Y');
##title('Draw circle1');

###########################################################

##figure;
##hold on;
##grid on;
##axis equal;
##
##xlim([-1.5,1.5])
##ylim([-1.5,1.5])
##
##theta =linspace(0,2*pi,100);
##x_circle =cos(theta);
##y_circle =sin(theta);
##
##plot(x_circle,y_circle,'b--');
##
##for i =1:length(theta);
##  x_point=cos(theta(i));
##  y_point=sin(theta(i));
##
##  h= plot(x_point,y_point,'ro','markersize',10,'markerfacecolor','r');
##
##  pause(0.025);
##  delete(h);
##end
##
##hold off;

#################################################
##figure;
##hold on;
##grid on;
##axis equal;
##
##x_point=[1 ,-1];
##y_point =[1, -1];
##
##plot(x_point(1),y_point(1),'ro','markersize',10,'markerfacecolor','r')
##text(x_point(1)+0.1,y_point(1), '(1,1)','fontsize',12,'color','red');
##
##plot(x_point(2),y_point(2),'go','markersize',10,'markerfacecolor','g')
##text(x_point(2)+0.1,y_point(2), '(-1,-1)','fontsize',12,'color','green');
##
##xlabel('X')
##ylabel('Y')
##title('X and Y,Point')

#####################################
##
##u=[1;2];
##v=[3;1];
##
###시작 끝 나눌갯수
##a=linspace(0,1,20);
##b=linspace(0,1,20);
##
##figure;
##hold on;
##grid on;
##axis equal;
##
##for i= 1:length(a)
##  for j=1:length(b)
##    point =a(i)*u +b(j)*v;
##    plot(point(1),point(2),'bo');
##  endfor
##end
##
##xlabel('X')
##ylabel('Y')
##title('The area that linear combination of vectros u and v')
##
#####################################################
##A=[1,2;
##3,4];
##A=[2,-1;
##1,3];
####A=[1,0;0,1]; 단위행렬 넣으면 같은 원
##theta=linspace(0,2*pi,100);
##x_circle =cos(theta);
##y_circle=sin(theta);
##
##transformed_points =A *[x_circle;y_circle];
##x_transformed =transformed_points(1,:);
##y_transformed =transformed_points(2,:);
##
##figure;
##hold on;
##grid on;
##axis equal;
##
##plot(x_circle,y_circle,'b-','linewidth',2);
##
##plot(x_transformed,y_transformed,'r--','linewidth',2);
##
##legend('unit circle','path transformed by matrix A')
##xlabel('X axis')
##ylabel('Y axis')
##title('Visualization of circular path through maatrix transformation.')
##
##


#################################################

##v=[1;2];
##
##k_values=linspace(0,2,50);
##
##figure;
##hold on;
##grid on;
##axis equal;
##
##xlim([-3,3])
##ylim([-3,5])
##
##for i =1:length(k_values)
##  k=k_values(i)
##
##  v_scaled =k*v;
##  clf;
##
##  hold on;
##  grid on;
##  axis equal;
##
##  xlim([-3,3])
##  ylim([-3,5])
##
##  plot([0,v_scaled(1)],[0,v_scaled(2)],'b-','linewidth',3);
##
##  plot(v_scaled(1),v_scaled(2),'ro','markersize',10,'markerfacecolor','r');
##  pause(0.05);
##end
##
##hold off;

u=[1;2];
v=[3;-1];

num_steps=50;
alpha_values =linspace(0,1,num_steps);
figure;
hold on;
grid on;
axis equal;

xlim([-1,5] )
ylim([-2,3])

  plot([0,u(1)],[0,u(2)],'b-','linewidth',3);
  plot([0,v(1)],[0,v(2)],'r-','linewidth',3);

for i=1:num_steps
    alpha =alpha_values(i);
    w_partial =alpha*u +(1-alpha)*v;

    clf;
    hold on;
    grid on;
    axis equal;

    xlim([-1,5] );
    ylim([-2,3]);

      plot([0,u(1)],[0,u(2)],'b-','linewidth',3);
  plot([0,v(1)],[0,v(2)],'r-','linewidth',3);
    plot([0,w_partial(1)],[0,w_partial(2)],'g-','linewidth',3);
  pause(0.2);
endfor
hold off;







