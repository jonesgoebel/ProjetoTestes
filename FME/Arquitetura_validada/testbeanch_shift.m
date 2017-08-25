function  testbeanch_shift
                        
% HdlCosimulation System Object creation
obj = hdlcosim_shift; 


%samples = [0 1 27 31 93 129 142 199 205 254 255];

%samples = [0 1 27 254 255];
samples = [250 30040 15890 6777 35791];

sizesamples = length(samples);
flag=0;

for s=0:0
 for z=0:1
    disp(z);
    for i=1:sizesamples
        for j=1:sizesamples
            for k=1:sizesamples
                for w=1:sizesamples
                    A0 = fi(samples(i), 1, 17, 0);
                    A1 = fi(samples(w), 1, 17, 0);
                    A2 = fi(samples(k), 1, 17, 0);
                    A3 = fi(samples(j), 1, 17, 0);
                    A4 = fi(samples(i), 1, 17, 0);
                    A5 = fi(samples(k), 1, 17, 0);
                    A6 = fi(samples(w), 1, 17, 0);
                    A7 = fi(samples(w), 1, 17, 0);
                    
					M(1)=A0.data;
					M(2)=A1.data;
					M(3)=A2.data;
					M(4)=A3.data;
					M(5)=A4.data;
					M(6)=A5.data;
					M(7)=A6.data;
					
					
                    [Z0,Z1,Z2,Z3,Z4,Z5,Z6] = step(obj,A0,A1,A2,A3,A4,A5,A6);
                    [S0] = shift2(M);
					
					%disp([S0])
					%disp([Z0,Z1,Z2,Z3,Z4,Z5,Z6])
					%disp('\n')
					
					
					if((S0(1)~=Z0)||(S0(2)~=Z1)||(S0(3)~=Z2)||(S0(4)~=Z3)||(S0(5)~=Z4)||(S0(6)~=Z5)||(S0(7)~=Z6))
						disp([A0.data,A1.data,A2.data,A3.data,A4.data,A5.data,A6.data,A7.data])
						disp([S0(1),S0(2),S0(3),S0(4),S0(5),S0(6),S0(7)])
						disp([Z0.data,Z1.data,Z2.data,Z3.data,Z4.data,Z5.data,Z6.data])
						return
					end 
					

                end
                
            end
        end
    
    end
  
 end 
end


