function [] = dibuja_utilidad_camino(r,c,ini,fin,obstacle,terminal,utilidades,camino,fig)
% Dibuja la matriz de utilidades a seguir en el grid desde el estado inicial al final, 
% Grid coloreado: inicial (rojo), final (marrón), obstáculos (azul), libre (verde)
% Itinerario (amarillo-naranja)

figure(fig)
title('Utilidades')
utildib=-utilidades*100;

[xobstac,yobstac]=find(obstacle==1);
[fc,cc]=find(camino~=0);
for i=1:length(xobstac)
    utildib(xobstac(i),yobstac(i))=-75;
end

for i=1:length(fc)
    utildib(fc(i),cc(i))=150;
end
utildib(ini(1),ini(2))=70; utildib(fin(1),fin(2))=85;

utildibe=[utildib utildib(:,end);
          utildib(end,:) utildib(end,end)];
pcolor(utildibe)

% figure(6)
% plot3([1:,1:c],[1:r,1:c],utilidades)
end

