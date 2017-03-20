function [terminal,obstacle,p,action_cost,discount_factor] = world_russel(fin)


r = 3; c = 4; p = 0.8; 
action_cost = -0.04;
discount_factor = 0.9;
obstacle = zeros(r,c); obstacle(2,2)=1;
terminal = zeros(r,c); terminal(fin(1),fin(2))=1; terminal(2,4)=-1;

end

