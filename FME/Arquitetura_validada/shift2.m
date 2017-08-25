function s = shift2(aux)
            
		s = zeros(8);
		[a b] = size(aux);
		for i = 1:(a*b)
			s(i) = floor(((aux(i)/64)+1)/2);
        end 
    end