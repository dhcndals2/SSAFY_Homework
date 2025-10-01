% R_z.m
function R = R_z(theta_deg)
  % 입력받은 각도(degree)를 라디안(radian)으로 변환
  theta_rad = deg2rad(theta_deg);

  ct = cos(theta_rad);
  st = sin(theta_rad);

  % Z축 회전 행렬
  R = [ct, -st, 0;
       st,  ct, 0;
       0,   0,  1];
endfunction
