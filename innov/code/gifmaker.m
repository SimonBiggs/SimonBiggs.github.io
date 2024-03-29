%octave

addpath('functions')


h = figure(7);

clf; hold on


W = 9; H = 6;
set(h,'PaperUnits','inches')
set(h,'PaperOrientation','landscape');
set(h,'PaperSize',[H,W])
set(h,'PaperPosition',[0,0,W,H])

FN = findall(h,'-property','FontName');
set(FN,'FontName','CMU Serif');
FS = findall(h,'-property','FontSize');
set(FS,'FontSize',8);



mesh(xMesh,yMesh,zMesh)
plot3(x,y,z,'b.','markersize',10)

plot3(4.3,0.9,0.998,'r*','markersize',15,'linewidth',2)





xlabel('Width (cm)')
ylabel('Aspect Ratio')
zlabel('Cut-out Factor')
title('Animation of surface fit with a red star at width 4.3 and aspect ratio 0.9')

grid
set(gca,'ZTick',0.98:0.01:1.02)
set(gca,'XTick',3:10)
set(gca,'YTick',0.4:0.1:1)


margin = 0.1;
xlim([min(x)-range(x)*margin,max(x)+range(x)*margin])
ylim([min(y)-range(y)*margin,max(y)+range(y)*margin])

view([340,25])



n = 20;
%anglevals  = [[30:5:360,5:5:360,5:5:25]',(30*(cos(linspace(0,2*pi,144)))+10)'];
anglevals  = [(340 + 20/2*(sin(linspace(-pi/2,pi/2,n))+1))',(25 + 65/2*(sin(linspace(-pi/2,pi/2,n))+1))'];

removeZTicks = floor(2*n/3);
for i1 = 1:length(anglevals(:,1))
	
	figure(7); clf; hold on

	W = 8; H = 6;
	set(h,'PaperUnits','inches')
	set(h,'PaperOrientation','landscape');
	set(h,'PaperSize',[H,W])
	set(h,'PaperPosition',[0,0,W,H])

	FN = findall(h,'-property','FontName');
	set(FN,'FontName','CMU Serif');
	FS = findall(h,'-property','FontSize');
	set(FS,'FontSize',12);



	mesh(xMesh,yMesh,zMesh)
	plot3(x,y,z,'b.','markersize',10)

	plot3(4.3,0.9,0.998,'r*','markersize',15,'linewidth',2)





	xlabel('Width (cm)')
	ylabel('Aspect Ratio')
	zlabel('Cut-out Factor')
	title('Animation of surface fit with a red star at width 4.3 and aspect ratio 0.9')

	grid
	set(gca,'ZTick',0.98:0.01:1.02)
	set(gca,'XTick',3:10)
	set(gca,'YTick',0.4:0.1:1)


	margin = 0.1;
	xlim([min(x)-range(x)*margin,max(x)+range(x)*margin])
	ylim([min(y)-range(y)*margin,max(y)+range(y)*margin])

    view(anglevals(i1,:))
    string = leadingzeronum(i1);

	if i1 >= removeZTicks
		set(gca,'ZTick',[])
		zlabel(' ')
	end
    print (['gif_files/',string,'.png'], '-dpng')

	
    pause(3)
end

if 0
plot3(x,y,1.3*ones(size(x)),'k.','markersize',10)
plot3(4.3,0.9,1.3,'r*','markersize',15,'linewidth',2)

view([0,90])

string = leadingzeronum(i1 + 1);
print (['gif_files/',string,'.png'], '-dpng')

end
