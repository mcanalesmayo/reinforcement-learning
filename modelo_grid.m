% Modelo MDP Grid
% matrices para RL-Learning


Tgrid=T;

Ta1=squeeze(Tgrid(:,1,:));
Ta2=squeeze(Tgrid(:,2,:));
Ta3=squeeze(Tgrid(:,3,:));
Ta4=squeeze(Tgrid(:,4,:));
clear T
T{1}=Ta1(1:end-1,1:end-1);
T{2}=Ta2(1:end-1,1:end-1);
T{3}=Ta3(1:end-1,1:end-1);
T{4}=Ta4(1:end-1,1:end-1);


[filas,colum]=size(obstacle);

nes=filas*colum;
nac=4;
[xobstac,yobstac]=find(obstacle==1);
obstacvec=[];
for i=1:colum
    obstacvec=[obstacvec; obstacle(1:end,i)];
end

[len,col]=size(obstacvec);
sobstac=find(obstacvec==1);
sterminalpos=find(R(:,1)==1);
sterminalneg=find(R(:,1)==-1);
terminalneg=zeros(1,len);
terminalneg(sterminalneg)=1;
terminalpos=zeros(1,len);
terminalpos(sterminalpos)=1;
obstac=zeros(1,len);
for i=1:nac
    for j=1:len
      T{i}(sterminalpos,j)=terminalpos(j);
      T{i}(sterminalneg,j)=terminalneg(j);
      T{i}(sobstac,j)=obstac(j);
    end
end

