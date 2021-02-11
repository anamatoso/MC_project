function [S] = simpson(a, b, n, f)
%SIMPSON Esta fun��o acha uma aproxima��o do integral de f de a a b
%   Dadas duas iteradas iniciais a e b, simpson d� uma aproxima��o do valor
%   do integral de f de a a b considerando n subintervalos.
if mod(n,2)~=0 || n<=0
    d=["imposs�vel correr o programa!"; "n � �mpar e/ou negativo, introduza um n�mero par positivo"];
    disp(d);
    return
end

h = (b-a)/n;

%Constru��o do vetor que tem a divis�o do intervalo [a,b] em n partes
x = zeros(n,1);
for i = 1:(n-1)
    x(i) = a+i*h;
end

%Constru��o de dois vetores um com os xi de indice par(x2) e outro com os de
%indice impar(x1)
x1 = zeros(n/2,1);
x2 = zeros((n/2)-1,1);

%Separa��o dos argumentos da fun��o f que v�o entrar em cada somat�rio
for i=1:n/2
    x1(i)=x(2*i-1);
end
for i=1:(n/2)-1
    x2(i)=x(2*i);
end

%Constru��o dos dois somat�rios aplicando a cada uma das componentes dos vetores x1 e x2 a
%fun��o f e depois somando (fun��o sum soma todas as componetes de um vetor)
s1 = sum(arrayfun(f,x1));
s2 = sum(arrayfun(f,x2));

%C�lculo do integral
S = (h/3)*(f(a)+f(b)+4*s1+2*s2);
end

