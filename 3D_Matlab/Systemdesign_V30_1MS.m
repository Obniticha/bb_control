%
%
%
%
clc;
clear all;

%% Static parameters
%
%   contains all kinds of static parameters needed for dynamic calculus
%
%-------------------------------------------------------------------------

%Time 
syms t;

%Radius of the ball
r_B = 0.07;
%syms r_B;

%Radius of the omniwheel
r_W = 0.03;
%syms r_W;

%Radius of the Body A
r_A = 0.00703;
syms r_A;

%Distance between the center of the ball and the center of gravity of the
%body
l = 0.24045;

%Mass of the body
m_A = 1.646;

%Mass of one omniwheel including motor
m_W = 0.118;

%Mass of the body and omniwheels
m_AW = 1.764;

%Mass of the ball
m_B = 0.4;

%Inertia of the body and the omniwheels referenced to frame A (SolidEdge)
A_Theta_AW = [0.020, 0, 0 ; 0, 0.005, -0.001 ; 0, 0, 0.019];

%Inertia of the ball reference to frame I (Solid Edge)
I_Theta_B = [0.00195, 0, 0 ; 0, 0.00195 0 ; 0, 0, 0.00195];

%Inertia of an omniwheel and motor about the motor axis (Calculation and Assumption)
%
%Mit Florian abkl�ren ob richtig
%
Theta_W = 0.16656;

%Angles that describe the motor position referenced to frame A
alpha_W = pi/4;
beta_W1 = 0;
beta_W2 = 2/3*pi;
beta_W3 = 4/3*pi;

%Rotational speed vector of the ball referenced to frame L
syms phi_x(t) phi_y(t) phi_x_dot(t) phi_y_dot(t);
L_Omega_B(t) = [phi_x_dot(t) ; phi_y_dot(t); 0];

%Rotational speed of the omniwheels about the motor axis referenced
%to frame A
syms psi_1_dot(t) psi_2_dot(t) psi_3_dot(t);
A_omega_W1(t) = psi_1_dot(t);
A_omega_W2(t) = psi_2_dot(t);
A_omega_W3(t) = psi_3_dot(t);

%Gravity vector referenced to frame I
I_G = [0 ; 0 ; -9.81];


%% Minimal coordinates
%
%   
%
%-------------------------------------------------------------------------
syms theta_x(t) theta_y(t) theta_z(t);
syms theta_x_dot(t) theta_y_dot(t) theta_z_dot(t);
q = [theta_x(t) ; theta_y(t) ; theta_z(t) ; phi_x(t) ; phi_y(t)];
q_dot = [theta_x_dot(t) ; theta_y_dot(t) ; theta_z_dot(t) ; phi_x_dot(t) ; phi_y_dot(t)];


