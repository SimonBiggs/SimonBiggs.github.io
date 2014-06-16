function sigma = force_increasing(sigma)

for i = 2:length(sigma.give)
	
	if sigma.give(i) < sigma.give(i-1)
		sigma.give(i) = sigma.give(i-1);
	end
	
	if sigma.gap(i) < sigma.gap(i-1)
		sigma.gap(i) = sigma.gap(i-1);
	end
	
	if sigma.slope(i) < sigma.slope(i-1)
		sigma.slope(i) = sigma.slope(i-1);
	end

end
