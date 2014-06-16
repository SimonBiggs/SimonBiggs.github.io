function fit = smoothing_spline(x,y,p,xi,w)

[x,i] = sort(x);
y = y(i);
w = w(i);

h = diff(x);

if any(h <= 0)
    hh = ones(size(x));
    hh(2:end) = cumsum(h > 0) + 1; 
    
    wnew = accumarray(hh', w);
    x = accumarray(hh', x .* w) ./ wnew;
    y = accumarray(hh', y .* w) ./ wnew;
    w = wnew;
    
    x = x'; y = y'; w = w';
end

fit = csaps(x,y,p,xi,w);
