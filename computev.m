function [v]=computev(neighbourhood,r,startpoint,endpoint)
v=1;

n=size(neighbourhood,1);

%neighbourhood�ĵ�һ��Ԫ��Ϊstartpoint
for i=2:n
    
    minv=1;
    %��1��2��ϵ��
    minv1=1;
    
    minv2=1;
    
     x0=(startpoint(1,1)+neighbourhood(i,1))/2;%���ھӹ��ɵ�Բ��

     y0=(startpoint(1,2)+neighbourhood(i,2))/2;
     

     %Ŀ���б�ʺ�ƫ����

     k=0;

     b=0;

     flag=0;%�ж��Ƿ�ֱ���г��߶α��ʽ

     if startpoint(1,1)==endpoint(1,1)

         flag=1;

     else

         k=(endpoint(1,2)-startpoint(1,2))/(endpoint(1,1)-startpoint(1,1));

         b=startpoint(1,2)-k*startpoint(1,1);

     end
     
     %����ֱ��һ�����

     if flag==0

         A=1+k*k;

         B=2*k*b-2*k*y0-2*x0;

         C=x0*x0+power(b-y0,2)-r*r/4;

         x1=(-B+sqrt(B*B-4*A*C))/(2*A);

         x2=(-B-sqrt(B*B-4*A*C))/(2*A);
         
         %����

           if x1==x2

               minv=0;

           else
               
               
               %����������֮��

               if (endpoint(1,1)-startpoint(1,1))*(x1-startpoint(1,1))>=0
               
                   minv1=min(1,abs(x1-startpoint(1,1))/abs(endpoint(1,1)-startpoint(1,1)));
                   
               else
                   
                   minv1=-1;%�ٽ�
               
               end
               
               if (endpoint(1,1)-startpoint(1,1))*(x2-startpoint(1,1))>=0
               
                   minv2=min(1,abs(x2-startpoint(1,1))/abs(endpoint(1,1)-startpoint(1,1)));
                       
               else
                   
                   minv2=-1;%�ٽ�
                   
               end
 
                    minv=max(minv1,minv2);
                    
               
           end
%�߶δ�ֱ������
      else

       x1=startpoint(1,1);

       y1=y0+sqrt(r*r/4-(x1-x0)*(x1-x0));

       y2=y0-sqrt(r*r/4-(x1-x0)*(x1-x0));
       
        %����

           if y1==y2

               minv=0;

           else
               
               %����������֮��

               if (endpoint(1,2)-startpoint(1,2))*(y1-startpoint(1,2))>=0
               
                   minv1=min(1,abs(y1-startpoint(1,2))/abs(endpoint(1,2)-startpoint(1,2)));
                   
               else
                   
                   minv1=-1;%�ٽ�
               
               end
               
               if (endpoint(1,2)-startpoint(1,2))*(y2-startpoint(1,2))>=0
               
                   minv2=min(1,abs(y2-startpoint(1,2))/abs(endpoint(1,2)-startpoint(1,2)));
                   
               else
                   
                   minv2=-1;%�ٽ�
               
               end
               
              minv=max(minv1,minv2);
               
           end

     end
 
     if minv<v
          
         v=minv;
         
      end
 
end
end