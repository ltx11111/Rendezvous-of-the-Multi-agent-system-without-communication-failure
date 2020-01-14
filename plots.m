function[ ]=plots(point,v,stepr,t,method)
max_x=zeros(4,t);
allconnected =1;
% sum=0;
  for i=1:t
           point=(unique(point,'rows'));
%         pause(0.01);
%        plotCoord(point,v);
       
         n=size(point,1);
         if method==1%CA
             point=getnextpoint_CA(point,v,stepr,n);
         elseif method==2%CHCA
             point=getnextpoint_CHCA(point,v,stepr,n);
         elseif method==3%RNCA
             point=getnextpoint_RNCA(point,v,stepr,n);
         else%RNCHCA
              point=getnextpoint_RNCHCA(point,v,stepr,n);
         end
%              point=getnextpoint6(point,v,stepr,n,leader);
       fprintf('%d´Îµü´ú\n',i);
        flag=Standard_judgeending(point);
      if flag==1
          break;
      end
  end

