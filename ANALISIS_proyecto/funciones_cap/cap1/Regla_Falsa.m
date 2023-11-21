function [X_Nuevo,Tabla_resultados,output] = Regla_Falsa(Funcion,Intervalo,Tolerancia,Num_Max_iteraciones)

Tabla_resultados=table();
a=Intervalo(1,1);
b=Intervalo(1,2);
syms x

F_A=double(subs(Funcion,x,a));
F_B=double(subs(Funcion,x,b));

if F_A<F_B && F_A*F_B<0
    output=sprintf('el intervalo entregado es valido');
else
    output=sprintf('el intervalo entregado no es valido');
    return
end
if F_A==0
    output=sprintf('su funcion tiene una raiz en %f',a);
    X_Nuevo=a;
    return
end
if F_B==0
    output=sprintf('su funcion tiene una raiz en %f',b);
    X_Nuevo=b;
    return
end

X_Nuevo= a-F_A*(b-a)/(F_B-F_A);
F_Nuevo=double(subs(Funcion,x,X_Nuevo));

puntos=[F_A;X_Nuevo];


Iteraciones=1;
X_A=[a];
X_B=[b];
T_FA=[F_A];
T_FB=[F_B];
T_FN=[F_Nuevo];
T_X_Nuevo=[X_Nuevo];
T_Iteraciones=[Iteraciones];




if F_Nuevo==0
   fprintf('su funcion tiene una raiz en %f',X_Nuevo);
elseif F_A*F_Nuevo<0
    b=X_Nuevo;
elseif F_Nuevo*F_B<0
    a=X_Nuevo;
end





while (F_Nuevo~=0 && abs(F_Nuevo)>=Tolerancia) && Iteraciones<=Num_Max_iteraciones
F_A=double(subs(Funcion,x,a));
F_B=double(subs(Funcion,x,b));
X_Nuevo= a-F_A*(b-a)/(F_B-F_A);
F_Nuevo=double(subs(Funcion,x,X_Nuevo));

Iteraciones=Iteraciones+1;
T_Iteraciones=[T_Iteraciones;Iteraciones];
X_A=[X_A;a];
X_B=[X_B;b];
T_FA=[T_FA;F_A];
T_FB=[T_FB;F_B];
T_FN=[T_FN;F_Nuevo];
T_X_Nuevo=[T_X_Nuevo;X_Nuevo];
if F_Nuevo==0
   output=sprintf('su funcion tiene una raiz en %f',X_Nuevo);
elseif F_A*F_Nuevo<0
    b=X_Nuevo;
elseif F_Nuevo*F_B<0
    a=X_Nuevo;
end

end
Tabla_resultados=table(X_A,T_FA,X_B,T_FB,T_X_Nuevo,T_FN);
end