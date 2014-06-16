function prediction = point_prediction(x,y,wdth,ratio,ins)

p = 0.7;
sigma = 0.1;

weighting = normpdf(ratio,y,sigma);

prediction = smoothing_spline(wdth,ins,p,x,weighting);

