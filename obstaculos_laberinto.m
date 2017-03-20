% Define los obstáculos para el laberinto

% marco para laberinto
obstacle([1:13],2)=1; obstacle([15:r-1],2)=1; obstacle([1:15],c-1)=1; obstacle([17:r-1],c-1)=1;
obstacle(1,[2:6])=1; obstacle(1,[8:15])=1; obstacle(1,[17:c-1])=1; 
obstacle(r-1,[2:13])=1; obstacle(r-1,[15:c-1])=1;
% %paredes para laberinto
obstacle(10,[3:5])=1; obstacle(5,[15:c-2])=1; 
obstacle(8,[8:7])=1; obstacle(15,[12:15])=1;
obstacle([3:5],8)=1; obstacle([3:4],12)=1; obstacle([11:r-2],16)=1;
obstacle([14:18],7)=1; obstacle([6:8],14)=1; obstacle(8,[10:14])=1; 