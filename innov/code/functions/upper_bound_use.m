function outputVal = upper_bound_use(inputVal,x,y)

[testInput, testX] = meshgrid(inputVal, x);

test = testInput > testX;
ref = sum(test,1);

y = [y,NaN];
outputVal = y(ref+1);
