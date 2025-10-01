clc;
clear;
close all;

##l1 =4;
##l2 =2;
##
##theta1_vals=linspace(0,2*pi,100);
##theta2_vals=linspace(0,2*pi,100);
##
##figure;
##hold on;
##xlabel('X');
##ylabel('Y');
##title('2DOF Robot Workspace');
##
##axis equl;
##axis([-6 6 -6 6]);
##grid on;
##h_robot =plot([0,0],[0,0],'-r','linewidth',2);
##h_workspace =plot(0,0,'b.');
##x_vals=[];
##y_vals=[];
##
##for theta1 =theta1_vals
##  for theta2 = theta2_vals
##    x1=l1*cos(theta1);
##    y1=l1*sin(theta1);
##    x2=x1+l2*cos(theta1+theta2);
##    y2=y1+l2*sin(theta1+theta2);
##    set(h_robot,'XData',[0 x1 x2], 'YData',[0 y1 y2]);
##
##    x_vals=[x_vals,x2];
##    y_vals =[y_vals,y2];
##    set(h_workspace,'XData',x_vals, 'YData',y_vals);
##    pause(0.01);
##
##  endfor
##end
##
##hold off;

### workspace only

##l1 =4;
##l2 =2;
##
##theta1_vals=linspace(0,2*pi,100);
##theta2_vals=linspace(0,2*pi,100);
##x_vals=[];
##y_vals=[];
##
##for theta1 =theta1_vals
##  for theta2 = theta2_vals
##    x=l1*cos(theta1)+l2*cos(theta1+theta2);
##    y=l1*sin(theta1)+l2*sin(theta1+theta2);
##    x_vals=[x_vals,x];
##   y_vals=[y_vals,y];
##  endfor
##end
##
##figure;
##plot(x_vals,y_vals,'b.');
##axis equl;
##axis([-6 6 -6 6]);
##grid on;


##########
function[x,y] =forward_kinematics(theta1,theta2,l1,l2)
    x=l1*cos(theta1)+l2*cos(theta1+theta2);
    y=l1*sin(theta1)+l2*sin(theta1+theta2);
end


function [theta1, theta2] = inverse_kinematics(x, y, L1, L2)
  cos_theta2 = (x^2 + y^2 - L1^2 - L2^2)/(2 * L1 * L2);
  sin_theta2 = sqrt(1-cos_theta2^2);

  theta2 = atan2(sin_theta2, cos_theta2);

  c1 = ((L1+L2*cos(theta2))*x + L2*sin(theta2)*y)/((L1+L2*cos(theta2))^2 + (L2*sin(theta2))^2);

  s1 = ((L1+L2*cos(theta2))*y-L2*sin(theta2)*x)/((L1+L2*cos(theta2))^2 + (L2*sin(theta2))^2);

theta1 = atan2(s1, c1);
end

[x,y] = forward_kinematics(pi/6,pi/6,1,1)
[theta1, theta2] =inverse_kinematics(x,y,1,1)

rad2deg(theta1)
rad2deg(theta2)

function two_dof_robot_ik_simulator()
    L1 = 1.0;
    L2 = 1.0;

    t = linspace(0, 2*pi, 100);

    x = 1.5 * cos(t);
    y = 1.5 * sin(t);

    figure;
    axis([-2, 2, -2, 2]);
    hold on;
    grid on;
for i = 1:length(t)
    target_x = x(i);
     target_y = y(i);

    [theta1, theta2] = inverse_kinematics(target_x, target_y, L1, L2);

    [end_x, end_y] = forward_kinematics(theta1, theta2, L1, L2);

    x1 = L1 * cos(theta1);
    y1 = L1 * sin(theta1);
    x2 = end_x;
    y2 = end_y;

    cla;
   plot(x, y, 'g--')
  plot([0, x1], [0, y1], 'b', 'LineWidth', 2);
  plot([x1, x2], [y1, y2], 'r', 'LineWidth', 2);
  plot(x2, y2, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
  plot(target_x, target_y, 'gx', 'MarkerSize', 10);

  pause(0.1);
end
hold off;
end
two_dof_robot_ik_simulator();

