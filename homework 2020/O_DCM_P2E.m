function T = O_DCM_P2E(W,i,w)

T =  [cos(W)*cos(w) - sin(W)*sin(w)*cos(i)  ,  -cos(W)*sin(w) - sin(W)*cos(i)*cos(w)  ,  sin(W)*sin(i);...
    cos(W)*cos(i)*sin(w) + sin(W)*cos(w)  ,  cos(W)*cos(i)*cos(w) - sin(W)*sin(w)  ,  -cos(W)*sin(i);...
    sin(i)*sin(w),                                           sin(i)*cos(w),                                           cos(i)];

end

