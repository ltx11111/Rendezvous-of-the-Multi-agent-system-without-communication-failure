function [v]=computev(neighbourhood,r,startpoint,endpoint)
v=1;

n=size(neighbourhood,1);

%neighbourhood的第一个元素为startpoint
for i=2:n
    
    minv=1;
    %解1和2的系数
    minv1=1;
    
    minv2=1;
    
     x0=(startpoint(1,1)+neighbourhood(i,1))/2;%与邻居构成的圆心

     y0=(startpoint(1,2)+neighbourhood(i,2))/2;
     

     %目标点斜率和偏移量

     k=0;

     b=0;

     flag=0;%判断是否垂直，列出线段表达式

     if startpoint(1,1)==endpoint(1,1)

         flag=1;

     else

         k=(endpoint(1,2)-startpoint(1,2))/(endpoint(1,1)-startpoint(1,1));

         b=startpoint(1,2)-k*startpoint(1,1);

     end
     
     %不垂直的一般情况

     if flag==0

         A=1+k*k;

         B=2*k*b-2*k*y0-2*x0;

         C=x0*x0+power(b-y0,2)-r*r/4;

         x1=(-B+sqrt(B*B-4*A*C))/(2*A);

         x2=(-B-sqrt(B*B-4*A*C))/(2*A);
         
         %相切

           if x1==x2

               minv=0;

           else
               
               
               %解在两个点之间

               if (endpoint(1,1)-startpoint(1,1))*(x1-startpoint(1,1))>=0
               
                   minv1=min(1,abs(x1-startpoint(1,1))/abs(endpoint(1,1)-startpoint(1,1)));
                   
               else
                   
                   minv1=-1;%假解
               
               end
               
               if (endpoint(1,1)-startpoint(1,1))*(x2-startpoint(1,1))>=0
               
                   minv2=min(1,abs(x2-startpoint(1,1))/abs(endpoint(1,1)-startpoint(1,1)));
                       
               else
                   
                   minv2=-1;%假解
                   
               end
 
                    minv=max(minv1,minv2);
                    
               
           end
%线段垂直解得情况
      else

       x1=startpoint(1,1);

       y1=y0+sqrt(r*r/4-(x1-x0)*(x1-x0));

       y2=y0-sqrt(r*r/4-(x1-x0)*(x1-x0));
       
        %相切

           if y1==y2

               minv=0;

           else
               
               %解在两个点之间

               if (endpoint(1,2)-startpoint(1,2))*(y1-startpoint(1,2))>=0
               
                   minv1=min(1,abs(y1-startpoint(1,2))/abs(endpoint(1,2)-startpoint(1,2)));
                   
               else
                   
                   minv1=-1;%假解
               
               end
               
               if (endpoint(1,2)-startpoint(1,2))*(y2-startpoint(1,2))>=0
               
                   minv2=min(1,abs(y2-startpoint(1,2))/abs(endpoint(1,2)-startpoint(1,2)));
                   
               else
                   
                   minv2=-1;%假解
               
               end
               
              minv=max(minv1,minv2);
               
           end

     end
 
     if minv<v
          
         v=minv;
         
      end
 
end
end