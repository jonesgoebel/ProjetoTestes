function  testbeanch
                        
% HdlCosimulation System Object creation
obj = hdlcosim_lumainterpolation; 

inter = interpolador;
inter.createReg;
inter.Resetcontrole;


%samples = [0 1 27 31 93 129 142 199 205 254 255];

%samples = [127 128];
samples = [127 255];

sizesamples = length(samples);
flag=0;

ac=0;

for s=0:0
 for z=0:1
    disp(z);
    for i=1:sizesamples
        for j=1:sizesamples
            for k=1:sizesamples
                for w=1:sizesamples                    
                    A0 = fi(samples(i), 0, 8, 0);
                    A1 = fi(samples(w), 0, 8, 0);
                    A2 = fi(samples(k), 0, 8, 0);
                    A3 = fi(samples(j), 0, 8, 0);
                    A4 = fi(samples(i), 0, 8, 0);
                    A5 = fi(samples(k), 0, 8, 0);
                    A6 = fi(samples(j), 0, 8, 0);
                    A7 = fi(samples(w), 0, 8, 0);
                    A8 = fi(samples(j), 0, 8, 0);
                    A9 = fi(samples(w), 0, 8, 0);
                    A10 = fi(samples(i), 0, 8, 0);
                    A11 = fi(samples(w), 0, 8, 0);
                    A12 = fi(samples(k), 0, 8, 0);
                    A13 = fi(samples(j), 0, 8, 0);
                    A14 = fi(samples(i), 0, 8, 0);

					[READYm,LOAD_Am,LOAD_Bm,ENABLE_RIm,SELETORm,RESET_SADm,ENABLE_SADm,RESET_BEST_SADm] = inter.controle;
					ENABLE_RI = fi(ENABLE_RIm, 0, 1, 0);
					SELETOR = fi(SELETORm, 0, 3, 0);
					
                    [Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,Z37,Z38,Z39,Z40,Z41,Z42,Z43,Z44,Z45,Z46,Z47,Z48,Z49,Z50,Z51,Z52,Z53,Z54,Z55,Z56,Z57,Z58,Z59,Z60,Z61,Z62,Z63] = step(obj,ENABLE_RI,SELETOR,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14);
                    [S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63] = inter.computerInterpolador(ENABLE_RI.data,SELETOR.data,A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data,A8.data,A9.data,A10.data,A11.data,A12.data,A13.data,A14.data);
					%disp([S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63])
					
					A = [S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63];
					B = [Z0.data,Z1.data,Z2.data,Z3.data,Z4.data,Z5.data,Z6.data,Z7.data,Z8.data,Z9.data,Z10.data,Z11.data,Z12.data,Z13.data,Z14.data,Z15.data,Z16.data,Z17.data,Z18.data,Z19.data,Z20.data,Z21.data,Z22.data,Z23.data,Z24.data,Z25.data,Z26.data,Z27.data,Z28.data,Z29.data,Z30.data,Z31.data,Z32.data,Z33.data,Z34.data,Z35.data,Z36.data,Z37.data,Z38.data,Z39.data,Z40.data,Z41.data,Z42.data,Z43.data,Z44.data,Z45.data,Z46.data,Z47.data,Z48.data,Z49.data,Z50.data,Z51.data,Z52.data,Z53.data,Z54.data,Z55.data,Z56.data,Z57.data,Z58.data,Z59.data,Z60.data,Z61.data,Z62.data,Z63.data];
					
					%A = [S0,S1,S2,S3,S4,S5,S6,S7];
					%B = [Z0.data,Z1.data,Z2.data,Z3.data,Z4.data,Z5.data,Z6.data,Z7.data];
					%disp([S0,S1,S2,S3,S4,S5,S6,S7])
					%disp([Z0.data,Z1.data,Z2.data,Z3.data,Z4.data,Z5.data,Z6.data,Z7.data])
					%disp('\n')
					%disp([Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,Z37,Z38,Z39,Z40,Z41,Z42,Z43,Z44,Z45,Z46,Z47,Z48,Z49,Z50,Z51,Z52,Z53,Z54,Z55,Z56,Z57,Z58,Z59,Z60,Z61,Z62,Z63])
					if(ac >= 8)
						if(~isequal(A,B))
							disp('DIFFERENT RESULTS')
							disp([A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data,])
							disp(A)
							disp(B)
							return					
						end
						%disp(A)
						%disp(B)
						%disp(' ')
							
					end
					if (ac<=8)
						ac=ac+1;
					end	
				
				end
                
            end
        end
    
    end
  
 end 
 disp('END SIMULATIONS')
end


