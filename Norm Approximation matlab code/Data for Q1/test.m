x3_with_t= zeros(768,1)
eps=1e-4;
F=obj_f(x3_with_t,b3_new,A3_new,c3)
gradF= grad_obj_f(x3_with_t,b3_new,A3_new,c3)
x3_with_t=linsolve(A3_new,b3_new+(ones(1024,1)*-2))

F=obj_f(x3_with_t,b3_new,A3_new,c3)
gradF= grad_obj_f(x3_with_t,b3_new,A3_new,c3)


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
    for i = 1:1024;
        phi=phi+ (log(b3_new(i)- A3_new(i,:)*x));
    end
    f= transpose(c3)*x - phi
end

