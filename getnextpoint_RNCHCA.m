%相对邻居选择策略
function [P] =new_getnextpoint4_fast2(point,r,stepr,number)
point=single(point);
P=point;
matrix=getAd_Matrix(point,number,r);
[ i_index, j_index ] = find( matrix );
start = 1;
for i=1:number 
A=[point(i,1),point(i,2)];
index=1;
neighbourhood3=[];
neighbourhood3(1,:)=A;
    count=1;
    RelativeNei=[];
    RelativeNei(1,:)=point(i,:);
   %%%%%%%%%%%%向量化
    for j=start:size(j_index,1)
        if j_index(j)==i
            index = index+1;
            neighbourhood3(index,:)=point(i_index(j),:);
            
        else
            start = j;
            break;
        end
    end
    dist = single(distFast(neighbourhood3,neighbourhood3));
    for j=2:size(neighbourhood3,1)
        neighbi=find(dist(1,:)<=dist(1,j));
        neighbj=find(dist(j,neighbi)<=dist(1,j));
        if length(neighbj)<=2
                   count=count+1;
                   RelativeNei(count,:)=neighbourhood3(j,:);
        end
    end
   newneighbourhood2=(unique(neighbourhood3,'rows','stable'));
   dt = delaunayTriangulation(newneighbourhood2(:,1),newneighbourhood2(:,2));
   flag=0;
   k=[];
   if size(dt,1)==0
      flag=1;
   else
      k = convexHull(dt);%凸包点的下标
   end
   clear dt;
   n=size(k,1)-1;
   k=k(1:n,:);
%    if k(1)==i%若为凸包顶点
%        [v,endpoint]=minv_revise_convex_relativeNei(newneighbourhood2,r,k,stepr,flag,RelativeNei);
%    else
%        [v,endpoint]=minv_revise_convex(newneighbourhood2,r,k,stepr,flag);
%    end
            [v,endpoint]=minv_revise_convex_relativeNei(newneighbourhood2,r,k,stepr,flag,RelativeNei);
        if v<=0.01
            v=0;
        end
        P(i,:)=(1-v)*P(i,:)+v*endpoint;
end
end

