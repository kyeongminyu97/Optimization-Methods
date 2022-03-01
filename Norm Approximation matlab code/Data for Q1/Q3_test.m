%define observation and lamda
x=ones(256,1)
b= A*x0
lamda= 0.01* norm (2*transpose(A)*b, inf)
%initialize
x=zeros(256,1)
u=(ones(256,1))*2;
v=[x;u]
t=1
mu = 15

while 256/t >= 0.00001
    eps=1e-4
    %define obj fn,Hessian, grad, L
    F= obj_fn(x,u,t,A,b,lamda)
    H=Hessian(x,u,t,A,b)
    g=grad(x,u,t,A,b,lamda)
    L=chol(Hessian(x,u,t,A,b))
    L = transpose(L)
    dec=(norm(inv(L)*g,2))^2

    while dec/2>eps
   
        %newton-interior
        deltav=(-inv(transpose(L)))*inv(L)*g
        deltax=deltav(1:256)
        deltau=deltav(257:512)
   
        %alpha 0.01~0.3, beta 0.1~0.5
        alpha= 0.3
        beta=0.3
        %choose step size t
        step_t=1
        while obj_fn(x+deltax * step_t ,u+deltau*step_t,t,A,b,lamda) >= (F+ alpha*step_t* transpose(g)*deltav)
            step_t=step_t*beta;
        end
        x= x+ step_t*deltax
        u=u+step_t*deltau
        F= obj_fn(x,u,t,A,b,lamda)
        g=grad(x,u,t,A,b,lamda)
        H=Hessian(x,u,t,A,b)
        L=chol(Hessian(x,u,t,A,b))
        L = transpose(L)
        dec=(norm(inv(L)*g,2))^2
    end
t = t* mu

end
x

%% plots
%original
figure (1)
bar(x0)
xlabel('x', 'FontSize', 14);
ylabel('signal', 'FontSize', 14);
title('original signal', 'FontSize', 14);

%obtained l_1- regularised
figure (2)
bar(x)
xlabel('x', 'FontSize', 14);
ylabel('signal', 'FontSize', 14);
title('l_1 reconstructed signal', 'FontSize', 14);

%obtained l_2- regularised
x_new = inv(transpose(A)*A)*transpose(A)*b
figure (3)
bar(x_new)
xlabel('x', 'FontSize', 14);
ylabel('signal', 'FontSize', 14);
title('Minimum energy reconstruction', 'FontSize', 14);
%%
%objective function
function f= obj_fn(x,u,t,A,b,lamda)
    k = u -abs(x)
    if sum(k<0)
        f = Inf
    else
   
    log_bar=0;
    u_sum=0
    for i=1:256
        log_bar= log_bar- log(u(i)+x(i))-log(u(i)-x(i));
        u_sum= u_sum+ u(i);
    end
    norm_squared=(norm(A*x-b,2))^2;
    f= t*norm_squared + t*lamda* u_sum + log_bar ;
    end
end

%gradient of objective
function f=grad(x,u,t,A,b,lamda)
    g1_1st_term= 2*t*transpose(A)*(A*x -b);
    g1_2nd_term=zeros(256,1);
    g2_1st_term= t*lamda*ones(256,1);
    g2_2nd_term= zeros(256,1)  ;
    for i=1:256
        g1_2nd_term(i)=(2*x(i))/((u(i)^2)-(x(i)^2));
        g2_2nd_term(i)= (2*u(i))/((u(i)^2)-(x(i)^2));
    end
    g1= g1_1st_term + g1_2nd_term ;
    g2= g2_1st_term - g2_2nd_term;
    f= [g1;g2];
end

function f= Hessian(x,u,t,A,b)
    D1= zeros(256);
    D2= zeros(256);
    for i=1:256
        D1(i,i)= (2*((u(i)^2)+(x(i)^2)))/(((u(i)^2)-(x(i)^2))^2);
        D2(i,i)= (-4*u(i)*x(i))/(((u(i)^2)-(x(i)^2))^2);
    end
    f= [2*t*transpose(A)*A+D1, D2 ; D2, D1];
end