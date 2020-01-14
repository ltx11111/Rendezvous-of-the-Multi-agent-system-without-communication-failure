%CHCA
function [P] =getnextpoint_CHCA(point,r,stepr,number)
     P=single(point);

matrix=getAd_Matrix(point,number,r);
[ i_index, j_index ] = find( matrix );
start = 1;
for i=1:number 
A=[point(i,1),point(i,2)];
neighbourhood2=zeros(number,2);%全选邻居
index=1;
neighbourhood2(1,:)=A;
k=[];
%%%%%%%%%%%%非向量化
%    for j=1:number
%        B=[point(j,1),point(j,2)];
%        if matrix(i,j)~=0
%            index=index+1;
%            neighbourhood2(index,:)=B;
%        end
%    end

%%%%%%%%%%%%向量化
    for j=start:size(j_index,1)
        if j_index(j)==i
            index = index+1;
            neighbourhood2(index,:)=point(i_index(j),:);
            
        else
            start = j;
            break;
        end
    end

   neighbourhood2=neighbourhood2(1:index,:);
   neighbourhood2=(unique(neighbourhood2,'rows','stable'));
   l=size(neighbourhood2,1);
   dt = delaunayTriangulation(neighbourhood2(:,1),neighbourhood2(:,2));
   flag=0;
   if size(dt,1)==0
      flag=1;
   else
   k = convexHull(dt);%凸包点的下标
   clear dt;
   end
   n=size(k,1)-1;
   k=k(1:n,:);

   %temp为凸包逆时针下标序列
   %若凸包个数为1或2，直接取
  
               [v,endpoint]=minv_revise_convex(neighbourhood2,r,k,stepr,flag);
%            [v,endpoint]=minv_revise_distance_theta2(neighbourhood2,r,k,stepr,flag);
        if v<=0.01
            v=0;
        end
        P(i,:)=(1-v)*P(i,:)+v*endpoint;
% end
end
