function [Y] = pontomediovet(a,b,f,n,ya)
%PONTOMEDIOVET calcula uma sucess�o de aproxima��es/iteradas y0, y1,...,yn
%produzidas a partir do m�todo do ponto m�dio. Recebe uma fun��o f, um
% intervalo ab, o n�mero de subintervalos n e uma aproxima��o inicial ya

h=(b-a)/n; 
Y=zeros(length(ya),n+1); %matriz que em cada coluna tem cada iterada e na 
%primeira linha tem os valores correspondentes ao Romeu e na segunda linha 
%os correspondentes � Julieta

%constru��o do vetor que vai ter os valores de ti
t=zeros(n+1,1);
for i=1:n
    t(i)=a+(i*h);
end

%constru��o da matriz Y em que nas linhas tem cada iterada e nas colunas as
%componentes de yi
Y(:,1)=ya;
for i=1:n
    Y(:,i+1)=Y(:,i)+h*f(t(i)+(h/2),Y(:,i)+(h/2)*f(t(i),Y(:,i)));
end
end