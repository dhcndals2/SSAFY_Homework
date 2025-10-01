clc;
clear;
close all;

##origin = [0,0,0];
##x_axis = [1,0,0];
##y_axis = [0,1,0];
##z_axis = [0,0,1];
##
##theta =pi/3;
##R = [cos(theta), -sin(theta),0;
##    sin(theta), cos(theta),0;
##    0,0,1]'
##
##    x_axis_rot = R*x_axis'
##    y_axis_rot = R*y_axis'
##    z_axis_rot = R*z_axis'
##
##figure;
##hold on;
##line([origin(1),x_axis(1)],[origin(2),x_axis(2)],[origin(3),x_axis(3)],
##'color','r','linewidth',2)
##line([origin(1),y_axis(1)],[origin(2),y_axis(2)],[origin(3),y_axis(3)],
##'color','g','linewidth',2)
##line([origin(1),z_axis(1)],[origin(2),z_axis(2)],[origin(3),z_axis(3)],
##'color','b','linewidth',2)
##
##line([origin(1),x_axis_rot(1)],[origin(2),x_axis_rot(2)],[origin(3),x_axis_rot(3)],
##'color','r','linewidth',2,'linestyle','--')
##line([origin(1),y_axis_rot(1)],[origin(2),y_axis_rot(2)],[origin(3),y_axis_rot(3)],
##'color','g','linewidth',2,'linestyle','--')
##line([origin(1),z_axis_rot(1)],[origin(2),z_axis_rot(2)],[origin(3),z_axis_rot(3)],
##'color','b','linewidth',2,'linestyle','--')
##
##text(x_axis(1),x_axis(2),x_axis(3),'X','fontsize',12,'fontweight','bold','color','r')
##text(y_axis(1),y_axis(2),y_axis(3),'Y','fontsize',12,'fontweight','bold','color','g')
##text(z_axis(1),z_axis(2),z_axis(3),'Z','fontsize',12,'fontweight','bold','color','b')
##
##text(x_axis_rot(1),x_axis_rot(2),x_axis_rot(3),'X''','fontsize',12,'fontweight','bold','color','r')
##text(y_axis_rot(1),y_axis_rot(2),y_axis_rot(3),'Y''','fontsize',12,'fontweight','bold','color','g')
##text(z_axis_rot(1),z_axis_rot(2),z_axis_rot(3),'Z''','fontsize',12,'fontweight','bold','color','b')
##
##title('3D Coordinate Sysyem Transformation');
##xlabel('X axis');
##ylabel('Y axis');
##zlabel('Z axis');
##
##legend({'Original X-axis','Original Y-axis','Original Z-axis',
##'Rotated X-axis','Rotated Y-axis','Rotated Z-axis'},
##'Location','northeastoutside');
##
##grid on;
##axis equal;
##view(3);
##hold off;

#######################################

##
##O = [0, 0, 0];
##
##x_axis_A = [1, 0, 0]';
##y_axis_A = [0, 1, 0]';
##z_axis_A = [0, 0, 1]';
##
##R_A = [x_axis_A, y_axis_A, z_axis_A];
##
##quiver3(O(1), O(2), O(3),
##        x_axis_A(1), x_axis_A(2), x_axis_A(3),
##        1, 'r', 'LineWidth', 2);
##hold on;
##
##quiver3(O(1), O(2), O(3),
##        y_axis_A(1), y_axis_A(2), y_axis_A(3),
##        1, 'g', 'LineWidth', 2);
##
##quiver3(O(1), O(2), O(3),
##        z_axis_A(1), z_axis_A(2), z_axis_A(3),
##        1, 'b', 'LineWidth', 2);
##
##A = [0, 2, 0];
##OA = O + A;
##
##quiver3(OA(1), OA(2), OA(3),
##        x_axis_A(1), x_axis_A(2), x_axis_A(3),
##        1, 'r', 'LineWidth', 2);
##
##quiver3(OA(1), OA(2), OA(3),
##        y_axis_A(1), y_axis_A(2), y_axis_A(3),
##        1, 'g', 'LineWidth', 2);
##
##quiver3(OA(1), OA(2), OA(3),
##        z_axis_A(1), z_axis_A(2), z_axis_A(3),
##        1, 'b', 'LineWidth', 2);
##
##R_Z = [  0.5, -0.866, 0;
##       0.866,    0.5, 0;
##           0,      0, 1];
##R_B = R_Z * R_A;
##
##quiver3(OA(1), OA(2), OA(3),
##        R_B(1,1), R_B(2,1), R_B(3,1),
##        1, 'r', 'LineWidth', 2);
##
##quiver3(OA(1), OA(2), OA(3),
##        R_B(1clea,2), R_B(2,2), R_B(3,2),
##        1, 'g', 'LineWidth', 2);
##
##quiver3(OA(1), OA(2), OA(3),
##        R_B(1,3), R_B(2,3), R_B(3,3),
##        1, 'b', 'LineWidth', 2);


###############################

####기하학적해석
##L1=1;
##L2=1;
##t=linspace(0,2*pi,100);
##
##theta1=sin(t);
##theta2=cos(t);
##
##x1=L1 * cos(theta1);
##y1 =L1*sin(theta1);
##
##x2=x1+L2*cos(theta1+theta2);
##y2=y1+L2*sin(theta1+theta2);
##
##figure;
##axis([-2,2,-2,2]);
##axis equal;
##hold on;
##
##for i =1:length(t)
##  clf; #이전에 그린것들 지우기
##  axis([-2,2,-2,2]);
##  axis equal;
##  hold on;
##  plot([0,x1(i)],[0,y1(i)],'b-','linewidth',2);
##  plot([x1(i),x2(i)],[y1(i),y2(i)],'r-','linewidth',2);
##  plot(x2(i),y2(i),'ko','markersize',10,'markerfacecolor','k');
##
##  pause(0.05);
##
##end
###############################

L1=1;
L2=1;
theta1=pi/2;
theta2=pi/4;

DH=[0,0,0,theta1;
    0,L1,0,theta2;
    0,L2,0,0];

%T01 =Rot(z1,theta1)

T01 = [cos(theta1),-sin(theta1),0,0;
       sin(theta1),cos(theta1),0,0;
       0,0,1,0;
       0,0,0,1];
%T12 =Trans(x1,L1)*Rot(z2,theta2)
T12_t=[1,0,0,L1;
    0,1,0,0;
    0,0,1,0;
    0,0,0,1];

T12_r = [cos(theta2),-sin(theta2),0,0;
       sin(theta2),cos(theta2),0,0;
       0,0,1,0;
       0,0,0,1];
T12 = T12_t* T12_r;

# T23 = Trans(x2,L2)
T23=[1,0,0,L2;
    0,1,0,0;
    0,0,1,0;
    0,0,0,1];

T=T01*T12*T23

x1 =T01(1,4);
y1=T01(2,4);

x2=(T01*T12)(1,4);
y2=(T01*T12)(2,4);

x3=T(1,4);
y3=T(2,4);

plot([0,x1],[0,y1],'r-','linewidth',2);
hold on;
plot([x1,x2],[y1,y2],'g-','linewidth',2);
plot([x2,x3],[y2,y3],'b-','linewidth',2);

plot(x1,y1,'ko','markersize',10,'markerfacecolor','k');
plot(x2,y2,'ko','markersize',10,'markerfacecolor','k');
plot(x3,y3,'ko','markersize',10,'markerfacecolor','k');




