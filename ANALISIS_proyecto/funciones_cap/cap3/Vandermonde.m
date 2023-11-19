function D = Vandermonde(x, y, show)
    A = arrayfun(@(xi) xi.^(0:numel(x)-1), x, 'UniformOutput', false);
    A = vertcat(A{:});
    b = y';
    xsol = A\b;
    if show
        disp('Data Points: '); disp([x(:),y(:)]);
        disp('A = '); disp(A);
        disp('cond(A) = '); disp(cond(A));
        disp('b = '); disp(b);
        disp('x = '); disp(xsol);
        disp('Interpolation Function: ');
        disp('F(x) = ');
        syms xS;
        F = sum(xsol.*(xS.^(0:numel(x)-1)));
        disp(F);
    end
    D = struct('M', 'Vandermonde', 'P', xsol, 'x', x, 'y', y);
end