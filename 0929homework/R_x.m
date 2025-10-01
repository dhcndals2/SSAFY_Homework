% R_x.m
function R = R_x(phi_deg)
  % 입력받은 각도(degree)를 라디안(radian)으로 변환
  phi_rad = deg2rad(phi_deg);

  cp = cos(phi_rad);
  sp = sin(phi_rad);

  % X축 회전 행렬
  R = [1,  0,   0;
       0, cp, -sp;
       0, sp,  cp];
endfunction
