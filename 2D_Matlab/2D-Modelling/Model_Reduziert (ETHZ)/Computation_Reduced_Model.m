%% Clean-up Workspace
clc;
clear all;

%% Load Model Parameter
%ETHZ = 1
%Twente = 2
%Group = 3
Parameter_flag = 3; 

syms phi_z phi_z_dot phi_x phi_x_dot phi_y phi_y_dot theta_z theta_z_dot theta_x theta_x_dot theta_y theta_y_dot T_x T_y T_z T_f 

if Parameter_flag == 1
    Parameters_ETHZ
elseif Parameter_flag == 2
    Parameters_Twente
elseif Parameter_flag == 3
    Parameters_Group
end

%% Arbeitspunkte
% Arbeitspunkte
x_AP = [0;0;0];
T_x_AP=0;
T_y_AP=0;
T_z_AP=0;

% Anfangsbedingungen
x_0_yz =[0 0 0];
x_0_xz =[0 0 0];
x_0_xy =[0 0 0];

%% Compute Model
Systemdesign_YZ_Reduced;
Systemdesign_XZ_Reduced;
Systemdesign_XY_Reduced;
