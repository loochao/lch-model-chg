function dataplot()

clear;

load h_evolve_0.880000_0.001900.dat;
% Time, units = 1s
t = h_evolve_0_880000_0_001900(:,1);
% Fluence, (Intensity = 30-110 W/cm^2)
% so units for fluence KJ/cm^2
f = t * 90 / 1000;

% sigma/eta = 0.00019
load h_evolve_0.880000_0.000190.dat;
h03 = h_evolve_0_880000_0_000190(:,2);
load h_evolve_0.088000_0.000190.dat;
h13 = h_evolve_0_088000_0_000190(:,2);

% sigma/eta = 0.0019
% h02 means p1/sigma = 0.88, sigma/eta = 0.0019
load h_evolve_0.880000_0.001900.dat;
h02 = h_evolve_0_880000_0_001900(:,2);
load h_evolve_0.088000_0.001900.dat;
h12 = h_evolve_0_088000_0_001900(:,2);
load h_evolve_0.008800_0.001900.dat;
h22 = h_evolve_0_008800_0_001900(:,2);

% sigma/eta = 0.019
load h_evolve_0.880000_0.019000.dat;
h01 = h_evolve_0_880000_0_019000(:,2);
load h_evolve_0.088000_0.019000.dat;
h11 = h_evolve_0_088000_0_019000(:,2);
load h_evolve_0.008800_0.019000.dat;
h21 = h_evolve_0_008800_0_019000(:,2);


hold on;
grid on;
plot(f, abs(h03 - 2)/2, 'k--', 'linewidth', 2);
text(110, 0.14, 'p1/\sigma = 0.88, \sigma/\eta = 0.00019','fontsize', 16, 'fontname', 'Tahoma');
% plot(f, abs(h13 - 2)/2, 'k--', 'linewidth', 1.5);

plot(f, abs(h02 - 2)/2, 'r', 'linewidth', 2);
text(200, 0.335, 'p1/\sigma = 0.88, \sigma/\eta = 0.0019','fontsize', 16, 'fontname', 'Tahoma');
plot(f, abs(h12 - 2)/2, 'r', 'linewidth', 1.5);
text(180, 0.024, 'p1/\sigma = 0.088, \sigma/\eta = 0.0019','fontsize', 16, 'fontname', 'Tahoma');
% plot(f, abs(h22 - 2)/2, 'r', 'linewidth', 1);

% plot(f, abs(h01 - 2)/2, 'g:', 'linewidth', 2);
% plot(f, abs(h11 - 2)/2, 'g:', 'linewidth', 1.5);
% plot(f, abs(h21 - 2)/2, 'g--', 'linewidth', 1);
hold off;
xlabel('Fluence (kJ/cm^2)', 'fontSize', 14, 'fontWeight', 'bold');
ylabel('Max. Grating Amplitude (relative to init height)', 'fontSize', 14, 'fontWeight', 'bold');

set(gca, 'FontSize', 14);
h = gca;
labels = get(h, 'yticklabel');
labels_modif = [num2str(100 * str2num(labels)) ones(length(labels), 1)*'%']
set(h, 'yticklabel', labels_modif);

saveas(gcf, 'h-vs-t', 'png');