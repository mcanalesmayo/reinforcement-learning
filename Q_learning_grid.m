% Aprendizaje Q-learning para grid
clear all;
close all;

trials=500;  % número de episodios  
nbucles=20;   % numero de repeticiones
epsilon=0.90; % exploracion-explotacion epsilon-greedy: 10% exploracion
rec=-0.04;   % recompensa general
gamma=0.95;   % factor de descuento
alfa = 1;    % ratio de aprendizaje
iteracion = 1; % iteración interna

coste_vecindad = 0;

% Inicialización de variables
laberinto = true;
laberinto_file='laberinto.mat';
rows = 20;
columns = 20;
nstates = rows * columns;
nacts = 4;
ns = zeros(1, nstates);

% Estados inicial y objetivo
ini = [1 1];
fin = [18 18];
s_final = fin(1) + rows*(fin(2) - 1);

[terminal, obstacle, p, action_cost, discount_factor, absorb, wrap_around, noop] = world(fin, laberinto);
[T, T2, T1] = mi_mk_grid_world(rows, columns, p, obstacle, terminal, absorb, wrap_around, noop);
R = define_R(terminal, obstacle, action_cost, coste_vecindad, nstates, nacts);
R = R + rec;

utilities = [];
policies = [];

bucle = 0;
while bucle<nbucles   % repeticiones para promediar (opcional)
      
    % Inicialización de variables
    %%%%%%%%%%%%%%%%%%%%% COMPLETAR %%%%%%%%%%%%%%%%%
    Q = R;
    trial = 0;
    alfa = 1;
    while trial<trials    % episodios
        % Selección aleatoria del estado inicial s
        iteracion = 1;
        s = rand_ini(obstacle);
        s = s(1) + rows*(s(2) - 1);
        
        is_terminal = false;
        while ~is_terminal
            % Selección de siguiente estado según probabilidad de transición
            % Utiliza un modelo de transición T(s,s,s')=P(s'|s,a) para simular el comportamiento y generar
            % las muestras
            %%%%%%%%%%%%%%%%%%%%% COMPLETAR %%%%%%%%%%%%%%%%%
            [sig_estado, accion] = seleccion_siguiente(T, Q, epsilon, nacts, s);

            ns(sig_estado) = ns(sig_estado) + 1;
            alfa = ns(sig_estado) / (ns(sig_estado) + iteracion);
            
            % Ecuaciones Q-learning
            %%%%%%%%%%%%%%%%%%%%% COMPLETAR %%%%%%%%%%%%%%%%%
            Q(s, accion) = Q(s, accion) + alfa*(R(s, accion) + gamma*(max(Q(sig_estado, :))) - Q(s, accion));
            s = sig_estado;
            
            iteracion = iteracion + 1;
            
            if s == s_final
                is_terminal = true;
            end
        end
        
        trial = trial + 1;
    end

    % Obtiene las utilidades y la política óptima a partir de Q
    % Acumula U=Vmax de cada bucle para representación
    % Acumula políticas de cada bucle para promedio
    %%%%%%%%%%%%%%%%%%%%% COMPLETAR %%%%%%%%%%%%%%%%%
    
    U = max(Q, [], 2); 
    utilities = [utilities, U];
    [p, U] = calcula_p(Q);
    policies = [policies p];
    
    bucle = bucle + 1;
end

% Representación de variables:
%    Iteraciones V en cada trial
%    Utilidades de estados
%    Política global óptima para todos los estados
%%%%%%%%%%%%%%%%%%%%% COMPLETAR %%%%%%%%%%%%%%%%%
% Utilidad media
U = mean(utilities, 2);   
% Politica de moda
p = mode(policies, 2);
% Redimensiona el vector de 'U' como matriz 'Um' con las dimensiones del grid
Um=reshape(U,[rows columns])

% Dibuja con colores las utilidades 'Um' en el grid
numfigura=1;
dibuja_utilidad(rows,columns,ini,fin,obstacle,terminal,Um,numfigura)

% Ordena las parejas 'utilidad_estados' de menor a mayor
estados=[1:nstates]';
utilidad_estados=sortrows([U estados],1);
% Obtiene las parejas estados-política en 'politica_global'
politica_global=[estados,p];

% Obtiene la política global en la retícula para todos los estados,
% representada como matriz en el grid
pol_global_matriz=flipdim(reshape(politica_global(:,2),[rows columns]),1)

% Calcula la secuencia de acciones y de estados (coordenadas) más útil
% desde el estado inicial al final, a partir de la 'politica_global'
% calculada. 
% Utiliza la matriz T1{a} del modelo
calcula_secuencia;
  
% Dibuja el camino a seguir en el grid desde el estado inicial al final, a
% partir de la secuencia calculada
% ngrafica es el numero correspondiente al gráfico a representar
numfigura=2;
camino = dibuja_camino(rows,columns,ini,fin,obstacle,terminal,secuencia,Um,numfigura)