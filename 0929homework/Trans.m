% Trans.m
function T = Trans(axis, dist)
  T = eye(4); % 4x4 단위 행렬로 시작
  switch lower(axis)
    case 'x'
      T(1, 4) = dist;
    case 'y'
      T(2, 4) = dist;
    case 'z'
      T(3, 4) = dist;
  end
endfunction
