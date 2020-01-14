function point = Scatter( height,number)
%在正方形内随机撒点，获取每个点的最短边，取所有最短边最大值作为通信半径
%flag 为纠正符号，若为0，则不修改半径，否则半径在此基础上加flag
point=zeros(number,2);
% x=binornd(height,0.45,number,1)*rand();
for i=1:number
  
   point(i,1)=height*rand(1);
   point(i,2)=height*rand(1);
end