% %% Rotation matrices (I - L - A)
% %
% %   
% %
% %-------------------------------------------------------------------------
% 
% %Rotation around the x-axis
% R_x = [1, 0, 0 ;
%        0, cos(theta_x(t)), -sin(theta_x(t)) ;
%        0, sin(theta_x(t)), cos(theta_x(t))];
%    
% %Rotation around the y-axis
% R_y = [cos(theta_y(t)), 0, sin(theta_y(t)) ;
%        0, 1, 0 ;
%        -sin(theta_y(t)), 0, cos(theta_y(t))];
%    
% %Rotation around the z-axis
% R_z = [cos(theta_z(t)), -sin(theta_z(t)), 0 ;
%        sin(theta_z(t)), cos(theta_z(t)), 0 ;
%        0, 0, 1];
%    
% %Transformation from I to L and vice versa
% R_IL = R_z;
% R_LI = inv(R_z);
% 
% %Transformation from I to A and vice versa
% R_IA = R_z*R_y*R_x;
% R_AI = inv(R_IA);
% 
% %Transformation form L to A and vice versa
% R_LA = R_y*R_x;
% R_AL = inv(R_LA);
% 
% %% Rotational dynamics
% %
% %   
% %
% %-------------------------------------------------------------------------
% %Rotation of the ball referenced to I
% %Changed from R_LI to R_IL
% I_Omega_B(t) = R_IL*L_Omega_B(t);
% 
% %Jacobian Matrix
% J = [1, 0, -sin(theta_y(t)) ;
%      0, cos(theta_x(t)), sin(theta_x(t))*cos(theta_y(t)) ; 
%      0, -sin(theta_x(t)), cos(theta_x(t))*cos(theta_y(t))];
%  
% %Derivative of the Tait-Bryan angles
% Theta_dot(t) = [theta_x_dot(t) ; theta_y_dot(t) ; theta_z_dot(t)];
% 
% %Rotation of the body referenced to frame A
% A_Omega_A(t) = simplify(J*Theta_dot(t));
% 
% 
% %% Omniwheel equations needed for binding equations
% %
% %   
% %
% %-------------------------------------------------------------------------
% 
% %Rotational vector from the intersection of the motor asis M to the center point of
% %each wheel 
% A_R_MW1 = [cos(beta_W1)*sin(alpha_W) ; sin(alpha_W)*sin(beta_W1) ; -cos(alpha_W)];
% A_R_MW2 = [cos(beta_W2)*sin(alpha_W) ; sin(alpha_W)*sin(beta_W2) ; -cos(alpha_W)];
% A_R_MW3 = [cos(beta_W3)*sin(alpha_W) ; sin(alpha_W)*sin(beta_W3) ; -cos(alpha_W)];
% 
% %Translational vector from the center of the ball to each contactpoint
% %with each omniwheel referenced to frame A
% A_T_PK1 = [r_B*sin(alpha_W)*cos(beta_W1) ; r_B*sin(alpha_W)*sin(beta_W1) ; r_B*cos(alpha_W)];
% A_T_PK2 = [r_B*sin(alpha_W)*cos(beta_W2) ; r_B*sin(alpha_W)*sin(beta_W2) ; r_B*cos(alpha_W)];
% A_T_PK3 = [r_B*sin(alpha_W)*cos(beta_W3) ; r_B*sin(alpha_W)*sin(beta_W3) ; r_B*cos(alpha_W)];
% 
% %Translational vector from the center of the ball P to the center of gravity
% %G of the body referenced to frame A
% A_T_PG = [0 ; 0 ; 1];
% 
% 
% %Absolute rotation speed of each omniwheel about the motor axis referenced
% %to frame A
% A_Omega_W1(t) = simplify(A_omega_W1(t) + dot(A_R_MW1,A_Omega_A(t)));
% A_Omega_W2(t) = simplify(A_omega_W2(t) + dot(A_R_MW2,A_Omega_A(t)));
% A_Omega_W3(t) = simplify(A_omega_W3(t) + dot(A_R_MW3,A_Omega_A(t)))
% 
% 
% %Direction of the tangential speed of the rotation of each wheel referenced
% %to frame A
% A_vt_W1 = [-sin(beta_W1) ; cos(beta_W1) ; 0];
% A_vt_W2 = [-sin(beta_W2) ; cos(beta_W2) ; 0];
% A_vt_W3 = [-sin(beta_W3) ; cos(beta_W3) ; 0];
% 
% 
% %% Ball equations needed for binding equations
% %
% %   
% %
% %-------------------------------------------------------------------------
% 
% %Rotaional speed of the ball relative to the body A referenced to frame A
% %
% %Simplification needed
% %has to  be R_LA
% A_Omega_B(t) = R_AL*L_Omega_B(t) - A_Omega_A(t);
% %A_Omega_B(t) = R_AI*L_Omega_B(t) - A_Omega_A(t);
% 
% 
% 
% %% Binding equations regarding the ball and the omniwheels
% %
% %   
% %
% %-------------------------------------------------------------------------
% 
% %The speed of the surface of the ball has to match each tangetial omniwheel
% %speed, therefore three equations evolve
% 
% %E_1 = dot(cross(A_Omega_B , A_T_PK1),A_vt_W1) == A_omega_W1*r_W;
% E_1_precalc = cross(A_Omega_B(t) , A_T_PK1);
% %E_1 = E_1_precalc(2) == A_omega_W1*r_W;
% E_2_precalc = cross(A_Omega_B(t) , A_T_PK2);
% %E_2 = -E_2_precalc(1)*0.866 - 0.5*E_2_precalc(2) == A_omega_W2*r_W
% E_2_new = simplify(-E_2_precalc(1)*0.866 - 0.5*E_2_precalc(2));
% E_3_precalc = cross(A_Omega_B(t) , A_T_PK3);
% 
% 
% A_omega_W1(t) = (E_2_precalc(2))/r_W;
% A_Omega_W1(t) = simplify(A_omega_W1(t) + dot(A_R_MW1,A_Omega_A(t)));
% 
% A_omega_W2(t) = (-0.866*E_2_precalc(1) - 0.5*E_2_precalc(2))/r_W;
% A_Omega_W2(t) = simplify(A_omega_W2(t) + dot(A_R_MW2,A_Omega_A(t)));
% 
% A_omega_W3(t) = simplify((0.866*E_3_precalc(1) - 0.5*E_3_precalc(2))/r_W);
% A_Omega_W3(t) = simplify(A_omega_W3(t) + dot(A_R_MW3,A_Omega_A(t)));
% 
% %data readout from A_omega_Wi
% JT1 = [-((2^(1/2)*r_B*(-1))/4)/r_W ; -(2^(1/2)*r_B*(2^(1/2)*r_B*(sin(theta_x(t))))/4)/r_W ; -((2^(1/2)*r_B*(+ (cos(theta_y(t)))/(cos(theta_y(t))^2 + sin(theta_y(t))^2)))/2 + (cos(theta_x(t))*sin(theta_y(t)))/(cos(theta_x(t))^2*cos(theta_y(t))^2 + cos(theta_x(t))^2*sin(theta_y(t))^2 + cos(theta_y(t))^2*sin(theta_x(t))^2 + sin(theta_x(t))^2*sin(theta_y(t)))/4)/r_W ; -((2^(1/2)*r_B*(+ (2^(1/2)*r_B*(sin(theta_x(t))))/4)))/r_W ; -((2^(1/2)*r_B*(- (sin(theta_x(t)))/(cos(theta_x(t))^2 + sin(theta_x(t))^2)))/4)/r_W];
% A_omega_W1(t) = JT1.' * q_dot;
% 
% JT2 = [-(2^(1/2)*r_B/4)/r_W ; ((433*2^(1/2)*r_B*( cos(theta_x(t))))/1000 + (2^(1/2)*r_B*( sin(theta_x(t))))/8 + (433*2^(1/2)*3^(1/2)*r_B*(sin(theta_x(t))))/2000)/r_W ; ((2^(1/2)*r_B*( sin(theta_y(t))))/4 + (433*2^(1/2)*r_B*( cos(theta_y(t))*sin(theta_x(t))))/1000 + (2^(1/2)*r_B*(- cos(theta_x(t))*cos(theta_y(t))))/8 + (433*2^(1/2)*3^(1/2)*r_B*(-cos(theta_x(t))*cos(theta_y(t))))/2000)/r_W ; ((2^(1/2)*r_B*((cos(theta_y(t)))/(cos(theta_y(t))^2 + sin(theta_y(t))^2)))/4 +(433*2^(1/2)*r_B*(- (sin(theta_x(t))*sin(theta_y(t)))/(cos(theta_x(t))^2*cos(theta_y(t))^2 + cos(theta_x(t))^2*sin(theta_y(t))^2 + cos(theta_y(t))^2*sin(theta_x(t))^2 + sin(theta_x(t))^2*sin(theta_y(t))^2)))/1000 + (2^(1/2)*r_B*( (cos(theta_x(t))*sin(theta_y(t)))/(cos(theta_x(t))^2*cos(theta_y(t))^2 + cos(theta_x(t))^2*sin(theta_y(t))^2 + cos(theta_y(t))^2*sin(theta_x(t))^2 + sin(theta_x(t))^2*sin(theta_y(t))^2)))/8 + (433*2^(1/2)*3^(1/2)*r_B*(+ (cos(theta_x(t))*sin(theta_y(t)))/(cos(theta_x(t))^2*cos(theta_y(t))^2 + cos(theta_x(t))^2*sin(theta_y(t))^2 + cos(theta_y(t))^2*sin(theta_x(t))^2 + sin(theta_x(t))^2*sin(theta_y(t))^2)))/2000)/r_W ; ((433*2^(1/2)*r_B*(- (cos(theta_x(t)))/(cos(theta_x(t))^2 + sin(theta_x(t))^2)))/1000 + (2^(1/2)*r_B*(- (sin(theta_x(t)))/(cos(theta_x(t))^2 + sin(theta_x(t))^2)))/8 + (433*2^(1/2)*3^(1/2)*r_B*(- (sin(theta_x(t)))/(cos(theta_x(t))^2 + sin(theta_x(t))^2)))/2000)/r_W];
% A_omega_W2(t) = JT2.' * q_dot;
% 
% JT3 = [(2^(1/2)*r_B*(- 500))/(2000*r_W) ; (2^(1/2)*r_B*(- 866*cos(theta_x(t)) + 250*sin(theta_x(t)) + 433*3^(1/2)*sin(theta_x(t))))/(2000*r_W) ; (2^(1/2)*r_B*(+ 500*sin(theta_y(t)) - 250*cos(theta_x(t))*cos(theta_y(t)) - 866*cos(theta_y(t))*sin(theta_x(t)) - 433*3^(1/2)*cos(theta_x(t))*cos(theta_y(t))))/(2000*r_W) ; (2^(1/2)*r_B*(500*cos(theta_y(t)) + 250*cos(theta_x(t))*sin(theta_y(t)) + 866*sin(theta_x(t))*sin(theta_y(t)) + 433*3^(1/2)*cos(theta_x(t))*sin(theta_y(t))))/(2000*r_W) ; (2^(1/2)*r_B*(866*cos(theta_x(t)) - 250*sin(theta_x(t)) - 433*3^(1/2)*sin(theta_x(t))))/(2000*r_W)];
% A_omega_W3(t) = JT3.' * q_dot;
% 
% 
% %% Ball equations
% %
% %   
% %
% %-------------------------------------------------------------------------
% 
% %Vector from the ground to the center of the ball P referenced to frame I
% T_BP = [0 ; 0 ; r_B];
% 
% %Speed vector of the Ball in point P referenced to frame I
% v_B = simplify(cross(I_Omega_B(t), T_BP));
% 
% 
% %% Energies
% %
% %   
% %
% %-------------------------------------------------------------------------
% 
% %
% %
% %Ball 
% %
% %kinetic energy 
% Kin_B = simplify(1/2 * m_B * v_B.' * v_B + 1/2 * L_Omega_B(t).' * I_Theta_B * L_Omega_B(t));
% %potential energy
% Pot_B = 0;
% 
% 
% %
% %
% %Body A
% %
% %kinetic energy
% Kin_A = simplify(1/2 * m_AW * v_B.' * v_B + m_AW * (R_IA*v_B).' * (cross(A_Omega_A(t), A_T_PG)) + 1/2 * A_Omega_A(t).' * A_Theta_AW * A_Omega_A(t));
% %potential energy
% Pot_A = simplify(-m_AW * (R_IA * I_G).' * A_T_PG);
% 
% 
% %
% %
% %Wheels
% %
% %kin energy of each wheel
% Kin_W1 = simplify(1/2 * Theta_W * A_Omega_W1(t) * A_Omega_W1(t));
% Kin_W2 = simplify(1/2 * Theta_W * A_Omega_W1(t) * A_Omega_W2(t));
% Kin_W3 = simplify(1/2 * Theta_W * A_Omega_W1(t) * A_Omega_W3(t));
% 
% 
% 
% %% Non-potential forces
% %
% %   
% %
% %-------------------------------------------------------------------------
% syms T1(t) T2(t) T3(t);
% 
% %Counter torques
% %TC1 = A_R_MW1*(-T1)
% %TC2 = A_R_MW2*(-T2);
% %TC3 = A_R_MW3*(-T3);
% 
% %final equation
% f_NP(t) = simplify((JT1*T1(t) + JT2*T2(t) + JT3*T3(t)).')
% 
% 
% %% equation of motion
% %
% %   
% %
% %-------------------------------------------------------------------------
% 
% %Total kinetic energy
% Kin_total(t) = simplify(Kin_A + Kin_B + Kin_W1 + Kin_W2 + Kin_W3);
% 
% %Total potential energy
% Pot_total(t) = simplify(Pot_A + Pot_B);
% 
% %Langrange II
% L1(t) = simplify(jacobian(Kin_total(t),q_dot))
% L2(t) = simplify(jacobian(Kin_total(t),q))
% L3(t) = simplify(jacobian(Pot_total(t),q))
% 
% %syms theta_x(t) theta_x_dot(t) theta_y(t) theta_y_dot(t) theta_z(t) theta_z_dot(t) phi_x(t) phi_x_dot(t) phi_y(t) phi_y_dot(t) T1(t) T2(t) T3(t);
% L1_t = subs(L1(t) , {theta_x(t),theta_x_dot(t),theta_y(t),theta_y_dot(t),theta_z(t),theta_z_dot(t),phi_x(t),phi_x_dot(t),phi_y(t),phi_y_dot(t)} , {'theta_x(t)','theta_x_dot(t)','theta_y(t)','theta_y_dot(t)','theta_z(t)','theta_z_dot(t)','phi_x(t)','phi_x_dot(t)','phi_y(t)','phi_y_dot(t)'});
% 
% L1_dt = diff(L1_t,t)
% 
% syms theta_x_dotdot(t) theta_y_dotdot(t) theta_z_dotdot(t) phi_x_dotdot(t) phi_y_dotdot(t) theta_x_dotdot theta_y_dotdot theta_z_dotdot phi_x_dotdot phi_y_dotdot;
% 
% varList_dotdot = [theta_x_dotdot,theta_y_dotdot,theta_z_dotdot,phi_x_dotdot,phi_y_dotdot];
% 
% varList_t = {'theta_x(t)','theta_x_dot(t)','theta_y(t)','theta_y_dot(t)','theta_z(t)','theta_z_dot(t)','phi_x(t)','phi_x_dot(t)','phi_y(t)','phi_y_dot(t)','diff(theta_x_dot(t),t)','diff(theta_y_dot(t),t)','diff(theta_z_dot(t),t)','diff(phi_x_dot(t),t)','diff(phi_y_dot(t),t)'};
% varList_ot = {theta_x,theta_x_dot,theta_y,theta_y_dot,theta_z,theta_z_dot,phi_x,phi_x_dot,phi_y,phi_y_dot,theta_x_dotdot,theta_y_dotdot,theta_z_dotdot,phi_x_dotdot,phi_y_dotdot};
% L1_dt = subs(L1_dt,varList_t,varList_ot);
% 
% 
% % fid = fopen('L1_dt.txt', 'wt');
% % fprintf(fid, '%s\n', char(L1_dt));
% % fclose(fid);
% % fid = fopen('L2.txt', 'wt');
% % fprintf(fid, '%s\n', char(L2));
% % fclose(fid);
% % fid = fopen('L3.txt', 'wt');
% % fprintf(fid, '%s\n', char(L3));
% % fclose(fid);
% % fid = fopen('f_NP.txt', 'wt');
% % fprintf(fid, '%s\n', char(f_NP));
% % fclose(fid);
% 
% 
% 
% 
% EQ_Lagrange = simplify(L1_dt - L2 + L3) == f_NP;
% 
% fid = fopen('EQ_Lagrange.txt', 'wt');
% fprintf(fid, '%s\n', char(EQ_Lagrange(1)));
% fclose(fid);
% 
% [theta_x_dotdot,theta_y_dotdot,theta_z_dotdot,phi_x_dotdot,phi_y_dotdot] = solve([EQ_Lagrange(1),EQ_Lagrange(2),EQ_Lagrange(3),EQ_Lagrange(4),EQ_Lagrange(5)],varList_dotdot)
% 
% syms x y;
% f(x,y) = x + y == 2;
% g(x,y) = x - y == 0;
% [x,y] = solve([f(x,y),g(x,y)],[x,y])
% 
% fid = fopen('theta_x_dotdot.txt', 'wt');
% fprintf(fid, '%s\n', char(theta_x_dotdot));
% fclose(fid);
% 
% fid = fopen('theta_y_dotdot.txt', 'wt');
% fprintf(fid, '%s\n', char(theta_y_dotdot));
% fclose(fid);
% 
% fid = fopen('theta_z_dotdot.txt', 'wt');
% fprintf(fid, '%s\n', char(theta_z_dotdot));
% fclose(fid);
% 
% fid = fopen('phi_x_dotdot.txt', 'wt');
% fprintf(fid, '%s\n', char(phi_x_dotdot));
% fclose(fid);
% 
% fid = fopen('phi_y_dotdot.txt', 'wt');
% fprintf(fid, '%s\n', char(phi_y_dotdot));
% fclose(fid);
% 
% 
% 
% 
% 
% 
% 