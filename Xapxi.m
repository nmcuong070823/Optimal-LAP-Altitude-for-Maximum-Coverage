
clear all
close all

eta_LOS=1;  %{1.6,1,.1,.1};
eta_NLOS=20; %{23,20,21,21};

a=10;  %{15,11,5,5};
a1=15;
b=0.18;  %{.16,.18,.3,.3};
%a1=15;

%parameter A
A=eta_LOS-eta_NLOS;
y1=-b*A/4;
x1=a-(1/b)* log2(1/a)/1.4427;
y2=-0.1027*b*A;
x2=a-(1/b)* log2(0.1315/a)/1.4427;
y11=-b*A/4;
x11=a1-(1/b)* log2(1/a1)/1.4427;
y22=-0.1027*b*A;
x22=a1-(1/b)* log2(0.1315/a1)/1.4427;
v=[0:1:89];

    for i=1:length(v)
         seta=v(i);
         tag=pi*log2(exp(1))*tan(pi/180*seta)/(9*log2(10));
         Pmoi=-(a*b*A*exp(-b*(seta-a)))/(a*exp(-b*(seta-a))+1)^2;
         Xi=y1+((y2-y1)/(x2-x1))*(seta-x1);
         Pmoi1=-(a1*b*A*exp(-b*(seta-a1)))/(a1*exp(-b*(seta-a1))+1)^2;
         Xi1=y11+((y22-y11)/(x22-x11))*(seta-x11);
         Y=0.0027*seta;
          
        path(i+1,1)=seta; 
        path(i+1,2)=tag;
        path(i+1,3)=Pmoi;
        path(i+1,4)=Xi;
        path(i+1,5)=Pmoi1;
        path(i+1,6)=Xi1;
        path(i+1,7)=Y;
                
    end
    figure(1)
    plot(path(:,1), path(:,2),'b',path(:,1), path(:,3),'r',path(:,1), path(:,4),'k')
    hold
    plot(path(:,1), path(:,5),'r--',path(:,1), path(:,6),'k--',path(:,1), path(:,7),'b--')
    %plot(path(:,1), path(:,4),'k',path(:,1), path(:,5),'r--')
    %plot(path(:,1), path(:,2),'b')
    %axis([0 89 -0.5 3])
  legend('tanx', 'difference sigmoi','sigmoi');
 grid on;
 %title('PL vs h');
 xlabel('seta');
 ylabel('XX');
 %figure(2)
 %plot(path(:,1), path(:,7),'k')
 axis([0 89 -1 2])
 %grid on;
 %zlabel('PL');
        
    

