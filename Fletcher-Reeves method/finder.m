function[r,k,x,y] = finder(epsilon,r0)
k=1;
r=r0;
x(1) = r(1);
y(1) = r(2);
p = -grad(r);
correct=0;
while sqrt(grad(r)*grad(r)')>epsilon
    r_old = r;
    t = (grad(r)*grad(r)')/(p*Hess(r)*p');
    r = r + t*p;             % reason why tp is positive because p = -ive grad i.e. why
    
    beta = (grad(r)*grad(r)')/(grad(r_old)*grad(r_old)');
    p = -grad(r) + beta*p;
    
    if (p*grad(r)')>=0  %condition to avoid divergency
        p = -grad(r);
        correct=correct+1;
    end
    
     k=k+1;
    x(k)= r(1);
    y(k)= r(2);
    min_point_x =x(k);
    min_point_y =y(k);
end
fprintf("\t Starting Coordinates are X,Y = %d, %d\n",x(1),y(1));
fprintf("\t no of corrections are = %d\n",correct);
fprintf("\t Minimum at X,Y = %f, %f in %d steps\n\n",min_point_x,min_point_y,k);
end
