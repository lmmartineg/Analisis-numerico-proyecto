function [L, U] = doolittle(A)
  [m, n] = size(A);
  L = eye(n);
  U = zeros(m, n);

  assert(m == n)
  assert(length(eigs(A)) == n)

  for i = 1:n
    U(i, i:n) = A(i, i:n) - L(i, 1:i-1) * U(1:i-1, i:n);
    L(i+1:n, i) = 1/U(i, i) * (A(i+1:n, i) - L(i+1:n, 1:i-1) * U(1:i-1, i));
  end
end
