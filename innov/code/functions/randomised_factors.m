function sigmaRefit = randomised_factors(app,eng,x,y)

addpath('functions')
load_data
disp(['Beginning randomised factors']); fflush (1);

iter = 1000;

numInputs = length(x);
numData = length(wd);

predictedFactors = NaN(iter,numInputs);


inAdj = randn(iter*numInputs,numData)*measurement_uncertainty(app,eng) + in;

tic

for i = 1:iter
	for j = 1:numInputs

		predictedFactors(i,j) = point_prediction(x(j),y(j),wd,rt,inAdj( (numInputs*(i-1) + j) ,:));
	
	end
	
	if toc > 10
		percentage = floor(i / iter * 10000)/100;
		disp([num2str(percentage), '% of randomising at point']); fflush (1);
		tic
	end	
	
end

sigmaRefit = std(predictedFactors);
disp(['Finished randomised factors']); fflush (1);
