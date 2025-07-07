close all; clear; clc;
% num = 1043.19;
% den = [1, 0, -623.956];

% sys = tf(num, den);

% 定义新的传递函数参数
% num = 1200 * 7.14 * [1, 4.73]; % 分子系数
% den1 = [1, 0]; % s
% den2 = [1, 5]; % s + 5
% den3 = [1, 20]; % s + 20
% den4 = [1, 33.78]; % s + 33.78

% 计算分母的完整多项式系数
% den = conv(conv(conv(den1, den2), den3), den4);

num = 8.49 * 12479.1 * [1, 61.931];
den = conv([1, 0, -623.956], [1, 525.94]);
sys = tf(num, den);
% 根轨迹
figure(1)
rlocus(sys);

% 阶跃响应
figure(2);
sys2 = sys / (1 + sys);
step(sys2);
grid;
stepinfo(sys2)

% 伯德图
figure(3);
margin(sys);
grid on;

% 计算频域指标
[Gm, Pm, Wcg, Wcp] = margin(sys);
fprintf('幅值裕度 (Gain Margin): %.2f dB\n', 20*log10(Gm));
fprintf('相角裕度 (Phase Margin): %.2f degrees\n', Pm);
fprintf('幅值裕度对应的频率 (Gain Crossover Frequency): %.2f rad/s\n', Wcg);
fprintf('相角裕度对应的频率 (Phase Crossover Frequency): %.2f rad/s\n', Wcp);

% 超前校正
% num = 1043.19 * 62.74 * [1, 61.18];
% den = conv([1, 0, -623.956], [1, 418.40]);
% sys = tf(num, den);
