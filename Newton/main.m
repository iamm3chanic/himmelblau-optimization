function[] = main(~,~)
X_cord=[-2 -5 -3 0 2 4   5   1];
Y_cord=[2  10 -3 0 3 10 -10 -1];

    for i=1:length(X_cord)
        %рисуем квадраты - проекции симплексов
        [~,~,x,y] = newton(0.001,[X_cord(i),Y_cord(i)]);
        plot(x,y,'-o');
        plot(x,y,'-s','MarkerSize',len);
        hold on
    end 
%рисуем график
xlabel('X');
ylabel('Y');
hold on;
[X, Y]=meshgrid(-5:0.01:5, -5:0.01:5);
contour(X, Y, (X.^2+Y-11).^2 + (X+Y.^2-7).^2, [0,0.1,0.5,1,2,5,10,20,30,60,100,200,300,400,500,700]);
title('Convergence of the Newton algorithm')
set(gca,'Color',[1 0 0])
set(gca,'Color',[1 1 1])
[a, b]=meshgrid(-5:0.01:5, -5:0.01:5);
c = (a.^2 + b - 11).^2 + (a + b.^2 - 7).^2;
figure ;
mesh(a,b,c)
end
