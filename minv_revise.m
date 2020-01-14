function [v,endpoint]=minv_revise(neighbourhood,r,point,stepr)
startpoint=neighbourhood(1,:);
%%%%%%%%%%%%%%%%%%%%%%圆心运动法
R=minboundcircle(point);
endpoint=R(1,1:2);

% endpoint = startpoint;
% sum = 0;
% for i=1:size(neighbourhood,1)
%     sum = sum + norm(neighbourhood(i,:) - startpoint);
% end
% 
% for i=1:size(neighbourhood,1)
%     endpoint = endpoint + norm(neighbourhood(i,:) - startpoint)/sum*(neighbourhood(i,:) - startpoint);
% end
%%%%%%%%%%%%%%%%%%%%%%krause平均模型
%     endpoint=sum(point)/length(point);
%%%%%%%%%%%%%%%%%%%%%%最远圆心模型
%       endpoint=getfarpoint(startpoint,point);
s=norm(startpoint-endpoint);
temp=0;
if s~=0
    temp=stepr/s;
end
  v=min(computev(neighbourhood,r,startpoint,endpoint),temp);
end
