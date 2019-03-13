function VANDERPOL
global eps b w1 w2 g fe
eps = 0.1;
b = 0.025;
w1 = 1;
w2 = 1.0015; 
g = 0.02;

fe_vector = .145:.0001:.17;
figure(1)
for k = 1:length(fe_vector)
    fe = fe_vector(k); 
    
    [T,Y] = ode45(@vdp2,[100000 120000],[0 0 0 0]);

    subplot(321);    plot(Y(:,1),Y(:,2),'.-'); hold on; plot(Y(:,3),Y(:,4),'.-'); hold off;
    subplot(323);    plot(T,Y(:,1)); hold on; plot(T,Y(:,3)); hold off;
    subplot(325);    plot(T,Y(:,2)); hold on; plot(T,Y(:,4)); hold off
    
    xx = linspace(T(1),T(end),length(T));
    yy1 = spline(T,Y(:,2),xx);
    yy2 = spline(T,Y(:,4),xx);
    dT = xx(2)-xx(1);
    
    s = subplot(322); 
    NFFT = 32768*2;
    Y1 = fft(yy1,NFFT)/dT;
    Y2 = fft(yy2,NFFT)/dT;
    Fs = 1/dT;
    f = Fs/2*linspace(0,1,NFFT/2+1);
    
    [ampl1,num1] = max(2*abs(Y1(1:NFFT/2+1)));
    [ampl2,num2] = max(2*abs(Y2(1:NFFT/2+1)));
    f1(k) = f(num1);   
    f2(k) = f(num2);
    f1(k) = f1(k)/fe;
    f2(k) = f2(k)/fe;
        
    plot(f,2*abs(Y1(1:NFFT/2+1))); hold on;set(s,'XLim',[0.14 0.184])
    plot(f,2*abs(Y2(1:NFFT/2+1))); 
    plot(f1(k),ampl1,'o');
    plot(f2(k),ampl2,'o');
    hold off

    subplot(324)
    plot(fe_vector(1:k),f1,'-');hold on;
    plot(fe_vector(1:k),f2,'-');hold off;
    subplot(326)
    plot(fe_vector(1:k),f1./f2,'-');
    pause(0.0001)
end
subplot(321); xlabel('x'); ylabel('y');legend('1','2');
subplot(323); xlabel('t'); ylabel('x');legend('1','2');
subplot(325); xlabel('t'); ylabel('y');legend('1','2');
subplot(324); ylabel('f1/fe, f2/fe'); xlabel('fe');
subplot(326); xlabel('fe');ylabel('f1/f2');
subplot(322); xlabel('frequency');
end

function dy = vdp2(t,y)
%http://qaru.site/questions/5380335/matlab-ode45-change-the-number-of-time-steps
global eps b w1 w2 g fe
dy = zeros(4,1);    % a column vector
dy(1) = y(2);
dy(2) = (eps - y(1)^2)*y(2) - w1^2*y(1)+g*(y(3)-y(1))+b*sin(2*pi*fe*t);
dy(3) = y(4);
dy(4) = (eps - y(3)^2)*y(4) - w2^2*y(3)+g*(y(1)-y(3));
end
