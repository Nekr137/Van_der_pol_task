function VANDERPOL2
TIME = 150;
dt = 80;  
[T,Y] = ode45(@vdp2,[0 TIME],[0 0 0 0]);
end

function dy = vdp2(t,y)
eps = 0.1;  b = 0.025;  w1 = 1; w2 = 1.0015; g = 0.02;  
fe = .145:.001:.17;
fe = fe';
len = length(fe);     % length of fe
dy = zeros(len,4);    % a column vector
dy(:,1) = repmat(y(2),1,len);
dy(:,2) = ((eps - y(1)^2)*y(2) - w1^2*y(1)+g*(y(3)-y(1))+b*sin(2*pi*fe'*t))';
dy(:,3) = repmat(y(4),1,len);
dy(:,4) = ((eps - y(3)^2)*y(4) - w2^2*y(3)+g*(y(1)-y(3)))';
end
