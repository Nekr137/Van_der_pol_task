function VanDerPolTest
%[dphi1 dphi2] = dsolve('
% % dphi1 = 'Dfi1=1/2/w/r1*(w1^2+g*r2-g*r1-w^2*r1+B)+eps/2-r1^2/8';
% % dphi2 = 'Dfi2=1/2/w/r2*(w2^2+g*r1-g*r2-w^2*r2)+eps/2-r2^2/8';
% % dr1 = 'Dr1 = 1/2/w*(w1^2-g*r2*(fi2-fi1)-B)+eps/2*r1-r1^3/8';
% % dr2 = 'Dr2 = 1/2/w*(w2^2-g*r1*(fi1-fi2))+eps/2*r2-r2^3/8';
% % 
% % [a b c d] = dsolve(dphi1,dphi2,dr1,dr2)
% 
% % Dr1 = 'Dr1 = 1/2/w*(w1^2*sin(phi1)-g*r2*sin(phi2-phi1)-B*cos(phi1))+eps/2*r1-r1^3/8';
% % Dphi1 = 'Dphi1 = 1/2/w/r1*(w1^2*cos(phi1)+g*r2*cos(phi2-phi1)-g*r1-w^2*r1+B*sin(phi1))+eps/2-r1^2/8';
% % Dr2 = 'Dr2 = 1/2/w*(w2^2*sin(phi2)-g*r1*sin(phi1-phi2))+eps/2*r2-r2^3/8';
% % Dphi2 = 'Dphi2 = 1/2/w/r2*(w2^2*cos(phi2)+g*r1*cos(phi1-phi2)-g*r2-w^2*r2-w^2*r2)+eps/2-r2^2/8';
% % 
% % [a b c d] = dsolve('Dr1 = 1/2/w*(w1^2*sin(phi1)-g*r2*sin(phi2-phi1)-B*cos(phi1))+eps/2*r1-r1^3/8,Dphi1 = 1/2/w/r1*(w1^2*cos(phi1)+g*r2*cos(phi2-phi1)-g*r1-w^2*r1+B*sin(phi1))+eps/2-r1^2/8,Dr2 = 1/2/w*(w2^2*sin(phi2)-g*r1*sin(phi1-phi2))+eps/2*r2-r2^3/8,Dphi2 = 1/2/w/r2*(w2^2*cos(phi2)+g*r1*cos(phi1-phi2)-g*r2-w^2*r2-w^2*r2)+eps/2-r2^2/8')
% 
% syms x1(t) x2(t) y1(t) y2(t) g b we eps w1 w2 t
% Y1 = (eps - x1^2)*y1-w1^2*x1+g*(x1-x1)+b*sin(we*t)
% y1 = diff(x1,t)
% X11 = subs(Y1,y1)
% 
% A = 3/i/n*(-2*exp(-i*n)-exp(i*n)+exp(-2*i*n))-2/3/n^2*(exp(i*n)-1)
for n=1:10
    a = i/pi/n*(-2*exp(-i*n*pi/3)-exp(i*n*pi/3)+exp(-2*i*n*pi/3))*2/3/n^2*(exp(i*n*pi/3)-1);
 disp(a)
end


end


