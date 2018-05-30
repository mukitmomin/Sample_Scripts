x = 0: 0.05*pi : 2*pi;
y = sin(x);
plot(x,y, 'k-o')

hold on

z = cos(x);
plot(x,z,'k-x')

grid on
xlabel('x')
gtext('sin x')
gtext('cos x')



fplot(@testfunc, [1,20])
grid on