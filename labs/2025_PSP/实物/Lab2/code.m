% 系统矩阵定义
A = [0 1;
    29.4 0];
B = [0; 3];
C = [1 0];
D = 0;

% 状态反馈增益 K
K = [-12.4667 -1.333];

Ac = A + B*K;
[num, den] = ss2tf(Ac, B, C, D, 1);
sys = tf(num, den);

figure;
sys_cl = feedback(sys, 1); % 闭环系统
step(sys_cl);
title('闭环系统单位阶跃响应');
figure;
rlocus(sys); % 绘制根轨迹
title('根轨迹');