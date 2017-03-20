function [T,T1] = transicion_russel(filas, colum, p, obstacle, terminal)
% Define la matriz de transición (T) y la de recompensas (R) para el modelo MDP.
% T(s,a,s'): Matriz tridimensional definida como objeto Matlab
% R: Matriz de dimension (nes,nac), siendo 'nes' el numero de estados y
% 'nac' el de acciones

% Definición del número de estados y de acciones
nes = 12;
nac = 4;

% Matriz Ta auxiliar para calcular T. Ta{a1}, Ta{a2}, ... son matrices de
% dimensión (nes x nac) que define para cada acción 'ai' la matriz de
% transición Ta(s,s')
% Ejemplo: Transición para acción 1
% Ta{1}=[p(1|1) p(2|1) ....     p(nes|1);
%        ...                            ;
%        ...                            ;
%        p(1|nes) p(2|nes) ... p(nes|nes)];
%    
% El vector de estados S=[1:nes]' para un grid G(n x n), donde nes = n x n, se ordena de acuerdo con:
% G = 
%     1     4     7     10
%     2     5     8     11
%     3     6     9     12
% es decir, secuencialmente por filas y columnas empezando por la primera
% de arriba a la izquierda.

%%%%%%%%%%%%%%%%%%%%%%%%%% COMPLETAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ta{1} = [0.9  0   0   0.1   0   0   0   0   0   0   0   0;
%          0.8  0.2 0   0     0   0   0   0   0   0   0   0;
%          0    0.8 0.1 0     0   0.1 0   0   0   0   0   0;
%          0.1  0   0   0.8   0   0   0.1 0   0   0   0   0;
%          0    0   0   0     1   0   0   0   0   0   0   0;
%          0    0   0.1 0     0   0.8 0   0   0.1 0   0   0;
%          0    0   0   0.1   0   0   0.8 0   0   0.1 0   0;
%          0    0   0   0     0   0   0.8 0.1 0   0   0.1 0;
%          0    0   0   0     0   0.1 0   0.8 0   0   0   0.1;
%          0    0   0   0     0   0   0.1 0   0   0.9 0   0;
%          0    0   0   0     0   0   0   0.1 0   0.8 0.1 0;
%          0    0   0   0     0   0   0   0   0.1 0   0.8 0.1];

% Calcula T a partir de Ta: T(s,a,s')=P(s'|s,a)
   for i=1:nac
       T(1:nes,i,1:nes)=Ta{i};
   end
   
% Calcula T1
% T1{N}(s)=k significa la transición más probable (sin ruido) s->k para
% la acción 'N' desde s
%
% G = 
%     1     4     7    10
%     2     5     8    11
%     3     6     9    12
% T1{N} = 
%     1     4     7    10
%     1     4     7    10
%     2     5     8    11
%
% Significa que de  1 va a 1, de 2 va a 1, de 3 va a 2, etc.

%%%%%%%%%%%%%%%%%%%%%%%%%% COMPLETAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% T1= ....
