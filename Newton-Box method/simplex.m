%построение симплекса
function[r,k,x,y] = simplex(epsilon,r0)
k=1;
r=r0;
x(1) = r(1);
y(1) = r(2);
%пока находимся в заданной области
while sqrt(grad(r)*grad(r)')>epsilon
    %сдвиг к центру тяжести координат
    r = r - (inv(Hess(r))* grad(r)')';
    k=k+1;
    %задаем коорлинаты следующего симплекса
    x(k) = r(1);  
    y(k) = r(2);
    min_point_x =x(k);
    min_point_y =y(k);
end
%вывод ответа в консоль
fprintf("\t Starting Coordinates are X,Y = %d, %d\n",x(1),y(1));
fprintf("\t Minimum at X,Y = %f, %f in %d steps\n\n",min_point_x,min_point_y,k);

end
