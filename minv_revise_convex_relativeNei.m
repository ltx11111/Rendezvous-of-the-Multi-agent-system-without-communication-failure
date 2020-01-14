function [v,target]=minv_revise_convex_relativeNei(neighbourhood,r,k,stepr,flag,neighbourhood2)
startpoint=neighbourhood(1,:);
w=[];
target=0;
 sum=0;
 n=size(k,1);
isedge=0;
tubao=zeros(n,2);
for m=1:n
    tubao(m,:)=neighbourhood(k(m,1),:);
end
 [A,B]=minboundcircle(tubao);
 clear tubao;
for m=1:n
        if m~=n
                if abs((neighbourhood(k(m,1),2)-A(1,2))*(neighbourhood(k(m+1,1),1)-neighbourhood(k(m,1),1))-(neighbourhood(k(m+1,1),2)-neighbourhood(k(m,1),2))*(neighbourhood(k(m,1),1)-A(1,1)))<0.000001*abs((neighbourhood(k(m+1,1),1)-neighbourhood(k(m,1),1))*(neighbourhood(k(m,1),1)-A(1,1)))
                    target = A;
                    isedge=1;
                    break;
                end
        else
                if abs((neighbourhood(k(m,1),2)-A(1,2))*(neighbourhood(k(1,1),1)-neighbourhood(k(m,1),1))-(neighbourhood(k(1,1),2)-neighbourhood(k(m,1),2))*(neighbourhood(k(m,1),1)-A(1,1)))<0.000001*abs((neighbourhood(k(1,1),1)-neighbourhood(k(m,1),1))*(neighbourhood(k(m,1),1)-A(1,1)))
                    target = A;
                    isedge=1;
                    break;
                end
         end
end
if isedge==0
        if flag==0
           for m=1:n
                if m==1
                        left = norm(neighbourhood(k(m+1,1),:)-neighbourhood(k(m,1),:));
                        right = norm(neighbourhood(k(size(k,1),1),:)-neighbourhood(k(m,1),:));
                        w(m)= left+right;
                        sum=sum+w(m);
                 elseif m==size(k,1)
                        left = norm(neighbourhood(k(1,1),:)-neighbourhood(k(m,1),:));
                        right = norm(neighbourhood(k(m-1,1),:)-neighbourhood(k(m,1),:));
                        w(m)= left+right;
                        sum=sum+w(m);
                 else
                        left = norm(neighbourhood(k(m+1,1),:)-neighbourhood(k(m,1),:));
                        right = norm(neighbourhood(k(m-1,1),:)-neighbourhood(k(m,1),:));
                        w(m)= left+right;
                        sum=sum+w(m);
                end
           end
        end

        %是凸包加入自身，不是则不加
             if flag==0
                     for j=1:n
                           target=target+(neighbourhood(k(j,1),:))*w(j)/sum;
                     end
        %          target=A+target*size(temp,1)/(size(temp,1)+1);

             else
                 target(1,1)=(max(neighbourhood(:,1))+min(neighbourhood(:,1)))/2;
                 target(1,2)=(max(neighbourhood(:,2))+min(neighbourhood(:,2)))/2;
             end
end
s=norm(startpoint-target);
temp=0;
if s~=0
    temp=stepr/s;
end
     v=min(computev(neighbourhood2,r,startpoint,target),temp);
end