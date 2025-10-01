clc; clear; close all;

%% 1. 별의 기본 모양 좌표 생성
n = 5; % 별의 꼭짓점 개수
R = 10; % 큰 원의 반지름
r = 5;  % 작은 원의 반지름

theta_large = linspace(0, 2*pi, n + 1);
theta_small = theta_large + (pi / n);

x_large = R * cos(theta_large);
y_large = R * sin(theta_large);
x_small = r * cos(theta_small);
y_small = r * sin(theta_small);

% 모든 꼭짓점 좌표를 하나의 2x(2n) 행렬로 통합
star_points = zeros(2, 2 * n);
for i = 1:n
    star_points(:, 2*i - 1) = [x_large(i); y_large(i)];
    star_points(:, 2*i)     = [x_small(i); y_small(i)];
end


%% 2. 애니메이션 루프
figure;
hold on;
grid on;
axis equal;
axis([-15 15 -15 15]); % 축 고정
title(sprintf('Pulsating %d-pointed Star', n));

t = 0; % 시간을 조절할 변수
while true % 무한 루프 (Ctrl+C 로 중지)

    % 3. 코사인 함수를 이용해 스케일 값 's'를 0.5 ~ 1.5 사이로 계속 변경
    s = 0.5 * cos(t) + 1;

    % 4. 스케일링 행렬 생성
    S = [s, 0;
         0, s];

    % 5. 행렬 곱셈으로 별의 모든 좌표를 한 번에 변환
    scaled_points = S * star_points;

    % 6. 애니메이션을 위한 그리기
    cla; % 현재 축의 그림을 모두 지움 (clear axis)

    % 크기가 변한 별을 그림 (마지막 점과 첫 점을 연결)
    plot(scaled_points(1, [1:end, 1]), scaled_points(2, [1:end, 1]), 'b-', 'LineWidth', 2);

    drawnow; % 화면 업데이트

    t = t + 0.02; % 시간 증가
end
