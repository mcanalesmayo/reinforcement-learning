% Calcula la secuencia de acciones y de estados (coordenadas) más útil
% a partir la matriz T1{p} que representa los estados más probables a los
% que se llega desde cada estado aplicando la política 'p' y de la política
% óptima global 'pop' obtenida mediante aprendizaje

acciones=['^','>','V','<'];
estado_actual=sub2ind(size(T1{1}),ini(1),ini(2));
final=sub2ind(size(T1{1}),fin(1),fin(2));
poli=[];
secuencia=[estado_actual];
while estado_actual~=final
  if estado_actual~=find(obstacle==1)
   [c1,c2]=ind2sub([rows columns],estado_actual);
   pop=p(estado_actual);        % política óptima desde estado_actual
   estado_actual=T1{pop}(c1,c2);  % estado más probable alcanzado desde estado_actual
   poli=[poli pop];
   secuencia=[secuencia;estado_actual];
  end
end
politica_secuencia=acciones(poli)