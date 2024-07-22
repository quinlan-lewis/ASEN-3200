function T = O_DCM_E2P(W,i,w)

T =  [cos(W)*cos(w) - sin(W)*sin(w)*cos(i)  ,    sin(W)*cos(w) + cos(W)*cos(i)*sin(w)  ,  sin(i)*sin(w);...
    -cos(W)*sin(w) - sin(W)*cos(i)*cos(w)  ,  -sin(W)*sin(w) + cos(W)*cos(i)*cos(w)  ,  sin(i)*cos(w);...
    sin(W)*sin(i),                                           -cos(W)*sin(i),                                         cos(i)];

end

