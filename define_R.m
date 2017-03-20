function R = define_R(terminal,obstacle,action_cost,coste_vecindad,nstates,nact)
% define la matriz de recompensas de dimension (nstates,nact)
% coste_vecindad elevado (-0.2) permite alejarse de la vecindad de obstáculos

cfinal=find(terminal==1);
cnegativo=find(terminal==-1);
coste_obstaculo=action_cost+coste_vecindad;
R = action_cost*ones(nstates, nact);
R(nstates,:) = 0;
[fo,co]=find(obstacle==1);

indices=[[fo,co];[fo,co];[fo,co];[fo,co]];
indobs=sub2ind(size(obstacle),indices(:,1),indices(:,2));
R(indobs,:)=coste_obstaculo;
R(cfinal,:) = 1;
R(cnegativo,:) = -1;
end

