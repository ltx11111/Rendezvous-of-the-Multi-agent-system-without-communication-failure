function C=getAd_Matrix(point,number,R)
% C=zeros(number,number);
% for i=1:number 
%    for j=i+1:number
%        A=[point(i,1),point(i,2)];
%        B=[point(j,1),point(j,2)];
%        s=norm(A-B);
%        if s<=R&&s~=0
%           C(i,j)=1;
%           C(j,i)=1;
%        else
%           C(i,j)=0;
%           C(j,i)=0;
%        end
%     end
% end
temp = ones(2,number);
% C=single(temp'*(point.^2)'+point.^2*temp-2*(point*point'))+eye(number,number);
C=single(temp'*(point.^2)'+point.^2*temp-2*(point*point'));
C=single(bsxfun(@le,C,R)-bsxfun(@eq,C,0));
% C=C+eye(number,number);
