
%% Plane XY 

q_xy=[phi_z; theta_z];
q_xy_dot=[phi_z_dot;  theta_z_dot];

x_xy=[theta_z, phi_z_dot theta_z_dot];
u_xy=T_z;
 
T_f=-((r_s*r_w*I_b_xy*sin(alpha)*T_z)/(r_w^2*I_b_xy+r_s^2*I_w_xy*sin(alpha)^2));

f_xy = [theta_z_dot;
        -(((r_w^2*I_b_xy+r_s^2*I_w_xy*sin(alpha)^2)*T_f+r_s*r_w*I_b_xy*sin(alpha)*T_z)/(r_w^2*I_b_xy*I_s + r_s^2*(I_b_yz + I_s)*I_w_xy*sin(alpha)^2));
        -((r_s*sin(alpha)*(r_s*I_w_xy*sin(alpha)*T_f +r_w*I_s*T_z))/(r_w^2*I_b_xy*I_s+r_s^2*(I_b_xy+I_s)*I_w_xy*sin(alpha)^2))];


%% Plane XY - Linearisierung
A_xy_temp=jacobian(f_xy,x_xy);
B_xy_temp=jacobian(f_xy,u_xy);

A_xy=double(subs(A_xy_temp,[x_xy; u_xy],[0; 0; 0; 0]));
B_xy=double(subs(B_xy_temp,[x_xy; u_xy],[0; 0; 0; 0]));


C_xy=eye(3);
D_xy=[0;0;0];



%Eigenwerte der Systemmatrix berechnen
[lambda_xy]=eig(A_xy);

%Steuer- und Beobachtbarkeit �berpr�fen
M_S_xy = ctrb(A_xy,B_xy);
M_B_xy = obsv(A_xy,C_xy);

rank_S_xy = rank(M_S_xy);
rank_B_xy = rank(M_B_xy);


 %% Auslegen P-Regler f�r theta_z
 T_sampl= 0.007;
% syms k
k_s=vpa(f_xy(end,1),4); 
k_s=double(subs(k_s,T_z,1));
T_1=T_sampl/2;
T_r = T_1*10; 
 
%  
G_reg = tf([T_r 1],[T_1 1]);
G_s = tf([k_s],[1 0 0]);
%  
F_o = G_reg*G_s;
%  
F_w = F_o/(1+F_o);
%  
rlocus(F_o);
%  
%  %--> Gain 3.08e08
k_reg = 10;
%  
 b0 = k_reg*(T_r/T_sampl);
 b1 = k_reg*(-1-(2*T_1/T_sampl));
 b2 = k_reg*(1+T_1/T_sampl);
  
 

 
 
 
 
 