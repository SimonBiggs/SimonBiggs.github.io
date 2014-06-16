function basic_print(wd,rt,in)

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

clf; hold on

mesh(wdMesh,rtMesh,inMesh)
plot3(wd,rt,in,'k.','markersize',15)

xlabel('Width (cm)')
ylabel('Ratio')
zlabel('Cut-out factor')
