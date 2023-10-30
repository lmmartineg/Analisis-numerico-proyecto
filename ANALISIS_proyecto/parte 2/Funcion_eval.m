function [resultado] = Funcion_eval(punto,f)
syms x
resultado=(double(subs(f,x,punto)));

end