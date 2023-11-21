function [Resultado,tabla,output] = Secante(f,Intervalo,tolerancia,Control_E)
syms x
Punto_Inicial=Intervalo(1,1);
Punto_B=Intervalo(1,2);
Error_t=[0];
Puntos_t=[Punto_Inicial];
if Punto_Inicial>Punto_B || Funcion_eval(Punto_Inicial,f)*Funcion_eval(Punto_B,f)>0
    output=sprintf("El intervalo entregado no es valiso");
    tabla=table();
    Resultado=0;
    return
end
if Control_E=="Absoluto"
        Punto_nuevo=Punto_Inicial-Funcion_eval(Punto_Inicial,f)*((Punto_B-Punto_Inicial)/(Funcion_eval(Punto_B,f)-Funcion_eval(Punto_Inicial,f)));
        Puntos_t=[Puntos_t;Punto_nuevo];
        Error=abs(Punto_Inicial-Punto_nuevo);
        Error_t=[Error_t;Error];
    
    if Funcion_eval(Punto_nuevo,f) == 0
        Resultado=Punto_nuevo;
        fprintf("La raiz de la funcion es %f",Resultado)
        return
    else
        Punto_Inicial=Punto_B;
        Punto_B=Punto_nuevo;
    end
    
    while Funcion_eval(Punto_nuevo,f) ~=0 && abs(Funcion_eval(Punto_nuevo,f))>= tolerancia
        Punto_nuevo=Punto_Inicial-Funcion_eval(Punto_Inicial,f)*((Punto_B-Punto_Inicial)/(Funcion_eval(Punto_B,f)-Funcion_eval(Punto_Inicial,f)));
        Puntos_t=[Puntos_t;Punto_nuevo];
        Error=abs(Punto_Inicial-Punto_nuevo);
        Error_t=[Error_t;Error];
    if Funcion_eval(Punto_nuevo,f) == 0
        Resultado=Punto_nuevo;
        fprintf("La raiz de la funcion es %f",Resultado)
        return
    else
        Punto_Inicial=Punto_B;
        Punto_B=Punto_nuevo;
    end
        
    end
        Resultado=Punto_nuevo;
else
        Punto_nuevo=Punto_Inicial-Funcion_eval(Punto_Inicial,f)*((Punto_B-Punto_Inicial)/(Funcion_eval(Punto_B,f)-Funcion_eval(Punto_Inicial,f)));
        Puntos_t=[Puntos_t;Punto_nuevo];
        Error=abs((Punto_nuevo-Punto_Inicial)/Punto_nuevo);
        Error_t=[Error_t;Error];
    if Funcion_eval(Punto_nuevo,f) == 0
        Resultado=Punto_nuevo;
        output=sprintf("La raiz de la funcion es %f",Resultado);
        return
    else
        Punto_Inicial=Punto_B;
        Punto_B=Punto_nuevo;
    end
    
    while Funcion_eval(Punto_nuevo,f) ~=0 && abs(Funcion_eval(Punto_nuevo,f))>= tolerancia
        Punto_nuevo=Punto_Inicial-Funcion_eval(Punto_Inicial,f)*((Punto_B-Punto_Inicial)/(Funcion_eval(Punto_B,f)-Funcion_eval(Punto_Inicial,f)));
        Puntos_t=[Puntos_t;Punto_nuevo];
        Error=abs((Punto_nuevo-Punto_Inicial)/Punto_nuevo);
        Error_t=[Error_t;Error];
    if Funcion_eval(Punto_nuevo,f) == 0
        Resultado=Punto_nuevo;
        output=sprintf("La raiz de la funcion es %f",Resultado);
        return
    else
        Punto_Inicial=Punto_B;
        Punto_B=Punto_nuevo;
    end
        
    end
        
end
    Resultado=Punto_nuevo;
    tabla=table(Puntos_t,Error_t);
end