clc; clear; close all;

% A. 초기 사각형 (변 5) – 꼭짓점 행렬 (닫힘 위해 첫 점 반복)
L0 = 5;
P  = [0 5 5 0 0;   % x
      0 0 5 5 0];  % y   (2x5)

% B. 스케일 계수 s: 처음 1에서 매 단계 0.95배
s = 1;  decay = 0.95;

figure; hold on; grid on; box on; axis equal
xlim([-6 6]); ylim([-6 6]);
title('Shrinking Squares'); xlabel('x'); ylabel('y');

% C, D. 매 단계 행렬 S = sI 적용 후 그리기, 변 길이 <= 0.5면 종료
while L0 * s > 0.5
    S = [s 0; 0 s];     % 스케일링 행렬
    Q = S * P;          % 꼭짓점 변환 (행렬 연산)

    plot(Q(1,:), Q(2,:), 'k-', 'LineWidth', 1);  % 꼭짓점 순서대로 연결
    drawnow; pause(0.02);

    s = s * decay;      % 다음 단계로 축소
end

