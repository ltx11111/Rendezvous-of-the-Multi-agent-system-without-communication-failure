% function[ ]=plotCoord(point,number)
% Ad_Matrix=getAd_Matrix(point,number);
% G=graph(Ad_Matrix);
% p=plot(G);
% ylabel('Y','fontname','Times New Roman','fontweight','bold','fontsize',16);
% xlabel('X','fontname','Times New Roman','fontweight','bold','fontsize',16);
% p.XData=point(:,1);
% p.YData=point(:,2);
%  axis([-4 4 -4 4]);
% axis square
% end
%  
function  plotCoord(point,R)
point=single(point);
n=size(point,1);
Ad_Matrix= getAd_Matrix(point,n,1);
G = graph(Ad_Matrix); 
% Ad_Matrix= getAD_choose4(point,R,n);
% G = graph(Ad_Matrix); 
p = plot(G);
ylabel('Y','Rotation',0,'fontname','Times New Roman', 'fontweight', 'bold', 'fontsize', 20);
xlabel('X', 'fontname', 'Times New Roman', 'fontweight', 'bold', 'fontsize',20);
p.XData= point(:,1);
p.YData= point(:,2);
%           axis([-20 20 -20 20]);
          axis([0 15 0 15]);
          set(gca,'FontSize',20)
set(get(gca,'XLabel'),'FontSize',20);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',20);
axis square
end
