% find dmaxuhu
d0=1;
% dmaxuhu=1/(PDDf(5,10,90,15)/100)
dmaxuhu=(d0*100)/(PDDf(5,10,90,15))

q15_pdd = quad(@myinetgraldose,0,pi)

dmaxuhu6=(d0*100)/(PDDf(5,10,90,6))
q6_pdd = quad(@myinetgraldose6,0,pi)

%% Q.2.b
Fsizes=[4:0.1:38];
depth=10;
t0=2.8;
Energy=15;
for i=1:length(Fsizes)
    miuhu15(i)=miu_finder(depth, t0,Fsizes(i),Energy);
end
plot(Fsizes,miuhu15)
xx=0;
yy15 = spline(Fsizes,miuhu15,xx)
hold on
plot([xx,Fsizes(1)],[yy15,miuhu15(1)],':g')
title ('miu for different field sizes 15 MV')
xlabel('field size')
ylabel('miu')
legend('actual data','extrapolation')
hold off
q15 = quad(@my_analytic_inetgraldose15,0,pi)

%% Q.2.b.2

Fsizes=[4:0.1:38];
depth=10;
t0=1.6;
Energy=6;
for i=1:length(Fsizes)
    miuhu6(i)=miu_finder(depth, t0,Fsizes(i),Energy);
end
figure
plot(Fsizes,miuhu6)
xx=0;
yy6 = spline(Fsizes,miuhu6,xx)

hold on
plot([xx,Fsizes(1)],[yy6,miuhu6(1)],':g')
title ('miu for different field sizes 6 MV')
xlabel('field size')
ylabel('miu')
legend('actual data','extrapolation')
hold off
q6 = quad(@my_analytic_inetgraldose6,0,pi)


%% next one
if 1
miu=yy6
%chek analytic solution
alpha=2.5*miu;
teta=0;
u=alpha*cos(teta);
% intdose=(pi/(miu^3))*(alpha^2) *exp(-alpha
intdose1=(pi/(miu^3))*(((alpha^2) *exp(-u))+((-(u^2)-(2*u)-2)*exp(-u)))

teta=pi;
u=alpha*cos(teta);
% u=2.5*miu*cos(t)
% intdose=(pi/(miu^3))*(alpha^2) *exp(-alpha
intdose2=(pi/(miu^3))*(((alpha^2) *exp(-u))+((-(u^2)-(2*u)-2)*exp(-u)))

answeru=intdose2-intdose1

%%
t=0;
intdose21=(pi/(miu^3))*(((alpha^2) *exp(-(2.5*miu)))+((-((2.5*miu)^2)-(2*(2.5*miu))-2)*exp(-(2.5*miu))))
t=pi;
intdose22=(pi/(miu^3))*(((alpha^2) *exp((2.5*miu)))+((-((-2.5*miu)^2)-(2*(-2.5*miu))-2)*exp((2.5*miu))))

answeru2=intdose22-intdose21
totintdose=((pi*((2.5*miu)^2)*(exp(2.5*miu)-exp(-2.5*miu)))/(miu^3))-((pi/(miu^3))* ((((-2.5*miu)^2)-(5*miu)-2)*exp(2.5*miu)))+((pi/(miu^3))*((((2.5*miu)^2)+(5*miu)-2)*exp(-2.5*miu)))

end