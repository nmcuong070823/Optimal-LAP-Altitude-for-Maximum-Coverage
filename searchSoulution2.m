
clear all
close all

eta_LOS=1;  %{1.6,1,.1,.1};
eta_NLOS=20; %{23,20,21,21};

a=11;  %{15,11,5,5};
b=0.18;  %{.16,.18,.3,.3};
%a1=15;

A=eta_LOS-eta_NLOS;
eta=1;tu=89;tl=0;
while tu-tl>eta 
    t=(tu+tl)/2;
    Ft=pi*log2(exp(1))*tan(pi/180*t)/(9*log2(10))+(a*b*A*exp(-b*(t-a)))/(a*exp(-b*(t-a))+1)^2;
    Ftl=pi*log2(exp(1))*tan(pi/180*tl)/(9*log2(10))+(a*b*A*exp(-b*(tl-a)))/(a*exp(-b*(tl-a))+1)^2;
if Ft*Ftl>=0 
    tl=t;
else
    tu=t;
end
end
tl


   

