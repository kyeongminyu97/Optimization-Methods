
%define new A,b,c
A3_new=-[-A3, eye(512);A3, eye(512)];
b3_new=-[-b3;b3];
c3=[zeros(256,1);ones(512,1)];
%initialise
x3_with_t=linsolve(A3_new,b3_new+(ones(1024,1)*-2))
k=b3_new - A3_new*x3_with_t

eps=1e-2;
F=obj_f(x3_with_t,b3_new,A3_new,c3)
gradF= grad_obj_f(x3_with_t,b3_new,A3_new,c3)

F_vec = F
count = 1

while norm(gradF,2) > eps
   
    %grad descent algorithm
    deltax= - gradF
    %alpha 0.01~0.3, beta 0.1~0.5
    alpha= 0.2
    beta=0.4
    %choose step size t
    step_t=1
    while obj_f(x3_with_t + deltax * step_t ,b3_new,A3_new,c3) >= (F+ alpha*step_t* transpose(gradF)*deltax)
        step_t=step_t*beta;
    end
    x3_with_t= x3_with_t + step_t*deltax
    F=obj_f(x3_with_t,b3_new,A3_new,c3)
    gradF= grad_obj_f(x3_with_t,b3_new,A3_new,c3)
   
    count = count +1
    F_vec(count) = F
end

x3 = x3_with_t(1:256)


%plot convergence analysis
error = F_vec - F;
error(end) =[];
semilogy(error);
xlabel('number of iterations')
ylabel('minimisation error')
title('convergence analysis')


%gradiet of objective
function f= grad_obj_f(x,b3_new,A3_new,c3)
    gradphi=0;
    for i=1:1024
        gradphi= gradphi+ (transpose(A3_new(i,:)))/(b3_new(i)- A3_new(i,:)*x);
    end
    f= c3 + gradphi
end

%objective fuction
function f= obj_f(x,b3_new,A3_new,c3)
    phi= 0;
    k=b3_new - A3_new*x
    if sum(k<=0)>0
        f = Inf
    else
        for i = 1:1024;
            phi=phi+ (log(b3_new(i)- A3_new(i,:)*x));
        end
        f= transpose(c3)*x - phi
    end
end
