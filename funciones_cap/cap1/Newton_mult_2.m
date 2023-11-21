function [Resultado,tabla,output] = Newton_mult_2(f,Punto_Inicial,tolerancia,niter,Control_E)
syms x
Derivada_1=diff(f);
Derivada_2=diff(Derivada_1);
Puntos=[Punto_Inicial];
Punto_Nuevo=Punto_Inicial-(Funcion_eval(Punto_Inicial,f)*Funcion_eval(Punto_Inicial,Derivada_1))/((Funcion_eval(Punto_Inicial,Derivada_1))^2-(Funcion_eval(Punto_Inicial,f)*Funcion_eval(Punto_Inicial,Derivada_2)));
if Control_E=="Absoluto"
    Error=abs(Punto_Inicial-Punto_Nuevo);
    Error_Tabla=[0;Error];
    Punto_Inicial=Punto_Nuevo;
    Puntos=[Puntos;Punto_Inicial];
    while Error>tolerancia
        Punto_Nuevo=Punto_Inicial-(Funcion_eval(Punto_Inicial,f)*Funcion_eval(Punto_Inicial,Derivada_1))/((Funcion_eval(Punto_Inicial,Derivada_1))^2-(Funcion_eval(Punto_Inicial,f)*Funcion_eval(Punto_Inicial,Derivada_2)));
        Error=abs(Punto_Nuevo-Punto_Inicial);
        Error_Tabla=[Error_Tabla;Error];
        Punto_Inicial=Punto_Nuevo;
        Puntos=[Puntos;Punto_Inicial];
    end
else
    Error=abs((Punto_Inicial-Punto_Nuevo)/Punto_Nuevo);
    Error_Tabla=[0;Error];
    Punto_Inicial=Punto_Nuevo;
    Puntos=[Puntos;Punto_Inicial];
    while Error>tolerancia
        Punto_Nuevo=Punto_Inicial-(Funcion_eval(Punto_Inicial,f)*Funcion_eval(Punto_Inicial,Derivada_1))/((Funcion_eval(Punto_Inicial,Derivada_1))^2-(Funcion_eval(Punto_Inicial,f)*Funcion_eval(Punto_Inicial,Derivada_2)));
        Error=abs((Punto_Nuevo-Punto_Inicial)/Punto_Nuevo);
        Error_Tabla=[Error_Tabla;Error];
        Punto_Inicial=Punto_Nuevo;
        Puntos=[Puntos;Punto_Inicial];
    end
end
if Funcion_eval(Punto_Nuevo,f)==0
    Resultado=Punto_Nuevo;
    tabla=table(Puntos,Error_Tabla);
elseif Error<tolerancia
    output=sprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f',Punto_Inicial,tolerancia);
    Resultado=Punto_Nuevo;
    tabla=table(Puntos,Error_Tabla);
else
    output=sprintf('Fracasó en %f iteraciones',niter);
end
end