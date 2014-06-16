function give = fit_give(x,y,wdth,ratio,ins)

inTrue = point_prediction(x,y,wdth,ratio,ins);


dx = wdth-x; dy = ratio-y;


wdAdj = [wdth,x];
rtAdj = [ratio,y];
inPos = [ins,inTrue + 1];
inNeg = [ins,inTrue - 1];


calcPos = point_prediction(x,y,wdAdj,rtAdj,inPos);
calcNeg = point_prediction(x,y,wdAdj,rtAdj,inNeg);


givePos = (calcPos - inTrue);
giveNeg = (inTrue - calcNeg);

give = max([givePos, giveNeg]);
