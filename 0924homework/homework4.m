clc;
clear;
close all;

% --- 문제의 조건 입력 ---
theta1_deg = input('첫 번째 링크의 각도 입력 (도): '); % 각도 1 (도)
theta2_deg = input('두 번째 링크의 각도 입력 (도): '); % 각도 2 (도)

% --- 계산 ---
% 각도를 라디안으로 변환
theta1 = deg2rad(theta1_deg);
theta2 = deg2rad(theta2_deg);

% 링크의 초기 벡터 정의
L1_vec = [2; 0]; % 첫 번째 링크 길이: 2
L2_vec = [3; 0]; % 두 번째 링크 길이: 3

% 1. 첫 번째 링크의 끝점(P1) 계산
R1 = [cos(theta1), -sin(theta1);
      sin(theta1),  cos(theta1)]; % theta1 회전 행렬
P1 = R1 * L1_vec;

% 2. 두 번째 링크의 끝점(P2) 계산
% L2는 theta1 + theta2 만큼 회전해야 함
theta_total = theta1 + theta2;
R2 = [cos(theta_total), -sin(theta_total);
      sin(theta_total),  cos(theta_total)]; % theta1+theta2 회전 행렬
P2 = P1 + R2 * L2_vec; % P1 위치에서 L2가 회전한 벡터를 더함

% --- 결과 출력 ---
fprintf('P1의 좌표: (%.4f, %.4f)\n', P1(1), P1(2));
fprintf('P2의 최종 좌표 (Px, Py): (%.4f, %.4f)\n', P2(1), P2(2));

% --- 그래프 그리기 ---
figure;
hold on;
grid on;
axis equal; % 축의 비율을 동일하게 설정
xlim([-5, 6]);
ylim([-5, 6]);
title('2-Link Manipulator');
xlabel('x-axis');
ylabel('y-axis');

% 링크 그리기
plot([0 P1(1)], [0 P1(2)], 'r-', 'LineWidth', 3); % 첫 번째 링크 (빨강색)
plot([P1(1) P2(1)], [P1(2) P2(2)], 'g-', 'LineWidth', 3); % 두 번째 링크 (초록색)

% 관절 및 원점 그리기 (검정색 점)
plot(0, 0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');         % 원점
plot(P1(1), P1(2), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % 첫 번째 관절 (P1)
plot(P2(1), P2(2), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % 끝점 (P2)

% 최종 좌표 텍스트 표시
text(P2(1) + 0.2, P2(2), sprintf('(%.2f, %.2f)', P2(1), P2(2)));

hold off;
