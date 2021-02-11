function [z] = metsec2( a, b, f, e, n)
%METSEC Esta função acha uma aproximação do zero da função f
%   Dadas duas iteradas iniciais a e b, metsec dá uma aproximação do zero
%   da função f perto dessas duas iteradas com um erro inferior a e ou com
%   um número de iteradas máximas de n
if e<=0 || n<=0
    d=["impossível correr o programa!"; "n  ou erro são negativos ou zero, introduza um valor de n e erro positivos"];
    disp(d);
    return
end
%verificar se a ou b são zeros
if f(a)==0
    sprintf('o zero é %d', a)
    
elseif f(b)==0
    sprintf('o zero é %d', b) 
end

% Construção de matriz que vai ter como colunas as iteradas e o erro
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

%caso não se chegue ao número máximo de iteradas n, a parte seguinte vai
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

