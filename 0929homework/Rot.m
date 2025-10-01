% Rot.m
function R = Rot(axis, angle_deg)
  angle_rad = deg2rad(angle_deg); % 각도를 라디안으로 변환
  c = cos(angle_rad);
  s = sin(angle_rad);
  R = eye(4); % 4x4 단위 행렬로 시작

  switch lower(axis)
    case 'x'
      R(2:3, 2:3) = [c, -s; s, c];
    case 'y'
      R([1,3], [1,3]) = [c, s; -s, c];
    case 'z'
      R(1:2, 1:2) = [c, -s; s, c];
  end
endfunction
