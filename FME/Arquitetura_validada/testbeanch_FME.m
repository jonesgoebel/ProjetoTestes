function  testbeanch
                        
obj = hdlcosim_fmeluma; 

inter = interpolador;
inter.createReg;
inter.Resetcontrole;


rng(3);


 for z=0:300
	disp(z+1)
		
			
					A0 = fi(randi(255), 0, 8, 0);
                    A1 = fi(randi(255), 0, 8, 0);
                    A2 = fi(randi(255), 0, 8, 0);
                    A3 = fi(randi(255), 0, 8, 0);
                    A4 = fi(randi(255), 0, 8, 0);
                    A5 = fi(randi(255), 0, 8, 0);
                    A6 = fi(randi(255), 0, 8, 0);
                    A7 = fi(randi(255), 0, 8, 0);
                    A8 = fi(randi(255), 0, 8, 0);
                    A9 = fi(randi(255), 0, 8, 0);
                    A10 = fi(randi(255), 0, 8, 0);
                    A11 = fi(randi(255), 0, 8, 0);
                    A12 = fi(randi(255), 0, 8, 0);
                    A13 = fi(randi(255), 0, 8, 0);
                    A14 = fi(randi(255), 0, 8, 0);
					
					B0 = fi(randi(255), 0, 8, 0);
                    B1 = fi(randi(255), 0, 8, 0);
                    B2 = fi(randi(255), 0, 8, 0);
					B3 = fi(randi(255), 0, 8, 0);
                    B4 = fi(randi(255), 0, 8, 0);
                    B5 = fi(randi(255), 0, 8, 0);
                    B6 = fi(randi(255), 0, 8, 0);
                    B7 = fi(randi(255), 0, 8, 0);
				
					
                    [LOAD_A,LOAD_B,READY,MVX,MVY,SAD] = step(obj,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,B1,B2,B3,B4,B5,B6,B7);
                    [LOAD_Am,LOAD_Bm,READYm,MVXm,MVYm,SADm] = inter.FME(A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data,A8.data,A9.data,A10.data,A11.data,A12.data,A13.data,A14.data,B0.data,B1.data,B2.data,B3.data,B4.data,B5.data,B6.data,B7.data);

					
					%A = [LOAD_A.data,LOAD_B.data,READY.data,MVX.data,MVY.data,SAD.data];
					%B = [LOAD_Am,LOAD_Bm,READYm,MVXm,MVYm,SADm];
					
					A = [MVX.data,MVY.data,SAD.data];
					B = [MVXm,MVYm,SADm];
					if(READY.data==1 && READYm==1)	
						if(~isequal(A,B))
							disp('DIFFERENT RESULTS')						
							disp(A)
							disp(B)
							return					
						end
					else
						if(~isequal(READY.data,READYm))
							disp('READY DIFFERENT RESULTS')						
							disp(A)
							disp(B)
							return					
						end
					end
					%disp(A)
					%disp(B)
					%disp(' ')
								
	end 
	disp('END SIMULATIONS')
end


