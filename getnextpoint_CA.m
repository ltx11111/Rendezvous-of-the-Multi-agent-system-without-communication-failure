%��ȫѡ����
% internumber�ڻ�����ڵĵ�
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
neighbourhood2=[];%ȫѡ�ھ�
index=1;
neighbourhood2(1,:)=A;
%%%%%%%%%%%%��������
%    for j=1:number
%        B=[point(j,1),point(j,2)];
%        if matrix(i,j)~=0
%            index=index+1;
%            neighbourhood2(index,:)=B;
%        end
%    end

%%%%%%%%%%%%������
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
        %�ӹ�Ŀ���
        P(i,:)=(1-v)*P(i,:)+v*endpoint;
end
end



