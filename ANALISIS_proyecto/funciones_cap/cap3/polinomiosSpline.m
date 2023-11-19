function polinomiosStr = polinomiosSpline(coeficientes, puntosX)
    % coeficientes: una matriz donde cada fila contiene los coeficientes
    %              de un polinomio de spline cúbico
    % puntosX: un vector con los puntos x_i que definen los intervalos
    
    numPolinomios = size(coeficientes, 1);
    
    polinomiosStr = cell(numPolinomios, 1);
    
    for i = 1:numPolinomios
        % Obtener los coeficientes del polinomio actual
        a = coeficientes(i, 1);
        b = coeficientes(i, 2);
        c = coeficientes(i, 3);
        d = coeficientes(i, 4);
        
        % Obtener los puntos de inicio y fin del intervalo actual
        xi = puntosX(1,i);
        xi1 = puntosX(1,i + 1);
        
        % Crear el polinomio en formato de cadena
        polinomioStr = sprintf('(%f)*(x)^3 + (%f)*(x)^2 + (%f)*(x) + (%f)', d, c, b, a);
        
        % Guardar el polinomio en la matriz de strings
        polinomiosStr{i} = sprintf('Polinomio para x entre [%f, %f]: %s\n\n', xi, xi1, polinomioStr);
    end
end


