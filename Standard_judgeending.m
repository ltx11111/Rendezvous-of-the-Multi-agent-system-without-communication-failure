function [flag]=Standard_judgeending(point)
flag=0;
num=size(point,1);
total=sum(point);
avg=total/num;
RDV=0;
for i=1:num
    RDV=RDV+norm(point(i,:)-avg)*norm(point(i,:)-avg)/num;
end
%    if RDV<0.0000001
   if RDV<0.01
      flag=1;
   end