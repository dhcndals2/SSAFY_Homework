clc;
clear;
close all;


##1
P_B=[1;0;0];

theta_A=pi/6; #30
theta_B=pi/4; #45
theta_C=pi/2; #90

R_theta_A=[cos(theta_A),-sin(theta_A),0;
sin(theta_A),cos(theta_A),0;
0,0,1];

R_theta_B=[cos(theta_B),-sin(theta_B),0;
sin(theta_B),cos(theta_B),0;
0,0,1];

R_theta_C=[cos(theta_C),-sin(theta_C),0;
sin(theta_C),cos(theta_C),0;
0,0,1];

A_P_A=R_theta_A*P_B
B_P_A=R_theta_B*P_B
C_P_A=R_theta_C*P_B


##2
P_B=[0.0;2.0;0.0];
R_A_B=[0.866,-0.500,0;
0.500,0.866,0;
0,0,1];
P_A=R_A_B*P_B


## #3
m = 3;
n = 2;
T_AB = [1 0 0 m;
        0 1 0 n;
        0 0 1 0;
        0 0 0 1];

P_B = [1; 1; 0; 1];
P_A = T_AB * P_B;

figure(1);
hold on;
grid on;
axis equal;

xlim([-1 5]);
ylim([-1 5]);
zlim([-1 1]);
view(2);

O  = [0 0 0];
quiver3(O(1),O(2),O(3), 4,0,0, 0, 'Color',[1 0 0], 'LineWidth',3); % X_A (빨강)
quiver3(O(1),O(2),O(3), 0,4,0, 0, 'Color',[0 1 0], 'LineWidth',3); % Y_A (초록)

Op = [m n 0];
quiver3(Op(1),Op(2),Op(3), 1,0,0, 0, 'Color',[1 0 0], 'LineWidth',2); % X_B
quiver3(Op(1),Op(2),Op(3), 0,1,0, 0, 'Color',[0 1 0], 'LineWidth',2); % Y_B

plot3(P_A(1), P_A(2), 0, 'ko', 'MarkerFaceColor','k', 'MarkerSize',7);

text(0.1,4.2,0,'Y_A','FontWeight','bold');
text(4.1,0.1,0,'X_A','FontWeight','bold');
text(Op(1)+0.1,Op(2)+1.05,0,'Y_B');
text(Op(1)+1.05,Op(2)+0.1,0,'X_B');
text(Op(1)-0.2,Op(2)-0.3,0,"O'");
text(0-0.15,0-0.3,0,'O');
text(P_A(1)+0.1, P_A(2)+0.1, 0, 'P');
