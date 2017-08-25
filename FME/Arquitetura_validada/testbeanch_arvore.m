function  testbeanch
                        
% HdlCosimulation System Object creation
obj = hdlcosim_arvore_sad; 

inter = interpolador;
inter.createReg;


%samples = [0 1 27 31 93 129 142 199 205 254 255];

%samples = [127 128];
samples = [0 1 49 127 128 142 205 255];

sizesamples = length(samples);
flag=0;

ac=0;

for s=0:0
 for z=0:0
    disp(z);
    for i=1:sizesamples
        for j=1:sizesamples
            for k=1:sizesamples
                for w=1:sizesamples
                    seletor  =fi(z, 0, 3, 0);
                    enable  = fi(1, 0, 3, 0);
                    A0 = fi(samples(i), 0, 12, 0);
                    A1 = fi(samples(w), 0, 12, 0);
                    A2 = fi(samples(k), 0, 12, 0);
                    A3 = fi(samples(j), 0, 12, 0);
                    A4 = fi(samples(i), 0, 12, 0);
                    A5 = fi(samples(k), 0, 12, 0);
                    A6 = fi(samples(j), 0, 12, 0);
                    A7 = fi(samples(w), 0, 12, 0);
                    A8 = fi(samples(j), 0, 12, 0);
                    A9 = fi(samples(w), 0, 12, 0);
                    A10 = fi(samples(i), 0, 12, 0);
                    A11 = fi(samples(w), 0, 12, 0);
                    A12 = fi(samples(k), 0, 12, 0);
                    A13 = fi(samples(j), 0, 12, 0);
                    A14 = fi(samples(i), 0, 12, 0);
					
					A15 = fi(samples(i), 0, 8, 0);
					A16 = fi(samples(k), 0, 8, 0);
					A17 = fi(samples(j), 0, 8, 0);
					A18 = fi(samples(w), 0, 8, 0);


                    [Z0,Z1,Z2,Z3,Z4,Z5,Z6,Z7] = step(obj,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A0,A1,A2,A3,A15,A16,A17,A18,A15,A16,A17,A18);
                    [S0,S1,S2,S3,S4,S5,S6,S7] = arvore(A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data,A8.data,A9.data,A10.data,A11.data,A12.data,A13.data,A14.data,A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data,A8.data,A9.data,A10.data,A11.data,A12.data,A13.data,A14.data,A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data,A8.data,A9.data,A10.data,A11.data,A12.data,A13.data,A14.data,A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data,A8.data,A9.data,A10.data,A11.data,A12.data,A13.data,A14.data,A0.data,A1.data,A2.data,A3.data,A15.data,A16.data,A17.data,A18.data,A15.data,A16.data,A17.data,A18.data);
					%disp([S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63])

					A = [S0,S1,S2,S3,S4,S5,S6,S7];
					B = [Z0.data,Z1.data,Z2.data,Z3.data,Z4.data,Z5.data,Z6.data,Z7.data];
					
					%disp(A)
					if(~isequal(A,B))
						disp('DIFFERENT RESULTS')
						disp([A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data])
						disp(A)
						disp(B)
						return					
					end
					
				end
                
            end
        end
    
    end
  
 end 
 disp('END SIMULATIONS')
end


