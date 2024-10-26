    % part 1
clear all;
close all;
clc;
%%
% Lets assume a pedulum  system with a second order transfer function shown below:
g = 9.81; % m/s^2, gravitational constant
m = 7; %kg, mass
l = 0.4;%m, length
c = 0.5;% Nm/rad, damping coefficient
I=m*(l/2)^2; %moment of inertia
%%
%Implement model as linear transfer function
wn=sqrt(m*g*l/(2*I)); % undamped natural frequency in rad/s
xi=c/(2*I*wn); % damping coefficient
wd=wn*sqrt(1-xi^2); % damped natural frequency in rad/s
tr=1/wd*atan(sqrt(1-xi^2)/xi); % rise time from 10 to 90% of final value
tp=pi/wd; % peak time from application of step
ts=3/(xi*wn); % settling time based on +/-1% tolerance
Mp=100*exp(-xi*wn*tp); % overshoot in %
sprintf('wn = %d rad/s',wn)
sprintf('wd = %d rad/s',wd)
sprintf('xi = %d',xi)
sprintf('tr = %d s',tr)
sprintf('tp = %d s',tp)
sprintf('ts = %d s',ts)
sprintf('Mp = %d %%',Mp)
% calculate the linear plant transfer function
sys = tf(1/I,[1 2*xi*wn wn^2]); % defining the transfer function for the pendulum

%%
figure(1)
% h = stepplot(sys,5) % time domain response to a unit step input for 5s
t = 0:1e-6:5; % specific time vector
h = stepplot(sys,t) % plot to specified t
title('Open loop response to a unit step function - Pendulum - No gain')
%%
figure(2)
pzplot(sys) % pole-zero map
%%
% Bode plot of the open loop transfer function of the pendulum - amplitude
% and phase
% figure(3)
% bode(sys)
%%
% root locus of the open loop transfer function of the pendulum 
% the root locus then plots the frequency response of the closed loop
% system given a gain K
% figure(4)
% rlocus(sys) % for all K
% K = [0 0.1 0.2 10] % specific values of K
% rlocus(sys,K) % root locus for discrete values of K




