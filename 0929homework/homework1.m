% Octave/MATLAB Code

clear all;
clc;

% 초기 벡터
AP1 = [3; 7; 0];

%% A. 변환 행렬 T 구하기
% 회전 각도 (라디안)
theta = deg2rad(30);

% z축 기준 회전 행렬 R
R = [cos(theta), -sin(theta), 0;
     sin(theta),  cos(theta), 0;
     0,           0,          1];

% 이동 벡터 d
d = [10; 5; 0];

% 동차 변환 행렬 T
T = [R, d;
     0, 0, 0, 1];

%% B. ^AP2 구하기
% AP1을 동차 좌표로 변환
P1_h = [AP1; 1];

% 변환 행렬 T를 적용
P2_h = T * P1_h;

% P2_h에서 ^AP2 추출
AP2 = P2_h(1:3);


%% C. 결과 출력
disp('A. 변환 행렬 T:');
disp(T);

disp('B. 변환된 벡터 ^A P2:');
disp(AP2);
