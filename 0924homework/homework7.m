clc; clear; close all;

%% --- 설정 변수 ---
L1 = 2; % 첫 번째 링크의 길이
L2 = 3; % 두 번째 링크의 길이

w1 = 0.5; % 첫 번째 관절의 회전 속도 (rad/s)
w2 = 0.8; % 두 번째 관절의 회전 속도 (rad/s)

% 애니메이션 시간 설정
t_end = 15;      % 총 애니메이션 시간 (초)
dt = 0.02;       % 시간 간격 (프레임 속도 조절)
time_vec = 0:dt:t_end;

%% --- 그래프 창 설정 ---
figure('Name', '2-Link Manipulator Animation (cla method)');

%% --- 애니메이션 루프 ---
for t = time_vec
    % 1. 현재 프레임을 그리기 전 이전 프레임을 지움
    cla;

    % --- 그래프 속성 설정 (매번 다시 설정) ---
    hold on;
    grid on;
    axis equal;
    axis([-5 5 -5 5]); % 축 범위 고정
    title('Real-time Manipulator Movement');
    xlabel('x-axis');
    ylabel('y-axis');

    % 2. 현재 시간에 따른 각도 계산
    theta1 = w1 * t;
    theta2 = w2 * t;

    % 3. 회전 행렬 생성
    R1 = [cos(theta1), -sin(theta1);
          sin(theta1),  cos(theta1)];

    % 4. 각 링크의 끝점 좌표 계산
    P0 = [0; 0]; % 원점
    P1 = R1 * [L1; 0];

    % 두 번째 링크는 P1 위치에서 (theta1 + theta2) 만큼 회전
    theta_total = theta1 + theta2;
    R_total = [cos(theta_total), -sin(theta_total);
               sin(theta_total),  cos(theta_total)];
    P2 = P1 + R_total * [L2; 0];

    % 5. 현재 프레임의 로봇 팔 그리기
    % 링크 그리기
    plot([P0(1) P1(1)], [P0(2) P1(2)], 'r-', 'LineWidth', 3); % 첫 번째 링크
    plot([P1(1) P2(1)], [P1(2) P2(2)], 'g-', 'LineWidth', 3); % 두 번째 링크

    % 관절 및 원점 그리기
    plot(P0(1), P0(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k'); % 원점
    plot(P1(1), P1(2), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');  % 첫 번째 관절 (P1)
    plot(P2(1), P2(2), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');  % 끝점 (P2)

    % 시간 텍스트 표시
    text(-4.5, 4.5, sprintf('Time: %.2fs', t), 'FontSize', 12);

    hold off;

    % 6. 화면을 업데이트하고 잠시 멈춤
    drawnow;
    pause(dt);
end
