function [] = dibuja_utilidad(r,c,ini,fin,obstacle,terminal,utilidades,nfig)
% Dibuja la matriz de utilidades a seguir en el grid desde el estado inicial al final, a
% Grid coloreado: inicial (rojo), final (marrón), obstáculos (azul), libre (verde)
% Itinerario (amarillo-naranja)

figure(nfig)
title('Utilidades')
utildib=-utilidades*100;
utildib(ini(1),ini(2))=50; utildib(fin(1),fin(2))=75;
[xobstac,yobstac]=find(obstacle==1);
for i=1:length(xobstac)
    utildib(xobstac(i),yobstac(i))=200;
end

utildibe=[flipdim(utildib,1) utildib(:,end);
            utildib(end,:) utildib(end,end)];
pcolor(utildibe)

end

