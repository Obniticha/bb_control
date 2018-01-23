clc;
clear all;

syms m_s m_w m_b I_s I_b I_w r_s r_b r_w phi phi_dot phi_dotdot theta theta_dot theta_dotdot F t

Parameters;
Langrange; 

q = [phi;theta];
q_dot =[phi_dot; theta_dot];

f=[q_dot;Sol.phi_dotdot; Sol.theta_dotdot];
x=[phi; theta; phi_dot; theta_dot];
u = F;

A_temp=jacobian(f,x);
B_temp=jacobian(f,u); 


A=double(subs(A_temp,[phi theta phi_dot theta_dot F], [0 0 0 0 0]));
B=double(subs(B_temp,[phi theta phi_dot theta_dot F], [0 0 0 0 0]));

%% LQR Regler
%Gewichtungsmatrizen f�r LQR-Regler festlegen

Q = [20 0 0 0; 
        0 100 0 0; 
        0 0 10 0; 
        0 0 0 50];
R = 200;

[K, S, lamda_closed] = lqr(A, B, Q, R);
 
