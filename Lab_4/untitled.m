function E = newtonsMethodForEfunc(n,t,t_p,e,tol)
% =======================================================================%
% Adam Buencamino, Quinn Lewis, Natalie Link, Gina Staimer
% Created: 11/1/20
% Last updated: 11/3/20
% ASEN 3200 Lab O1
%.m file for Applying Newton's Method to find the Eccentric Anomaly given a
% time (in seconds)
% =======================================================================%

%Uses n (mean motion), t (time spent in orbit), t_p (time at periapsis),
% e (eccentricity of the orbit), and tol (tolerance required to find estimated E value) to find the Mean
%Anomaly at the inputted time using Newton's method
%% Setting up initial guess (E_i) for newton's method
M_e = n * ( t - t_p );

if (M_e < pi)
    E_i = M_e + e/2;
else
    E_i = M_e - e/2;
end

%% Newton's Method

fE = E_i - e*sin(E_i) - M_e; %Plug guess into M_e equation
fEprime = 1 - e*cos(E_i); %Plug guess into derivative of above equation
ratio = fE/fEprime; %ratio of the function over its derivative

while (abs(ratio) > tol)
    fE = E_i - e*sin(E_i) - M_e; %Plug guess into M_e equation
    fEprime = 1 - e*cos(E_i); %Plug guess into derivative of above equation
    ratio = fE/fEprime; %ratio of the function over its derivative
    
    E_i = E_i - ratio; %solve for knew guess
    %display('iteration!')
end

E = E_i; %final estimated Eccentric Anomaly
end

