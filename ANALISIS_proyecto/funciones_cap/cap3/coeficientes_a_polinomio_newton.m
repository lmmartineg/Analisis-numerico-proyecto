function polinomio_str = coeficientes_a_polinomio_newton(coeficientes)
    n = length(coeficientes);
    
    % Inicializar el polinomio como una cadena vacía
    polinomio_str = '';

    % Iterar a través de los coeficientes
    for i = 1:n
        % Coeficiente actual
        coeficiente_actual = coeficientes(i);
        
        % Si el coeficiente no es cero, agregar término al polinomio
        if coeficiente_actual ~= 0
            % Agregar signo
            if coeficiente_actual > 0 && i > 1
                polinomio_str = strcat(polinomio_str, ' + ');
            elseif coeficiente_actual < 0
                polinomio_str = strcat(polinomio_str, ' - ');
            end

            % Agregar término al polinomio
            if abs(coeficiente_actual) ~= 1 || i == n
                polinomio_str = strcat(polinomio_str, num2str(abs(coeficiente_actual)));
            end

            % Agregar variable si no es el término constante
            if i < n
                polinomio_str = strcat(polinomio_str, 'x');

                % Agregar potencia si es mayor que 1
                if i < n - 1
                    polinomio_str = strcat(polinomio_str, '^', num2str(n - i));
                end
            end
        end
    end

    % Si el polinomio sigue siendo una cadena vacía, asignar '0'
    if isempty(polinomio_str)
        polinomio_str = '0';
    end
end

