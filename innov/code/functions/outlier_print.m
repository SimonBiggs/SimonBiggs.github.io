function outlier_print(identRemNum)

load("data/Measurement Data/Cut-out factors.mat", "app", "eng", "wdth", "lng", "ins")
ratio = wdth./lng;


app = app(identRemNum); eng = eng(identRemNum);
wdView = wdth(identRemNum); rtView = ratio(identRemNum); inView = ins(identRemNum);


index = applicator(app) & energy(eng);
wd = wdth(index); rt = ratio(index); in = ins(index);



resolution = 50;

wdVec = linspace(min(wd),max(wd),resolution);
rtVec = linspace(min(rt),max(rt),resolution);

[wdMesh,rtMesh] = meshgrid(wdVec,rtVec);
inMesh = NaN(size(wdMesh));


p = 0.7;
sigma = 0.1;

for i = 1:resolution

	mu = rtVec(i);
	weighting = normpdf(rt,mu,sigma);
	
	fit = smoothing_spline(wd,in,p,wdVec,weighting);
	inMesh(i,:) = fit;	
	
end

prediction = point_prediction(wdView,rtView,wd,rt,in);

clf; hold on

mesh(wdMesh,rtMesh,inMesh)
plot3(wd,rt,in,'k.','markersize',5)
plot3(wdView,rtView,inView,'r.','markersize',10)
%plot3(wdView,rtView,inView,'ro','linewidth',4,'markersize',10)
plot3(8,0.6,0.99,'color','white') % Workaround to fix color spec of line
plot3([wdView,wdView],[rtView,rtView],[inView,prediction],'--','linewidth',4,'color',[0.5,0.5,0.5])
plot3(wdView,rtView,prediction,'x','linewidth',4,'markersize',5,'color',[0.5,0.5,0.5])

xlabel('Width (cm)')
ylabel('Ratio')
zlabel('Cut-out factor')

