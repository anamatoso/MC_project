function [z] = metminquadpond3(X, Y, vfb1,w)
%METMINQUAD3 calcula a fun��o que melhor se ajusta a um dado conjunto de
%pontos. Recebe um vetor horizontal com x, um vetor horizontal com y, um
%cell array das fun��es de base em string e um lista de pesos w

f=vfb1;%cell array com strings das fun��es
numf = length(f); %n�mero de fun��es
nump = length(X); %n�mero de pontos

%Verificar que os vetores s�o horizontais
if size(X)==[length(X) 1]
    X=X';
end
if size(Y)==[length(Y) 1]
    Y=Y';
end

%Construir a matriz B
B = zeros(nump, numf);
x = X;
for j=1:numf
    phi = @(x) eval(char(f(j)));
    for i = 1:nump
        B(i,j) = phi(x(i));
    end
end

%Construir a matriz W
W = zeros(nump,nump);
for i = 1:nump
    W(i,i) = w(i);
end

%Resolver o sistema Mc=b
b = B'*W*Y'; 
M = B'*W*B;
c = M\b; %coeficientes de cada fun��o de base

%Com os coeficientes fazer uma fun��o a partir das fun��es de base
fun = strcat('',num2str(c(1)),'*(',char(f{1}),')');
for i = 2:numf
    fun = strcat(fun,'+(',num2str(c(i)),')*(',char(f{i}),')');
end

%para mostrar a express�o da fun��o
q=strcat('y=',fun); 
disp(q)

z = @(x) eval(char(fun)); %fun��o final manipul�vel
end