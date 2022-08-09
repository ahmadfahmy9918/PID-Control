clc
clear

G2 = tf(1.5, [1 2 1.5]);

K = 3.732;
Ti = 2.575;
Td = 0.644;

G1 = tf([Ti*Td*4.5 Ti*4.5 4.5], [1 14 1.5]);
G3 = tf(1, [Ti 0]);


% G5 = conv(G3, G1);

G = K*G3*G1*G2;
G = G/(1+G);

figure;
stepeval(G, 25);
hold on
yline(1);
hold off

figure;
rampeval(G, 25);