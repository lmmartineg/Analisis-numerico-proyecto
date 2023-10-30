function [tabla] = Punto_fijo(Punto_Inicial,Tolerancia,Control_E,Num_Max_Iteraciones,Funcion_Objetivo,Funcion_Aux)
syms x 
Contador=0;

F_evaluada_Tabla(Contador+1)=double(subs(Funcion_Objetivo,x,Punto_Inicial));
F_evaluada=F_evaluada_Tabla(Contador+1);
Error_tabla(Contador+1)=Tolerancia+1;
Error=Error_tabla(Contador+1);
X_n_Tabla(Contador+1)=Punto_Inicial;
Iteraciones_Tabla(Contador+1)=Contador;
if Control_E=="abs"
    while Error>Tolerancia && F_evaluada ~= 0 && Contador<Num_Max_Iteraciones
        X_n_Tabla(Contador+2)=double(subs(Funcion_Aux,x,Punto_Inicial));
        F_evaluada_Tabla(Contador+2)=double(subs(Funcion_Objetivo,x,X_n_Tabla(Contador+2)));
        F_evaluada=F_evaluada_Tabla(Contador+2);
        Error_tabla(Contador+2)=abs((X_n_Tabla(Contador+2)-Punto_Inicial));
        Error=Error_tabla(Contador+2);
        Punto_Inicial=X_n_Tabla(Contador+2);
        Iteraciones_Tabla(Contador+2)=Contador+1;
        Contador=Contador+1;
    end
        
else
    while Error>Tolerancia && F_evaluada ~= 0 && Contador<Num_Max_Iteraciones
        X_n_Tabla(Contador+2)=double(subs(Funcion_Aux,x,Punto_Inicial));
        F_evaluada_Tabla(Contador+2)=double(subs(Funcion_Objetivo,x,X_n_Tabla(Contador+2)));
        F_evaluada=F_evaluada_Tabla(Contador+2);
        Error_tabla(Contador+2)=abs((X_n_Tabla(Contador+2)-Punto_Inicial)/X_n_Tabla(Contador+2));
        Error=Error_tabla(Contador+2);
        Punto_Inicial=X_n_Tabla(Contador+2);
        Iteraciones_Tabla(Contador+2)=Contador+1;
        Contador=Contador+1;
    end
end
Variables_tabla={'Iteracriones','Valor de Xn','F evaluada','Error'};
if F_evaluada==0
    Iteraciones=Contador;
    tabla=table(Iteraciones_Tabla',X_n_Tabla',F_evaluada_Tabla',Error_tabla','VariableNames',Variables_tabla);
elseif Error<Tolerancia
    fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f',Punto_Inicial,Tolerancia)
    tabla=table(Iteraciones_Tabla',X_n_Tabla',F_evaluada_Tabla',Error_tabla','VariableNames',Variables_tabla);
else
    fprintf('Fracasó en %f iteraciones',niter) 
end
end