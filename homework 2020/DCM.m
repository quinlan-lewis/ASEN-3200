%Quinlan Lewis
%ASEN 3200
%last modified: 8/31/20

clear all; clc;

%declare angles of rotation in rads
% theta = 10*(pi/180); %0*(180/pi);
% phi = 0*(pi/180); %.25*(180/pi);
% psi = 0*(pi/180); %-1.9*(180/pi);

ang1 = 60;
ang2 = 90;
ang3 = 120;
phi = 30;

C_3 = [cosd(ang1) sind(ang1) 0; -sind(ang1) cosd(ang1) 0; 0 0 1];
% C_3_2 = [cosd(ang3) sind(ang3) 0; -sind(ang3) cosd(ang3) 0; 0 0 1];
C_1 = [1 0 0; 0 cosd(ang2) sind(ang2); 0 -sind(ang2) cosd(ang2)];
C_2 = [cosd(phi) 0 -sind(phi); 0 1 0; sind(phi) 0 cosd(phi)];

%declare order of operations for Q matrix
Q = C_1*C_2

%calculate eigenvalues and vectors for finding axis of rotation and angle
%of rotation
[v,d] = eig(Q);
eigenvalues = diag(d);
eigenvectors = v;

%Assigns u hat and u tilda vectors
u_hat = eigenvectors(:,3);
u_tilda = [0 -u_hat(3) u_hat(2); u_hat(3) 0 -u_hat(1); -u_hat(2) u_hat(1) 0];

%find value of rotation angle
phi = angle(eigenvalues(1))*180/pi;

%plug values into euler's theorem to check to see if angle of rotation is
%correct 
E_T = cosd(phi)*eye(3,3) + (1 - cosd(phi))*(u_hat)*(u_hat') - sind(phi)*u_tilda;