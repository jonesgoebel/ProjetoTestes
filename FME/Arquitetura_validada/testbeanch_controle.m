function  testbeanch
                        
obj = hdlcosim_controle; 

inter = interpolador;
inter.createReg;
inter.Resetcontrole;


 for z=0:300
		disp(z+1)


                    [READY,LOAD_A,LOAD_B,ENABLE_RI,SELETOR,RESET_SAD,ENABLE_SAD,RESET_BEST_SAD] = step(obj);
                    [READYm,LOAD_Am,LOAD_Bm,ENABLE_RIm,SELETORm,RESET_SADm,ENABLE_SADm,RESET_BEST_SADm] = inter.controle;

					
					A = [READY.data,LOAD_A.data,LOAD_B.data,ENABLE_RI.data,SELETOR.data,RESET_SAD.data,ENABLE_SAD.data,RESET_BEST_SAD.data];
					B = [READYm,LOAD_Am,LOAD_Bm,ENABLE_RIm,SELETORm,RESET_SADm,ENABLE_SADm,RESET_BEST_SADm];
					
					
					
					
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
	disp('END SIMULATIONS')
end


