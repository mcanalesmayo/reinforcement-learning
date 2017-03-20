function Q = Q_from_V(V, T, R, discount_factor)
% Q(s,a) = R(s,a) + sum_s' T(s,a,s') * gamma * V(s')

S = size(T,1);
A = size(T,2);
Q = zeros(S,A);

for a=1:A
    
  % COMPLETAR. Calcular la matriz Q(s,a) mediante la ecuación de Bellman a
  % partir de V. Inicialmente V=R
  
  Q(:, a) = R(:, a) + discount_factor*(squeeze(T(:, a, :))*V);

end

