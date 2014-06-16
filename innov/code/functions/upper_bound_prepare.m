function outputVal = upper_bound_prepare(inputVal,xInput,yInput,binHold)

x = [xInput(1:(end + 1 - binHold)),xInput(end)];
y = [yInput,yInput(end),NaN];

[testInput, testX] = meshgrid(inputVal, x);

test = testInput >= testX;
ref = sum(test,1);

ref(ref == 0) = 1;

outputVal = y(ref);
