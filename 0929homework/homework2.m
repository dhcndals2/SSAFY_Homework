% Octave/MATLAB Code

clear all;
clc;

%% A. 변환행렬 A_B_T 구하기
% 회전 각도 (라디안)
theta = deg2rad(30);

% 회전 행렬 R
R = [cos(theta), -sin(theta), 0;
     sin(theta),  cos(theta), 0;
     0,           0,          1];

% 이동 벡터 d
d = [4; 3; 0];

% 동차 변환 행렬 A_B_T
A_B_T = [R, d;
         0, 0, 0, 1];

disp('A. 변환 행렬 ^A_B T:');
disp(A_B_T);


%% B. 변환의 역 B_A_T 구하기
% 공식 사용
R_T = R'; % 전치 행렬 (Transpose)
d_inv = -R_T * d;
B_A_T_formula = [R_T, d_inv;
                 0, 0, 0, 1];

% Octave 내장 역행렬 함수 inv() 사용 (검증용)
B_A_T_inv_func = inv(A_B_T);

%% C. 결과 출력
disp('B. 공식으로 구한 역변환 행렬 ^B_A T:');
disp(B_A_T_formula);

disp('C. inv() 함수로 구한 역변환 행렬 (검증용):');
disp(B_A_T_inv_func);
