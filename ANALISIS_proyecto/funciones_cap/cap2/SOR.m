%SOR: Calcula la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método Gauss Seidel (relajado), depende del valor de w 
%entre (0,2)

function [E, s] = SOR(x0, A, b, Tol, niter, w, Control_E)
    c = 0;
    error = Tol + 1;
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, +1);
    s = []; % Inicializa la lista de soluciones
    while error > Tol && c < niter
        T = inv(D - w * L) * ((1 - w) * D + w * U);
        C = w * inv(D - w * L) * b;
        x1 = T * x0 + C;
        
        if Control_E == "Relativo"
            E(c + 1) = norm(x1 - x0, 'inf') / norm(x1, 'inf');
            error = E(c + 1);
        else
            E(c + 1) = norm(x1 - x0, 'inf');
            error = E(c + 1);
        end
        
        s(:, c + 1) = x1; % Agrega la solución a la lista 's'
        x0 = x1;
        c = c + 1;
    end
    if error < Tol
        fprintf('Es una aproximación de la solución del sistema con una tolerancia = %f\n', Tol)
    else
        fprintf('Fracasó en %f iteraciones\n', niter)
    end
end