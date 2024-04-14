clear all
close all
% for 1 UE, 
a=11;%15.18;     %3.61;    %a = 9.61, b = 0.16  
b=0.18;%-0.88;     % 0.46;     %0.16   Check value a,b
Nlos=1;%0.1;    %2.3;
Nnlos=20;%21;    %34;
A= Nlos-Nnlos;
B=20*log10(2*10^6)+20*log10(4*pi/3/10^8)+Nnlos;

h=[0:1:1000];% look for optimal high
R=[0:1:1000];%fix value of R

PL=38; 
PL1=35;%75;

 for t=1:length(h)     % =n1-k1
    for m=1:length(R)
      mu(m)=A/(1+a*exp(-b*((180/pi)*atan(h(t)/R(m))-a)));
      %mu(m)=A/(1+a*exp(-b*(atan(h(t)/R(m))-a)));
      D(m)=abs(PL-(mu(m)+10*log10(h(t)^2+R(m)^2)+B));
      D1(m)=abs(PL1-(mu(m)+10*log10(h(t)^2+R(m)^2)+B));
  end
      [Y,I]=min(D);
      [Y1,I1]=min(D1);
      r(t)=R(I);
      r1(t)=R(I1);     
end

 %plot(R,D,'b')
 plot(h,r,'b',h,r1,'b--')
%axis([0 length(n1) 10^-10 1])
  legend('PL=38','PL=35');
 grid on;
 title('PL vs h');
 xlabel('h');
 ylabel('R');
 %zlabel('PL');
        
    
            