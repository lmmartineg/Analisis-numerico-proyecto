clc
clear all
close all

x=[5 4 3 1]';
y=[13 11 11 9]';

A=[x.^3 x.^2 x ones(4,1)]
b=y;
a=inv(A)*b

xpol=1:0.01:5;
p=a(1)*xpol.^3+a(2)*xpol.^2+a(3)*xpol+a(4);
p2=a(1)*1.5.^3+a(2)*1.5.^2+a(3)*1.5+a(4)
plot(x,y,'r*',xpol,p,'b-')
hold on
plot(1.5,p2,'g*')
grid on