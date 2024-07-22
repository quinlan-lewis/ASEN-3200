% =======================================================================%
% Adam Buencamino, Quinn Lewis, Natalie Link, Gina Staimer
% Created: 11/3/20
% Last updated: 11/3/20
% ASEN 3200 Lab O1
% .m Script applying Gibb's Method 
% =======================================================================%


%% Housekeeping 
clear
clc
close all

%% Constants
mu_sun = (1.32712440018e20) * (1/1000)^3 ; %km^3/s^2

%% 3 Vectors at seperate times

r1 = [0.5887; -0.2206 ; 0.0239] * (1.496e8); %km
r2 = [0.5027; 0.2289; 0.0436]* (1.496e8); %km
r3 = [0.3243; 0.4560 ; 0.0453]* (1.496e8); %km

%% Check if Coplanar Vectors

alpha = 90 - acosd(  (dot( r1, (cross(r2,r3)) ))/ ( norm(r1) * norm(cross(r2,r3)) )  );
%about zero so coplanar
cc = cross(r1, r2);
check = dot(cc,r3); 

%% Creating N, D, S, B

D = cross(r1,r2) + cross(r2,r3) + cross(r3,r1);
N = norm(r1)*cross(r2,r3) + norm(r2)*cross(r3,r1) + norm(r3)*cross(r1,r2);
S = (norm(r2) - norm(r3))*r1 + (norm(r3) - norm(r1))*r2 + (norm(r1) - norm(r2))*r3;
B = cross(D,r2);

%% Middle Velocity Vecotr Estimation

%v2 = (1/norm(r2)) * sqrt( mu_sun / (norm(N) * norm(D)) ) * B + sqrt( mu_sun / (norm(N) * norm(D)) ) * S
v2 = sqrt( mu_sun / (norm(N) * norm(D)) ) * ( cross(D,r2)/norm(r2) + S  );

%% State Vector

x2 = [r2, v2];








