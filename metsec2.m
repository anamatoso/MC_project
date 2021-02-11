function [z] = metsec2( a, b, f, e, n)
%METSEC Esta fun��o acha uma aproxima��o do zero da fun��o f
%   Dadas duas iteradas iniciais a e b, metsec d� uma aproxima��o do zero
%   da fun��o f perto dessas duas iteradas com um erro inferior a e ou com
%   um n�mero de iteradas m�ximas de n
if e<=0 || n<=0
    d=["imposs�vel correr o programa!"; "n  ou erro s�o negativos ou zero, introduza um valor de n e erro positivos"];
    disp(d);
    return
end
%verificar se a ou b s�o zeros
if f(a)==0
    sprintf('o zero � %d', a)
    
elseif f(b)==0
    sprintf('o zero � %d', b) 
end

% Constru��o de matriz que vai ter como colunas as iteradas e o erro
% respetivo
i = 1;
z = zeros(n, 2); 
while i <= n && (abs(b - a)) >= e
    c = a; %guardar valor de a que vai ser o extremo esquerdo anterior
    a = a - f(a) * ((a - b)/(f(a) - f(b))); %novo extremo esquerdo
    b = c; %novo extremo direito
    tol = abs(b - a);
    z(i) = a;
    z(i+n) = tol;
    i = i + 1;
end

%caso n�o se chegue ao n�mero m�ximo de iteradas n, a parte seguinte vai
%eliminar as linhas de zeros extra
k = n;
while z(k)==0 && z(2 * k)==0
   z(k,:) = [];
   k = k - 1;
end

%numerar iteradas
v = (1 : k)';
z = [v z];
end

