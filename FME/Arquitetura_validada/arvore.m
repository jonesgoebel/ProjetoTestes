
function [R0,R1,R2,R3,R4,R5,R6,R7] = arvore(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,S32,S33,S34,S35,S36,S37,S38,S39, S40,S41,S42,S43,S44,S45,S46,S47,S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63,b0,b1,b2,b3,b4,b5,b6,b7)

    R0 = abs(b0-S0)+abs(b1-S8)+abs(b2-S16)+abs(b3-S24)+abs(b4-S32)+abs(b5-S40)+abs(b6-S48)+abs(b7-S56);
    R1 = abs(b0-S1)+abs(b1-S9)+abs(b2-S17)+abs(b3-S25)+abs(b4-S33)+abs(b5-S41)+abs(b6-S49)+abs(b7-S57);
    R2 = abs(b0-S2)+abs(b1-S10)+abs(b2-S18)+abs(b3-S26)+abs(b4-S34)+abs(b5-S42)+abs(b6-S50)+abs(b7-S58);
    R3 = abs(b0-S3)+abs(b1-S11)+abs(b2-S19)+abs(b3-S27)+abs(b4-S35)+abs(b5-S43)+abs(b6-S51)+abs(b7-S59);
    R4 = abs(b0-S4)+abs(b1-S12)+abs(b2-S20)+abs(b3-S28)+abs(b4-S36)+abs(b5-S44)+abs(b6-S52)+abs(b7-S60);
    R5 = abs(b0-S5)+abs(b1-S13)+abs(b2-S21)+abs(b3-S29)+abs(b4-S37)+abs(b5-S45)+abs(b6-S53)+abs(b7-S61);
    R6 = abs(b0-S6)+abs(b1-S14)+abs(b2-S22)+abs(b3-S30)+abs(b4-S38)+abs(b5-S46)+abs(b6-S54)+abs(b7-S62);
    R7 = abs(b0-S7)+abs(b1-S15)+abs(b2-S23)+abs(b3-S31)+abs(b4-S39)+abs(b5-S47)+abs(b6-S55)+abs(b7-S63);
 
end 
    
    
    