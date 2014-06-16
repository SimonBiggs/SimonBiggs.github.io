%Octave


addpath('functions')

xMin = -4*pi;
xMax = 4*pi;

x = (xMax - xMin)*rand(1,100)+xMin;
y = sin(x) + 0.5*randn(size(x));
xi = linspace(min(x),max(x),1000);
w = ones(size(x));
p = 0.4;

fit = smoothing_spline(x,y,p,xi,w);
 
midVals = find(x>-2*pi&x<2*pi);
outerVals = find(x<=-2*pi|x>=2*pi);

fitMidVals = smoothing_spline(x(midVals),y(midVals),p,xi,w);
fitOuterVals = smoothing_spline(x(outerVals),y(outerVals),p,xi,w);



figure(1); clf;
plot(x,y,'b.','markersize',8)
xlim([xMin,xMax])

title('Data sampled from sin(x) with random normal noise (standard deviation = 0.5)')
xlabel('x')
ylabel('sin(x) + N/2')

figure(2); clf
plot(x,y,'b.','markersize',8,xi,fit,'k','linewidth',4)
xlim([xMin,xMax])

title('Data fitted with a cubic smoothing spline')
xlabel('x')
ylabel('sin(x) + N/2')




figure(3); clf
plot(x(midVals),y(midVals),'b.','markersize',8,x(outerVals),y(outerVals),'r.','markersize',8,xi,fitMidVals,'k','linewidth',4)
xlim([xMin,xMax])

title('Subset of data fitted with a cubic smoothing spline')
xlabel('x')
ylabel('sin(x) + N/2')


figure(4); clf
plot(x(midVals),y(midVals),'r.','markersize',8,x(outerVals),y(outerVals),'b.','markersize',8,xi,fitOuterVals,'k','linewidth',4)
xlim([xMin,xMax])

title('Subset of data fitted with a cubic smoothing spline')
xlabel('x')
ylabel('sin(x) + N/2')



print_figure(1,"../figures/21_1splineExtrapolation")
print_figure(2,"../figures/21_2splineExtrapolation")
print_figure(3,"../figures/21_3splineExtrapolation")
print_figure(4,"../figures/21_4splineExtrapolation")
