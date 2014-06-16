function gap = angle_gap(app,x,y,wdth,ratio)

wdth = wdth/app;
x = x/app;


dx = wdth-x; dy = ratio-y;

if any(dx==0 & dy == 0)
	gap = 0;
	return
end
	
theta = atan(dy./dx);
theta(dx<0) = theta(dx<0) + pi;
theta(dx>0 & dy<0) = theta(dx>0 & dy<0) + 2*pi;
theta(dx==0 & dy > 0) = pi/2;
theta(dx==0 & dy < 0) = 3*pi/2;

test = sort(theta);
test = [test,test(1) + 2*pi];
gap = max(diff(test)*180/pi);
