% Encuentra un estado inicial que no sea un obstaculo
function ini = rand_ini(obstacles)
    found = false;
    while ~found
        ini = [randi(size(obstacles, 1)) randi(size(obstacles, 2))];
        if ~obstacles(ini(1), ini(2))
            found = true;
        end
    end
end

