function [] = dibuja_escenario(r,c,ini,fin,obstacle,terminal,numfigura)
% Dibuja el escenario en el grid desde el estado inicial al final, 
% Grid coloreado: inicial (rojo), final (marrón), obstáculos (azul), libre (verde)

figure(numfigura)
escenadib=zeros(r,c);
escenadib=-75*obstacle;
[riesgof,riesgoc]=find(terminal==-1);
escenadib(ini(1),ini(2))=50; escenadib(fin(1),fin(2))=75;
escenadib(riesgof,riesgoc)=65;

escenadibe=[flipdim(escenadib,1) escenadib(:,end);
            escenadib(end,:) escenadib(end,end)];

pcolor(escenadibe)
end

