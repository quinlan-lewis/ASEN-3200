clear; clc; close

syms wx wy wz t

I = [1000 0 -300; 0 1000 500; -300 500 1000];
w = [wx; wy; wz];
H = I*w == 1000*w

I = [10 0 0; 0 20 0; 0 0 30];
w = [2*t^2; 4; 3*t];
H = I*w
