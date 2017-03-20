function camino = dibuja_camino(r,c,ini,fin,obstacle,terminal,secuencia,V,fig)
% Dibuja el camino a seguir en el grid desde el estado inicial al final, a
% partir de la secuencia más útil calculada previamente
% Dibuja el camino en un grid coloreado: inicial (rojo), final (marrón), obstáculos (azul), libre (verde)
% Itinerario (amarillo-naranja)

figure(fig)
coordenadas=[];
camino=zeros(r,c);
caminodib=-75*obstacle;
[riesgof,riesgoc]=find(terminal==-1);
orden=1;
for i=1:length(secuencia)
   [c1,c2]=ind2sub([r c],secuencia(i));
   coordenadas=[coordenadas;[c1 c2]];
   camino(end+1-c1,c2)=orden;
   caminodib(c1,c2)=30;
   orden=orden+1;
end
% coordenadas=coordenadas;
caminodib(ini(1),ini(2))=50; caminodib(fin(1),fin(2))=75;
caminodib(riesgof,riesgoc)=65;
caminodibu=[[flipdim(caminodib,1) zeros(r,1)];zeros(1,c+1)];
pcolor(caminodibu)

end



