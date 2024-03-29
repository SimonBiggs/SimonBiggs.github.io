function output = fit_output(app,eng,x,y)

addpath('functions')
load_data

disp(['Beginning fit output']); fflush (1);

filenameUncertaintyFit = ["data/Model Data/Uncertainty fits/app",num2str(app),"_eng",num2str(eng)];

load(filenameUncertaintyFit, "store")

boundRef = store.boundRef;
sigmaFit = store.sigma;


numVals = length(x);
nanVec = NaN(1,numVals);

cutOutFactor = nanVec;
give = nanVec;
gap = nanVec;
slope = nanVec;

for i = 1:numVals
	
	give(i) = fit_give(x(i),y(i),wd,rt,in);
	gap(i) = angle_gap(app,x(i),y(i),wd,rt);	
	slope(i) = fit_slope(app,x(i),y(i),wd,rt,in);
	
	if gap(i) < 150
		cutOutFactor(i) = point_prediction(x(i),y(i),wd,rt,in);
	else
		cutOutFactor(i) = NaN;
	end
	
end

calcRef = ~isnan(cutOutFactor);
sigma.give = nanVec; sigma.gap = nanVec; sigma.slope = nanVec; sigma.refit = nanVec;

sigma.give(calcRef) = upper_bound_use(give(calcRef),boundRef.give,sigmaFit.give);
sigma.gap(calcRef) = upper_bound_use(gap(calcRef),boundRef.gap,sigmaFit.gap);
sigma.slope(calcRef) = upper_bound_use(slope(calcRef),boundRef.slope,sigmaFit.slope);
sigma.refit(calcRef) = randomised_factors(app,eng,x(calcRef),y(calcRef));

sigma.give(isnan(sigma.give)) = inf;
sigma.gap(isnan(sigma.gap)) = inf;
sigma.slope(isnan(sigma.slope)) = inf;
sigma.refit(isnan(sigma.refit)) = inf;

sigma.final = max([sigma.give; sigma.gap; sigma.slope; sigma.refit]);

sigma.final(isinf(sigma.final)) = NaN;

output.sigma = sigma.final;
output.cutOutFactor = cutOutFactor;

disp(['Fit output complete']); fflush (1);
