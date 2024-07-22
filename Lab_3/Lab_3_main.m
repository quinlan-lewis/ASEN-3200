%ASEN 3200: Lab 3 Spacecraft Pitch Axis Control
%Author: Quinn Lewis, Cesario Garcia, Billy Weigl, Ankrit Upretty
%Last Modified: 10/18/2020

%% Housekeeping
clear; clc; close all;

%loading in given experimental data 
data_P15_D0 = load('Unit7_A3_15_0');
data_P25_D0 = load('Unit7_A3_25_0');

%% Calculated gain values and plotting experimental
%calculated gain values and moment of inertia
I = .007403155215393;
K1 = 11.4135*I;
K2 = 3.9943*I;
K1_form = K1*1000;
K2_form = K2*1000;

%creating time step response from given transfer function
num = K1/I;
den = [1 K2/I K1/I];
sys = tf(num,den)
stepamp = 0.5;
opt = stepDataOptions('StepAmplitude',stepamp);
[x,t] = step(sys,opt);
figure()
plot(t,x)
hold on 
yline(0.5); yline(.45,'--r'); yline(0.55,'r--'); xline(1.50,'--r')
title('Calculated Gain Values')
legend('Expected Response','Reference Angle','10% undershoot','10% overshoot','Setttling Time','Location','Southeast')
xlabel('Time(s)')
ylabel('Angle(rad)')

%% Plotting the experimental values
%loading in experimental data that was made using our calculated gain
%values
data_exp = load('group_20_section_013');
data_exp = data_exp(201:600,:);

ref_pos = data_exp(:,3);
time = (data_exp(:,1) - data_exp(1,1))/1000;

figure(); hold on;
plot(time,ref_pos);
yline(0.5); yline(.45,'--r'); yline(0.55,'r--');
xlabel('Time(s)')
ylabel('Angle(rad)')
title('Experimental Results')
legend('Experimental Response','Reference Angle','10% undershoot','10% overshoot','Location','Southeast')

%% Calculating torque
%using torque constant given to us as well as the current recorded from the
%experimental data
T_const = 33.5; %[mNm/A]
current = data_exp(:,4);
T = T_const*current/1000;

figure()
plot(time,T)
xlabel('Time(s)')
ylabel('Torque(N)')
title('Torque vs. Time')

%% Calculating plots with Integral gain
%using the shown gain values in video for task 7
K1 = 75/1000;
K2 = 25/1000;
K3 = [0 10 20 25]/1000; %in video they use 0, 10, 20, 25

figure(); hold on;
for i = 1:length(K3)
    num = [K1/I K3(i)/I];
    den = [1 K2/I K1/I K3(i)/I];
    sys = tf(num,den)
    stepamp = 0.5;
    opt = stepDataOptions('StepAmplitude',stepamp);
    [x,t] = step(sys,opt);
    plot(t,x)
end
plot(t,x)
yline(0.5); yline(.45,'--r'); yline(0.55,'r--'); xline(1.50,'--r')
legend('K3 = 0','K3 = 10','K3 = 20','K3 = 25','Location','Southeast')
xlabel('Time(s)'); ylabel('Angle(rad)')
title('Model with Integral Gains')
