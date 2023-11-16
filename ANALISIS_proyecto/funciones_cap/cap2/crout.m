function [L, U] = crout(A)
  [m, n] = size(A);
  L = zeros(n, n);
  U = eye(n);

  assert(m == n)
  assert(length(eigs(A)) == n)

  for j = 1:n
    L(j:n, j) = A(j:n, j) - L(j:n, 1:j-1) * U(1:j-1, j);
    U(j, j+1:n) = 1 / L(j, j) * (A(j, j+1:n) - L(j, 1:j-1) * U(1:j-1, j+1:n));
  end
end
