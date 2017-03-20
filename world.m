function [terminal,obstacle,p,action_cost,discount_factor,absorb,wrap_around,noop] = world(fin, laberinto)
% Define la estructura del grid a utilizar en la búsqueda

r = 20; c = 20; 
p = 0.8;          % probabilidad de realizar correctamente la acción nominal
action_cost = 0;   % define la recompensa básica
discount_factor = 0.9;  % define el factor de descuento gamma

% Obstáculos
obstacle = zeros(r,c); obstacle(2,2)=1;
obstacle(5,[4:8])=1;
obstacle([10:16],12)=1;

% Define los obstáculos para el laberinto. Se usa sólo para este escenario,
% para grid sencillo no se utiliza
% Script para definir laberinto: 'obstaculos_laberinto.m' 
if laberinto
    obstaculos_laberinto;
end

% Objetivo
terminal = zeros(r,c);
terminal(fin(1),fin(2))=1;

% parámetros de definición de vecindad del grid (no tocar)
absorb = 0;
wrap_around = 0;
noop = 0;

end