%==========================================================================
% Author: Carl Larsson
% Description: Performs go to goal, avoid obstacle and wall follower
% Date: 2024-04-03
%==========================================================================
%% Clean up
%==========================================================================
clear
close all
clc
%==========================================================================
%% Create map and Initialize
%==========================================================================

% Create map
CreateMaze;
hold on

% Initial pose
xinit=sPos(2);
yinit=sPos(1);
thetainit=0;

% Goal pose
xg=gPos(2);
yg=gPos(1);

% Proportional gain
P = 10;

%Tolerance distance for when to cancel simulation
tol=0.1;

% Velocity
v = 0.1;

% Parameters
l = 0.5;
r = 0.1;

% Define distance for avoid obstacle
D_ao = 1;
% Define distance for follow wall
D_wf = 1.5;

%==========================================================================
%% Perform simulation
%==========================================================================

% Simulation time
SimulationTime=1000;

% Run simulink file
output=sim('differential_drive', SimulationTime);

% View the results
plot(output.xpos, output.ypos)
legend({'Path'})
hold off

%==========================================================================