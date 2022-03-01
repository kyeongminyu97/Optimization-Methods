
tic
x1=(inv(transpose(A1)*(A1)))*transpose(A1)*b1;
f1=(A1 * x1)- b1;
n1=norm(f1,2);
toc
%%
tic
x2=(inv(transpose(A2)*(A2)))*transpose(A2)*b2;
f2=(A2 * x2)- b2;
n2=norm(f2,2);
toc
%%
tic
x3=(inv(transpose(A3)*(A3)))*transpose(A3)*b3;
f3=(A3 * x3)- b3;
n3=norm(f3,2);
toc
%%
tic
x4=(inv(transpose(A4)*(A4)))*transpose(A4)*b4;
f4=(A4 * x4)- b4;
n4=norm(f4,2);
toc
%%
tic
x5_2=(inv(transpose(A5)*(A5)))*transpose(A5)*b5;
f5_2=(A5 * x5_2)- b5;
n5_2=norm(f5_2,2);
toc
%%
histogram (f5_2,15);
grid on;
xlim([-3, 3]);
xlabel('r_2', 'FontSize', 14);
ylabel('frequency', 'FontSize', 14);
title('Histogram of l_2 residuals', 'FontSize', 14);