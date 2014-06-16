function output = measurement_uncertainty(app,eng)

if app == 6

	if eng == 6
		output = 0.03;
	end
	
	if eng == 9
		output = 0.023;
	end
	
end

if app == 10

	if eng == 6
		output = 0.012;
	end
	
	if eng == 9
		output = 0.006;
	end
	
	if eng == 12
		output = 0.006;
	end
	
end

if app == 15
	
	if eng == 6
		output = 0.012;
	end
	
	if eng == 9
		output = 0.006;
	end
	
	if eng == 12
		output = 0.006;
	end
	
	if eng == 16
		output = 0.006;
	end
	
end
