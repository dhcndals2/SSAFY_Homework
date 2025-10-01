clc; clear; close all;
Ap1 = [1; 1; 1];

% 회전 각도 (단위: degree)
theta = 30;
phi = 45;


% --- 회전 변환 계산 ---
% 각 축에 대한 회전 행렬 계산
Rz = R_z(theta);
Rx = R_x(phi);

% 벡터에 회전 행렬을 순차적으로 적용
% Bp1 = Rx * Rz * Ap1
Bp1 = Rx * Rz * Ap1;


% --- 결과 출력 ---
disp("계산 결과 Bp1 = ");
disp(Bp1);
