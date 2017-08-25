function  testbeanch
                        
obj = hdlcosim_sad_reg; 

inter = interpolador;
inter.createReg;
inter.Resetcontrole;

samples = [0 255 245 127 128 110 189 254];

sizesamples = length(samples);


 for z=0:0
	disp(z+1)
	for i=1:sizesamples
		for j=1:sizesamples
			for k=1:sizesamples
				for w=1:sizesamples		
			
			
				
				
				
					A0 = fi(samples(i), 0, 12, 0);
                    A1 = fi(samples(w), 0, 12, 0);
                    A2 = fi(samples(k), 0, 12, 0);
                    A3 = fi(samples(j), 0, 12, 0);
                    A4 = fi(samples(i), 0, 12, 0);
                    A5 = fi(samples(k), 0, 12, 0);
                    A6 = fi(samples(j), 0, 12, 0);
                    A7 = fi(samples(w), 0, 12, 0);
				
				
				
					[READYm,LOAD_Am,LOAD_Bm,ENABLE_RIm,SELETORm,RESET_SADm,ENABLE_SADm,RESET_BEST_SADm] = inter.controle;
					
					RESET_SAD = fi(RESET_SADm, 0, 1, 0);
					ENABLE_SAD = fi(ENABLE_SADm, 0, 1, 0);
					SELETOR = fi(SELETORm, 0, 3, 0);
					RESET_BEST_SAD = fi(RESET_BEST_SADm, 0, 1, 0);
					
                    [MVX,MVY,SAD] = step(obj,RESET_SAD,ENABLE_SAD,SELETOR,RESET_BEST_SAD,A0,A1,A2,A3,A4,A5,A6,A7);
                    [MVXm,MVYm,SADm] = inter.regSAD(RESET_SAD.data,ENABLE_SAD.data,SELETOR.data,RESET_BEST_SAD.data,A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data);

					
					A = [MVX.data,MVY.data,SAD.data];
					B = [MVXm,MVYm,SADm];
					
					
					
					
					if(~isequal(A,B))
						disp('DIFFERENT RESULTS')						
						disp(A)
						disp(B)
						return					
					end
					
					%disp(A)
					%disp(B)
					%disp(' ')
				end	
			end		
		end
	end				
end 
	disp('END SIMULATIONS')
end


