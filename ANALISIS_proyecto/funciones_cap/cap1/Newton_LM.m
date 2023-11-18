function [Punto_Inicial,tabla] = Newton_LM(Punto_Inicial,Tolerancia,Num_Max_Iteraciones,Funcion_Objetivo,Control_E)

syms x
Derivada=diff(Funcion_Objetivo);
Contador=0;
Funcion_Eval_Tabla(Contador+1)=double(subs(Funcion_Objetivo,x,Punto_Inicial));
Funcion_Eval=Funcion_Eval_Tabla(Contador+1);
Derivada_Eval_Tabla(Contador+1)=double(subs(Derivada,x,Punto_Inicial));
Derivada_Eval=Derivada_Eval_Tabla;
Error_Tabla(Contador+1)=Tolerancia+1;
Error=Error_Tabla(Contador+1);
X_n_Tabla(Contador+1)=Punto_Inicial;
if Control_E=="Absoluto"
    while Error>Tolerancia && Contador<Num_Max_Iteraciones
        X_n_Tabla(Contador+2)=Punto_Inicial-Funcion_Eval/Derivada_Eval;
        Funcion_Eval_Tabla(Contador+2)=double(subs(Funcion_Objetivo,x,X_n_Tabla(Contador+2)));
        Funcion_Eval=Funcion_Eval_Tabla(Contador+2);
        Derivada_Eval_Tabla(Contador+2)=double(subs(Derivada,x,X_n_Tabla(Contador+2)));
        Derivada_Eval=Derivada_Eval_Tabla(Contador+2);
        Error_Tabla(Contador+2)=abs(X_n_Tabla(Contador+2)-Punto_Inicial);
        Error=Error_Tabla(Contador+2);
        Punto_Inicial=X_n_Tabla(Contador+2);
        Contador=Contador+1;
    end
else
    while Error>Tolerancia && Contador<Num_Max_Iteraciones
    X_n_Tabla(Contador+2)=Punto_Inicial-Funcion_Eval/Derivada_Eval;
    Funcion_Eval_Tabla(Contador+2)=double(subs(Funcion_Objetivo,x,X_n_Tabla(Contador+2)));
    Funcion_Eval=Funcion_Eval_Tabla(Contador+2);
    Derivada_Eval_Tabla(Contador+2)=double(subs(Derivada,x,X_n_Tabla(Contador+2)));
    Derivada_Eval=Derivada_Eval_Tabla(Contador+2);
    Error_Tabla(Contador+2)=abs((X_n_Tabla(Contador+2)-Punto_Inicial)/X_n_Tabla(Contador+2));
    Error=Error_Tabla(Contador+2);
    Punto_Inicial=X_n_Tabla(Contador+2);
    Contador=Contador+1;

    end
end
if Funcion_Eval==0
    fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',Punto_Inicial,Tolerancia)
elseif Error<Tolerancia
    fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',Punto_Inicial,Tolerancia)
elseif Derivada_Eval==0
    fprintf('%f es una posible raiz múltiple de f(x) \n',Punto_Inicial)
else
    fprintf('Fracasó en %f iteraciones \n',Num_Max_Iteraciones) 
end

 Variables_tabla={'x_n','F(x) evaluada','Error'};
 tabla=table(X_n_Tabla',Funcion_Eval_Tabla',Error_Tabla','VariableNames',Variables_tabla);

end