function[twolf] = wolf(r,T)
%0 < mi <0.5 < m2 < 1
m1 = 0.1;
m2 = 0.9;
t = T;
tminus = 0;
tplus = 0;
N=1000;
for k=1:N
    v = r - t * ex05_grad(r);
    if func(v) <= func(r) + m1 * t * -1 * grad(r)*grad(r)' ...
            && (grad(v) * -1* grad(r)') >= m2* grad(r) * -1* grad(r)'
        twolf = t;
        break;
    elseif func(v) > func(r) + m1 * t *  (grad(r)*(-1* grad(r))')
            tplus = t;
        elseif func(v) <= func(r) + m1 * t *(grad(r)*(-1* grad(r))')...
                    &&...
                     (grad(v) * (-1* grad(r))') <  m2* -1*(grad(r) * grad(r)')
                 tminus = t;
    end
 

    
    if tplus ==0
        t = 2* tminus;
    elseif tplus>0
            t = (tminus + tplus) /2;
    end
end
end
