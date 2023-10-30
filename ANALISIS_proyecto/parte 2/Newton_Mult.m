function [Resultado,tabla]=Newton_Mult(f,Punto_Inicial,tolerancia,m,niter,Control_E)
syms x
Derdivada=diff(f);
Puntos=[Punto_Inicial];
Punto_Nuevo=Punto_Inicial-m*(Funcion_eval(Punto_Inicial,f)/Funcion_eval(Punto_Inicial,Derdivada));

if Control_E=="abs"
    Error=abs(Punto_Nuevo-Punto_Inicial);
    Error_Tabla=[0;Error];
    Punto_Inicial=Punto_Nuevo;
    Puntos=[Puntos;Punto_Inicial];
    while Error>tolerancia
        Punto_Nuevo=Punto_Inicial-m*(Funcion_eval(Punto_Inicial,f)/Funcion_eval(Punto_Inicial,Derdivada));
        Error=abs(Punto_Nuevo-Punto_Inicial);
        Error_Tabla=[Error_Tabla;Error];
        Punto_Inicial=Punto_Nuevo;
        Puntos=[Puntos;Punto_Inicial];
    end
else
    Error=abs((Punto_Nuevo-Punto_Inicial)/Punto_Nuevo);
    Error_Tabla=[0;Error];
    Punto_Inicial=Punto_Nuevo;
    Puntos=[Puntos;Punto_Inicial];
    while Error>tolerancia
        Punto_Nuevo=Punto_Inicial-m*(Funcion_eval(Punto_Inicial,f)/Funcion_eval(Punto_Inicial,Derdivada));
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
    fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f',Punto_Inicial,tolerancia)
    Resultado=Punto_Nuevo;
    tabla=table(Puntos,Error_Tabla);
else
    fprintf('Fracasó en %f iteraciones',niter) 
end

end
