%% GRUPO 1
format long
L = 2.02;
R = 25;
C = 0.000241; 
t0 = 0;
t1 = 10^(-4); 
e = 10^(-8); %erro
q = @ (t) (8*(exp((-R*t)/(2*L)))*(cos(t*(sqrt((1/(L*C))-((R^2)/(4*(L^2)))))))); %função do enunciado
f1 = @ (t) ((8*(exp((-R*t)/(2*L)))*(cos(t*(sqrt((1/(L*C))-((R^2)/(4*(L^2))))))))-((q(0))/2)); %função cujo zero corresponde ao momento quando q(t) é metade de q(0)
resposta1 = metsec2(t0, t1, f1, e, 100);
%% 
% _Justificação de covergência_
format long
a=0.016667744020192;
b=0.025557930265620;
x=(a:0.00001:b);
L = 2.02;
R = 25;
C = 0.000241;
A=-R/(2*L);
B=(sqrt((1/(L*C))-((R^2)/(4*(L^2)))));
f=@(t) 8*exp(A*t)*cos(t*B)-4;
dev=@(t) - (5000*exp(-(625*t)/101)*cos((6318869531914679*t)/140737488355328))/101 - (6318869531914679*exp(-(625*t)/101)*sin((6318869531914679*t)/140737488355328))/17592186044416;
ddev = @(t) 8*exp(A*t)*((cos(B*t))*(A^2-B^2)-2*A*B*sin(B*t));

cond1=f(a)*f(b)<0; %verifica condição 1
a1=abs(f(a)/dev(a));
a2=abs(f(b)/dev(b));
cond4=b-a>a1 & b-a>a2; %verifica condição 2

%desenhar o gráfico de f e das suas derivadas e da reta y=0
figure(1)
plot(x,arrayfun(f,x), 'b')
hold on
plot(x,arrayfun(dev,x),'r')
plot(x, arrayfun(@(t) 0,x),'k')
yyaxis right
plot(x,arrayfun(ddev,x),'g')
%% GRUPO 2
% _Alínea 1_
format long
X = [1 3 4 6 8 10 15 16 18 20];
Y = [1 5 7 4.5 12 28 20 19 14.5 10];
W = [2000 1500 4000 2100 3550 1000 2450 2000 4900 1100];
F1 = {'1' 'x' 'x^2' 'x^3'};
resposta23 = metminquadpond3(X,Y,F1,W); %mostra a expressão e dá a função

%Desenhar o gráfico
x=1:0.1:20;
figure(2)
plot(X,Y,'*r')
hold on
plot(x,arrayfun(resposta23,x),'k','LineWidth',4)
xlabel('x')
ylabel('y')
%% GRUPO 3
% _Alínea 2_
format long
f2 = @(x)((x^20)*exp(x-1)); %função da qual queremos calcular o integral
n = [10 20 40 80 160 320 640 1280 2560]; %valores dos n

%Fazer uma tabela/matriz que tem como colunas os valores de n, o cálculo do
%integral através do método de Simpson e o módulo do erro absoluto
S = zeros(length(n),1);
erro = zeros(length(n),1);
I = simpson(0,1,6348,@(x) ((x.^20).*exp(x-1))); %integral com pelo menos 12 algarismos significativos
for i = 1:length(n)
S(i) = simpson(0,1,n(i),f2);
erro(i) = abs(S(i)-I);
end
resposta32 = [n' S erro];

%linearização dos dados
h=zeros(1, length(n));
for i=1:length(n)
    h(i)=log((1/n(i)));
end
ln=@(x) log(x);
respostalin = [h' arrayfun(ln, resposta32(:,3))]; %lineariza a coluna dos erros
reglin = metminquadpond3(h,respostalin(:,2)',{'1' 'x'},[1 1 1 1 1 1 1 1 1 1]);%mostra a expressão da reta que tem como declive a ordem de convergência do método de Simpson
%%
% _Alínea 3_
format long
Ik = zeros(100,1);
Ik(1) = exp(-11);
for i = 2:length(Ik)
    Ik(i) = 1-i*Ik(i-1);
end
%%
% _Alínea 4_
format long
k = [10 100 1000 10000 10^8];

%cálculo do número de números primos pela função Li(x)
li = zeros(length(k),1);
for i = 1:length(k) 
    li(i) = round(simpson(2,k(i),10000,@(x)(1/log(x)))-0.5); %arredondamento para que arredonde por baixo
end

%cálculo do número de números primos pela função primes do Matlab
primos = zeros(length(k),1);
for i = 1:length(k)
    primos(i) = length(primes(k(i)));
end

%Cálculo do erro
err=zeros(length(k),1);
for i = 1:length(k)
    err(i)=(abs(primos(i)-li(i)))/(primos(i));
end
comp = ["x" "funçao li(x)" "primes do matlab" "erro";k' li primos err]; %matriz/tabela que compara os valores calculados com a função primes e com a Li(x)
%% *GRUPO 4*
% _Alínea 2 a)_
format long
a1=-0.02;
b1=0.05;
c1=-0.03;
d1=0.01;
f=@(t,y) [a1*y(1)+b1*y(2)*(1-abs(y(2))); c1*y(1)*(1-abs(y(1)))+d1*y(2)];
ra=pontomediovet(0,365,f,365,[5.5; 4.5]); %resultado do ponto médio na situação a
dias=0:365;
figure(3)
subplot(2,2,1);
plot(dias,ra(1,:),'b')
title('Situação A');
hold on
xlabel('Dia');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);
plot(dias,ra(2,:),'r')
xlabel('Dia');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);

% _Alínea 2 b)_
a2=-0.02;
b2=0.05;
c2=-0.03;
d2=-0.01;
f=@(t,y) [a2*y(1)+b2*y(2)*(1-abs(y(2))); c2*y(1)*(1-abs(y(1)))+d2*y(2)];
rb=pontomediovet(0,365,f,365,[5.5; 4.5]); %resultado do ponto médio na situação b

subplot(2,2,2);
plot(dias,rb(1,:),'b')
title('Situação B');
hold on
xlabel('Dia');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);
plot(dias,rb(2,:),'r')
xlabel('Dia');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);

% _Alínea 2 c)_
a3=-0.02;
b3=0.05;
c3=0.03;
d3=-0.01;
f=@(t,y) [a3*y(1)+b3*y(2)*(1-abs(y(2))); c3*y(1)*(1-abs(y(1)))+d3*y(2)];
rc=pontomediovet(0,365,f,365,[5.5; 4.5]); %resultado do ponto médio na situação c
subplot(2,2,3);
plot(dias,rc(1,:),'b')
title('Situação C')
hold on
xlabel('Dia');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);
plot(dias,rc(2,:),'r')
xlabel('Dia');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);

% _Alínea 2 d)_
a4=-0.01;
b4=0.05;
c4=-0.03;
d4=0.01;
f=@(t,y) [a4*y(1)+b4*y(2)*(1-abs(y(2))); c4*y(1)*(1-abs(y(1)))+d4*y(2)];
rd=pontomediovet(0,365,f,365,[5.5; 4.5]); %resultado do ponto médio na situação d
subplot(2,2,4);
plot(dias,rd(1,:),'b')
title('Situação D');
hold on
xlabel('Dias');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);
plot(dias,rd(2,:),'r')
xlabel('Dias');
ylabel('Intensidade do amor');
axis([0 365 -10 10]);