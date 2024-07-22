clear; clc; close all

pt1 = [10 1 1 1]';
pt2 = [10 -1 -1 -1]';
pt3 = [8 4 -4 4]';
pt4 = [8 -2 2 -2]';
pt5 = [12 3 -3 -3]';
pt6 = [12 -3 3 3]';
pts = [pt1 pt2 pt3 pt4 pt5 pt6]';

m = 10 + 10 + 8 + 8 + 12 + 12;

for i = 2:4
   CM(i) = (pt1(1)*pt1(i) + pt2(1)*pt2(i) + pt3(1)*pt3(i) + pt4(1)*pt4(i) + pt5(1)*pt5(i) + pt6(1)*pt6(i))/m; 
end

I = zeros(3,3);

%below is creating the matrix using the parallel axis theorem
for i = 1:6
      r = pts(i,:) - CM;
      Ix = r(1)*(r(3)^2 + r(4)^2);
      Iy = r(1)*(r(2)^2 + r(4)^2);
      Iz = r(1)*(r(2)^2 + r(3)^2);
      Ixy = -r(1)*r(2)*r(3);
      Iyz = -r(1)*r(3)*r(4);
      Ixz = -r(1)*r(2)*r(4);
      temp = [Ix Ixy Ixz; Ixy Iy Iyz; Ixz Iyz Iz];
      I = I + temp;
end

%below is calculating the I matrix about the CM
Io = zeros(3,3);
for i = 1:6
      r = pts(i,:);
      Ix = r(1)*(r(3)^2 + r(4)^2);
      Iy = r(1)*(r(2)^2 + r(4)^2);
      Iz = r(1)*(r(2)^2 + r(3)^2);
      Ixy = -r(1)*r(2)*r(3);
      Iyz = -r(1)*r(3)*r(4);
      Ixz = -r(1)*r(2)*r(4);
      temp = [Ix Ixy Ixz; Ixy Iy Iyz; Ixz Iyz Iz];
      Io = Io + temp;
end

u = [1 2 2];
u_hat = u/norm(u);
Ia = u_hat*Io*u_hat';

%below is question 9.9
syms theta
I0 = [0 0 0; 0 1 0; 0 0 1];
CG = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
Ig = CG*I0*CG';

%below is question 4 which adds onto code already completed for question
%9.7
[v,d] = eig(I);
eigenvalues = diag(d);
eigenvectors = v;

C = [v(:,3)';v(:,2)';v(:,1)'];
I_eig = C*I*C';
Check = C'*I_eig*C;


