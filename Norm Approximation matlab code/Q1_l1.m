
tic
A1_new=-[-A1, eye(32);A1, eye(32)];
b1_new=-[-b1;b1];
c1=[zeros(16,1);ones(32,1)];
x1_with_t=linprog(c1,A1_new,b1_new);

x1=x1_with_t(1:end-32);
f1=(A1 * x1)- b1;
n1=norm(f1,1);
toc
%%
tic
A2_new=-[-A2, eye(128);A2, eye(128)];
b2_new=-[-b2;b2];
c2=[zeros(64,1);ones(128,1)];
x2_with_t=linprog(c2,A2_new,b2_new);

x2=x2_with_t(1:end-128);
f2=(A2 * x2)- b2;
n2=norm(f2,1);
toc
%%
tic
A3_new=-[-A3, eye(512);A3, eye(512)];
b3_new=-[-b3;b3];
c3=[zeros(256,1);ones(512,1)];
x3_with_t=linprog(c3,A3_new,b3_new);

x3=x3_with_t(1:end-512);
f3=(A3 * x3)- b3;
n3=norm(f3,1);
toc
%%
tic
A4_new=-[-A4, eye(1024);A4, eye(1024)];
b4_new=-[-b4;b4];
c4=[zeros(512,1);ones(1024,1)];
x4_with_t=linprog(c4,A4_new,b4_new);

x4=x4_with_t(1:end-1024);
f4=(A4 * x4)- b4;
n4=norm(f4,1);
toc
%%
tic
A5_new_1=-[-A5, eye(2048);A5, eye(2048)];
b5_new_1=-[-b5;b5];
c5_1=[zeros(1024,1);ones(2048,1)];
x5_with_t_1=linprog(c5_1,A5_new_1,b5_new_1);

x5_1=x5_with_t_1(1:end-2048);
f5_1=(A5 * x5_1)- b5;
n5_1=norm(f5_1,1);
toc
%%
histogram (f5_1,15);
grid on;
xlim([-3, 3]);
xlabel('r_1', 'FontSize', 14);
ylabel('frequency', 'FontSize', 14);
title('Histogram of l_1 residuals', 'FontSize', 14);
