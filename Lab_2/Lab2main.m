%ASEN 3200: Lab 2 Spinning Spacecraft
%Author: Quinn Lewis, Cesario Garcia, Billy Weigl, Ankrit Upretty
%Last Modified: 9/28/2020

clear all; clc; close all

%constants
d = 22.5/39.37; %[m]
r = d/2;
a_length = 7.5/39.37; %[m]
m = 2.59; %kg
theta = 90; %angle of wheel during rotation

%speeds
s = 1:1:38; %speeds in mph
s = s*(5280*12/(3600*39.37)); %convert speed from mph to m/s

%angular velocity
cir = 2*pi*r; %circumfrance of wheel
omega = s/cir; %angular vel of wheel

%period
T = 2*pi./omega; %period in seconds for wheel

%MOI matrix using hoop as model
I1 = (1/4)*m*r^2;
I2 = I1;
I3 = (1/2)*m*r^2;
I = [I1 0 0; 0 I2 0; 0 0 I3]; 

%precession rate predicted 
phi_dot = (I3/I1).*omega/cos(theta);

%experimental precession rate from period
%data from tests 1-4 in 1st row is period and 2nd row is corresponding speed
%in m/s
%The 'predict' vectors will be used later to determine the error for the
%predicted values against the experimental values of the precession rate
c = (5280*12/(3600*39.37)); %conversion factor from mph to m/s
T1 = [10 8 7 5 3 3; 35*c 30*c 26*c 20*c 14*c 12*c];
predict1 = [phi_dot(35) phi_dot(30) phi_dot(26) phi_dot(20) phi_dot(14) phi_dot(12)];

T2 = [10 8 7 7 6 4; 38*c 30*c 26*c 22*c 20*c 15*c];
predict2 = [phi_dot(38) phi_dot(30) phi_dot(26) phi_dot(22) phi_dot(20) phi_dot(15)];

T3 = [8 8 6 5 5 4; 34*c 30*c 24*c 21*c 18*c 14*c];
predict3 = [phi_dot(34) phi_dot(30) phi_dot(24) phi_dot(21) phi_dot(18) phi_dot(14)];

T4 = [7 6 6 6 5 5 5 4; 26*c 24*c 23*c 21*c 19*c 17*c 15*c 13*c];
predict4 = [phi_dot(26) phi_dot(24) phi_dot(23) phi_dot(21) phi_dot(19) phi_dot(17) phi_dot(15) phi_dot(13)];

omega1 = 2*pi./(T1(1,:));
omega2 = 2*pi./(T2(1,:));
omega3 = 2*pi./(T3(1,:));
omega4 = 2*pi./(T4(1,:));

phi_dot1 = (I3/I1).*omega1/cos(theta);
phi_dot2 = (I3/I1).*omega2/cos(theta);
phi_dot3 = (I3/I1).*omega3/cos(theta);
phi_dot4 = (I3/I1).*omega4/cos(theta);

%plotting spin rate vs. predicted period
figure
hold on

plot(omega,T,'Linewidth',2)

hold off
xlabel('Spin rate in rad/s')
ylabel('Predicted period in seconds')
title('Spin Rate vs. Predicted Period')
legend('Predicted')

%plotting spin rate vs. predicted precession rate
figure
hold on

plot(omega,phi_dot,'Linewidth',2)

hold off
xlabel('Spin rate in rad/s')
ylabel('Predicted precesion rate')
title('Spin Rate vs. Predicted Precession Rate')
legend('Predicted')

%plotting spin rate vs. predicted period with experimental results
figure
hold on

plot(omega,T,'Linewidth',2)
plot(omega1,T1(1,:),'Linewidth',2);
plot(omega2,T2(1,:),'Linewidth',2);
plot(omega3,T3(1,:),'Linewidth',2);
plot(omega4,T4(1,:),'Linewidth',2);

hold off
xlabel('Spin rate in rad/s')
ylabel('Period in seconds')
title('Spin Rate vs. Period')
legend('Predicted','Test 1','Test 2','Test 3','Test 4','Location','northeast')

%plotting spin rate vs. predicted precesion rate with experimental results
figure
hold on

plot(omega,phi_dot,'Linewidth',2)
plot(omega1,phi_dot1,'Linewidth',2)
plot(omega2,phi_dot2,'Linewidth',2)
plot(omega3,phi_dot3,'Linewidth',2)
plot(omega4,phi_dot4,'Linewidth',2)

hold off
xlabel('Spin rate in rad/s')
ylabel('Precesion rate')
title('Spin Rate vs. Precession Rate')
legend('Predicted','Test 1','Test 2','Test 3','Test 4','Location','southwest')

%errors for the predicted values when compared to the experimental ones
e1 = abs((phi_dot1 - predict1)./phi_dot1)/100;
e2 = abs((phi_dot2 - predict2)./phi_dot2)/100;
e3 = abs((phi_dot3 - predict3)./phi_dot3)/100;
e4 = abs((phi_dot4 - predict4)./phi_dot4)/100;
