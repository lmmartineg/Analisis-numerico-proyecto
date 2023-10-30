function [solucion,Iteraciones,Tabla_resultados] = Biseccion_lm(Punto_inicial,Delta,Num_iteraciones_Max,Funcion)

syms x
F_inicial=double(subs(Funcion,x,Punto_inicial));
T_iteraciones=[];
T_Puntos=[Punto_inicial];
T_val_funcion=[F_inicial];
if F_inicial==0
    solucion=Punto_inicial;
    fprintf('%f es raiz de f(x)',Punto_inicial) 
else
    Punto_nuevo=Punto_inicial+Delta;
    Iteraciones=1;
    T_iteraciones=[Iteraciones];
    F_nueva=double(subs(Funcion,x,Punto_nuevo));
    while F_inicial*F_nueva>0 && Iteraciones<=Num_iteraciones_Max
        Punto_inicial=Punto_nuevo;
        F_inicial=F_nueva;
        Punto_nuevo=Punto_inicial+Delta;
        F_nueva=double(subs(Funcion,x,Punto_nuevo));
        Iteraciones=Iteraciones+1;
        T_iteraciones=[T_iteraciones;Iteraciones];
        T_Puntos=[T_Puntos;Punto_nuevo];
        T_val_funcion=[T_val_funcion;F_nueva];
    end
    if F_nueva==0
        solucion=Punto_nuevo;
        fprintf('%f es raiz de f(x)',Punto_nuevo)
    elseif F_inicial*F_nueva<0
        solucion=Punto_nuevo;
        fprintf('Existe una raiz de f(x) entre %f y %f',Punto_inicial,Punto_nuevo)
    else
        solucion=Punto_nuevo;
        fprintf('Fracaso en %f iteraciones',Num_iteraciones_Max)
    end
    
    Tabla_resultados=table(T_iteraciones,T_Puntos,T_val_funcion);
end