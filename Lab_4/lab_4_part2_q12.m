%% Natalie Link
% Adam Buencamino | Quinn Lewis | Gina Staimer
% ASEN 3200
% Lab O-1
% Question 11
% November 2, 2020

clear
clc
close all

%% Define Constants
mu = 4903; % gravitational parameter of moon (km^3 / s^2)
P = 6.3 * 3600; % orbital period (s)
a = (((P / (2 * pi)) ^ 2) * mu) ^ (1 / 3); % semimajor axis (km)
n = sqrt(mu / (a ^ 3)); % mean motion

e = 0.587; % eccentricity
b = a * sqrt(1 - (e ^ 2)); % semiminor axis (km)
A0 = a * b * pi; % total area of orbit ellipse

r_p = 1840; % radius of periapsis (km)
r = 2400; % initial spacecraft location (km), moving away from periapsis

A_p = A0 - (r_p * r * pi); % take the convex angle sector since periapsis d/n occur for the first time until after initial
% A_p = r_p * r * pi;

%% Kepler's Equation
% initial: r = 2400 km, away from periapsis
t(1) = 0;
t_p = P * (A_p / A0); % time that periapsis first occurs
% t(1) = P * (A_p / A0);
% t_p = 0;
M(1) = n * (t(1) - t_p); % mean anomaly = mean motion * time since periapsis (negative here)
M(1) = M(1) + (2 * pi);

%% Initial Guess
% 0 < M_e < pi
E(1) = M(1) + (e / 2);
f(1) = E(1) - (e * sin(E(1))) - M(1);
f_prime(1) = 1 - (e * cos(E(1)));
i = 1;

tolerance = 1 * (10 ^ -3);

%% Newton's Method
while abs(f(i) - 0) > tolerance    
    E(i + 1) = E(i) - (f(i) / f_prime(i));
    
    t(i+1) = t(i) + 1;
    M(i+1) = (n * (t(i+1) - t_p)) + (2 * pi);
    f(i+1) = E(i+1) - (e * sin(E(i+1))) - M(i+1);
    f_prime(i+1) = 1 - (e * cos(E(i+1)));
    
    i = i + 1;
end

%% Question 12
t_new = ((13.5 * 60) + t_p);
A_new = (t_new / P) * A0; % backsolve areas from time (Kepler 2) to get radius
r_new = A_new / (r_p * pi);
alt_new = r_new - 1737; % subtract moon radius to get altitude
%alt > 200 && alt < 500