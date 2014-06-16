function output = progressive_spread(gap,give,slope,dif,binNum)

numVals = length(give);

[sorted.give, i_give] = sort(give);
[sorted.gap, i_gap] = sort(gap);
[sorted.slope, i_slope] = sort(slope);

sorted.dif.give = dif(i_give);
sorted.dif.gap = dif(i_gap);
sorted.dif.slope = dif(i_slope);

nanVec = NaN(1,numVals + 1 - binNum);
sigma.give = nanVec;
sigma.gap = nanVec;
sigma.slope = nanVec;


for i = 1:(numVals + 1 - binNum)

	sigma.give(i) = std( sorted.dif.give(i:(i - 1 + binNum)) );
	sigma.gap(i) = std( sorted.dif.gap(i:(i - 1 + binNum)) );
	sigma.slope(i) = std( sorted.dif.slope(i:(i - 1 + binNum)) );	

end

output.sigma = sigma;
output.sorted = sorted;

