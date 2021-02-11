function [S] = simpson(a, b, n, f)
%SIMPSON Esta função acha uma aproximação do integral de f de a a b
%   Dadas duas iteradas iniciais a e b, simpson dá uma aproximação do valor
%   do integral de f de a a b considerando n subintervalos.
if mod(n,2)~=0 || n<=0
    d=["impossível correr o programa!"; "n é ímpar e/ou negativo, introduza um número par positivo"];
    disp(d);
    return
end

h = (b-a)/n;

%Construção do vetor que tem a divisão do intervalo [a,b] em n partes
x = zeros(n,1);
for i = 1:(n-1)
    x(i) = a+i*h;
end

%Construção de dois vetores um com os xi de indice par(x2) e outro com os de
%indice impar(x1)
x1 = zeros(n/2,1);
x2 = zeros((n/2)-1,1);

%Separação dos argumentos da função f que vão entrar em cada somatório
for i=1:n/2
    x1(i)=x(2*i-1);
end
for i=1:(n/2)-1
    x2(i)=x(2*i);
end

%Construção dos dois somatórios aplicando a cada uma das componentes dos vetores x1 e x2 a
%função f e depois somando (função sum soma todas as componetes de um vetor)
s1 = sum(arrayfun(f,x1));
s2 = sum(arrayfun(f,x2));

%Cálculo do integral
S = (h/3)*(f(a)+f(b)+4*s1+2*s2);
end

