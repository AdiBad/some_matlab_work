function dydt = odefun(t,x)
%ka,kc,ke,kp <- k(1,2,3,4)
%xg,xc,xp,xe <- x(1,2,3,4)
k=[5 2 2 0.4];
dydt = zeros(4,1);
dydt(1) = -k(1)*x(1);
dydt(2) = k(1)*x(1) - (k(2)+k(3))*x(2) + k(4)*x(3);
dydt(3) = k(2)*x(2) - k(4)*x(3);
dydt(4) = k(3)*x(2);
end
