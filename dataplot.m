function dataplot()

clear;

load h_evolve_0.880000_0.001900.dat;
h_dot88 = h_evolve_0_880000_0_001900(:,2);
t = h_evolve_0_880000_0_001900(:,1);
load h_evolve_0.088000_0.001900.dat;
h_dot088 = h_evolve_0_088000_0_001900(:,2);
load h_evolve_0.008800_0.001900.dat;
h_dot0088 = h_evolve_0_008800_0_001900(:,2);

hold on;
plot(t, abs(h_dot88 - 2), 'r', 'linewidth', 1.5);
plot(t, abs(h_dot088 - 2), 'k', 'linewidth', 1.5);
% plot(t, abs(h_dot0088 - 2), 'k', 'linewidth', 1.5);
hold off; 