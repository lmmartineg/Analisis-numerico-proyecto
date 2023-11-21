%MatJacobiSeid: Calcula la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método de Jacobi o
%de Gauss Seidel (Matricial), depende del método elegido, se elige 0 o 1 en met
%respectivamente

function [E, s, T, output] = MatJacobiSeid(x0, A, b, Tol, Control_E, niter, met)
    c = 0;
    error = Tol + 1;
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, +1);
    s = []; % Inicializa la lista de soluciones
    if Control_E == "Relativo"
        while error > Tol && c < niter
            if met == 0
                T = inv(D) * (L + U);
                C = inv(D) * b;
                x1 = T * x0 + C;
            end
            if met == 1
                T = inv(D - L) * U;
                C = inv(D - L) * b;
                x1 = T * x0 + C;
            end
            E(c + 1) = norm(x1 - x0, 'inf') / norm(x1, 'inf');
            error = E(c + 1);
            s(:, c + 1) = x1; % Agrega la solución a la lista 's'
            x0 = x1;
            c = c + 1;
        end
    else
        while error > Tol && c < niter
            if met == 0
                T = inv(D) * (L + U);
                C = inv(D) * b;
                x1 = T * x0 + C;
            end
            if met == 1
                T = inv(D - L) * U;
                C = inv(D - L) * b;
                x1 = T * x0 + C;
            end
            E(c + 1) = norm(x1 - x0, 'inf');
            error = E(c + 1);
            s(:, c + 1) = x1; % Agrega la solución a la lista 's'
            x0 = x1;
            c = c + 1;
        end
    end
    if error < Tol
        T = inv(D)*(L+U);
        radio_espectral = max(abs(eig(T)));
        output = sprintf('%s es una aproximación de la solución del sistema con una tolerancia de %f. El método convergió porque el radio espectral %f es menos que 1.', mat2str(s(:,end)), Tol, radio_espectral);
    else
        T = inv(D)*(L+U);
        radio_espectral = max(abs(eig(T)));
        output = sprintf('Fracasó en %f iteraciones. El método no aseguró su convergencia porque el radio espectral %f es mayor o igual a 1.', niter, radio_espectral);
    end
end