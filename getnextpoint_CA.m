%纯全选策略
% internumber在活动区域内的点
function [P] =getnextpoint_CA(point,r,stepr,number)
    P=single(point);
% function [P,newpoint] =getnextpoint6(point,r,number,oldpoint)
% newpoint=point;
%
%     P=point;    
matrix=getAd_Matrix(point,number,r);
[ i_index, j_index ] = find( matrix );
start = 1;
for i=1:number 
A=[point(i,1),point(i,2)];
neighbourhood2=[];%全选邻居
index=1;
neighbourhood2(1,:)=A;
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
        [v,endpoint]=minv_revise(neighbourhood2,r,neighbourhood2,stepr);
        if v<=0.0001
            v=0;
        end
        %加工目标点
        P(i,:)=(1-v)*P(i,:)+v*endpoint;
end
end



