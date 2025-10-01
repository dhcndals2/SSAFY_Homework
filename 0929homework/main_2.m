clear all; close all; clc;

A = Trans('y', 2);
B = Rot('z', 60);
C = Trans('x', 4);

figure;
hold on;

O_origin = [0; 0; 0];
X_axis = [1; 0; 0];
Y_axis = [0; 1; 0];
Z_axis = [0; 0; 1];

quiver3(O_origin(1), O_origin(2), O_origin(3), X_axis(1), X_axis(2), X_axis(3), 1, 'r', 'LineWidth', 2);
quiver3(O_origin(1), O_origin(2), O_origin(3), Y_axis(1), Y_axis(2), Y_axis(3), 1, 'g', 'LineWidth', 2);
quiver3(O_origin(1), O_origin(2), O_origin(3), Z_axis(1), Z_axis(2), Z_axis(3), 1, 'b', 'LineWidth', 2);
text(O_origin(1)-0.2, O_origin(2)-0.2, 'O');

OA_origin = A(1:3, 4);
OA_X_axis = A(1:3, 1);
OA_Y_axis = A(1:3, 2);
OA_Z_axis = A(1:3, 3);
quiver3(OA_origin(1), OA_origin(2), OA_origin(3), OA_X_axis(1), OA_X_axis(2), OA_X_axis(3), 1, 'r', 'LineWidth', 2);
quiver3(OA_origin(1), OA_origin(2), OA_origin(3), OA_Y_axis(1), OA_Y_axis(2), OA_Y_axis(3), 1, 'g', 'LineWidth', 2);
quiver3(OA_origin(1), OA_origin(2), OA_origin(3), OA_Z_axis(1), OA_Z_axis(2), OA_Z_axis(3), 1, 'b', 'LineWidth', 2);
text(OA_origin(1)-0.2, OA_origin(2)-0.2, 'OA');

OB_origin = B(1:3, 4);
OB_X_axis = B(1:3, 1);
OB_Y_axis = B(1:3, 2);
OB_Z_axis = B(1:3, 3);
quiver3(OB_origin(1), OB_origin(2), OB_origin(3), OB_X_axis(1), OB_X_axis(2), OB_X_axis(3), 1, 'r', 'LineWidth', 2);
quiver3(OB_origin(1), OB_origin(2), OB_origin(3), OB_Y_axis(1), OB_Y_axis(2), OB_Y_axis(3), 1, 'g', 'LineWidth', 2);
quiver3(OB_origin(1), OB_origin(2), OB_origin(3), OB_Z_axis(1), OB_Z_axis(2), OB_Z_axis(3), 1, 'b', 'LineWidth', 2);
text(OB_origin(1)+0.1, OB_origin(2)+0.1, 'OB');

OC_origin = C(1:3, 4);
OC_X_axis = C(1:3, 1);
OC_Y_axis = C(1:3, 2);
OC_Z_axis = C(1:3, 3);
quiver3(OC_origin(1), OC_origin(2), OC_origin(3), OC_X_axis(1), OC_X_axis(2), OC_X_axis(3), 1, 'r', 'LineWidth', 2);
quiver3(OC_origin(1), OC_origin(2), OC_origin(3), OC_Y_axis(1), OC_Y_axis(2), OC_Y_axis(3), 1, 'g', 'LineWidth', 2);
quiver3(OC_origin(1), OC_origin(2), OC_origin(3), OC_Z_axis(1), OC_Z_axis(2), OC_Z_axis(3), 1, 'b', 'LineWidth', 2);
text(OC_origin(1)-0.2, OC_origin(2)-0.2, 'OC');

axis([-2 5 -1 4 -1 2]);
axis equal;
grid on;
view(2);
hold off;

xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Visualization of Coordinate Frame Transformations');
