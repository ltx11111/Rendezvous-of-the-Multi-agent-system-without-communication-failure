function point = Scatter( height,number)
%����������������㣬��ȡÿ�������̱ߣ�ȡ������̱����ֵ��Ϊͨ�Ű뾶
%flag Ϊ�������ţ���Ϊ0�����޸İ뾶������뾶�ڴ˻����ϼ�flag
point=zeros(number,2);
% x=binornd(height,0.45,number,1)*rand();
for i=1:number
  
   point(i,1)=height*rand(1);
   point(i,2)=height*rand(1);
end
