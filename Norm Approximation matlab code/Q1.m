
tic
A1_new=-[-A1, ones(32,1);A1, ones(32,1)];
b1_new=-[-b1;b1];
c1=[zeros(16,1);1];
x1_with_t=linprog(c1,A1_new,b1_new);

x1=x1_with_t(1:end-1);
f1=(A1 * x1)- b1;
n1=norm(f1,Inf);
toc
%% 
tic
A2_new=-[-A2,ones(128,1);A2,ones(128,1)];
b2_new=-[-b2;b2];
c2=[zeros(64,1);1];
x2_with_t=linprog(c2,A2_new,b2_new);

x2=x2_with_t(1:end-1);
f2=(A2 * x2)- b2;
n2=norm(f2,Inf);
toc
%%
tic
A3_new=-[-A3,ones(512,1);A3,ones(512,1)];
b3_new=-[-b3;b3];
c3=[zeros(256,1);1];
x3_with_t=linprog(c3,A3_new,b3_new);

x3=x3_with_t(1:end-1);
f3=(A3 * x3)- b3;
n3=norm(f3,Inf);
toc
%%
tic
A4_new=-[-A4,ones(1024,1);A4,ones(1024,1)];
b4_new=-[-b4;b4];
c4=[zeros(512,1);1];
x4_with_t=linprog(c4,A4_new,b4_new);

x4=x4_with_t(1:end-1);
f4=(A4 * x4)- b4;
n4=norm(f4,Inf);
toc
%%
tic
A5_new_inf=-[-A5,ones(2048,1);A5,ones(2048,1)];
b5_new_inf=-[-b5;b5];
c5_inf=[zeros(1024,1);1];
x5_with_t_inf=linprog(c5_inf,A5_new_inf,b5_new_inf);

x5_inf=x5_with_t_inf(1:end-1);
f5_inf=(A5 * x5_inf)- b5;
n5_inf=norm(f5_inf,Inf);
toc
%%
%%residual
histogram (f5_inf,15);
grid on;
xlim([-3, 3]);
xlabel('r_ inf', 'FontSize', 14);
ylabel('frequency', 'FontSize', 14);
title('Histogram of l_ inf residuals', 'FontSize', 14);
