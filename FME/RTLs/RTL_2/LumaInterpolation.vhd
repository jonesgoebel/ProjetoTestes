LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity LumaInterpolation is
	port (
		CLK: IN std_logic;
		ENABLE: IN std_logic;		
		A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: IN std_logic_vector(7 downto 0);
		S0,S1,S2,S3,S4,S5,S6,S7: OUT std_logic_vector(11 downto 0);
		S8,S9,S10,S11,S12,S13,S14,S15: OUT std_logic_vector(11 downto 0);
		S16,S17,S18,S19,S20,S21,S22,S23: OUT std_logic_vector(11 downto 0);
		S24,S25,S26,S27,S28,S29,S30,S31: OUT std_logic_vector(11 downto 0);
		S32,S33,S34,S35,S36,S37,S38,S39: OUT std_logic_vector(11 downto 0);
		S40,S41,S42,S43,S44,S45,S46,S47: OUT std_logic_vector(11 downto 0);
		S48,S49,S50,S51,S52,S53,S54,S55: OUT std_logic_vector(11 downto 0);
		S56,S57,S58,S59,S60,S61,S62,S63: OUT std_logic_vector(11 downto 0);
		
		S64,S65,S66,S67,S68,S69,S70,S71: OUT std_logic_vector(11 downto 0);
		S72,S73,S74,S75,S76,S77,S78,S79: OUT std_logic_vector(11 downto 0);
		S80,S81,S82,S83,S84,S85,S86,S87: OUT std_logic_vector(11 downto 0);
		S88,S89,S90,S91,S92,S93,S94,S95: OUT std_logic_vector(11 downto 0);
		S96,S97,S98,S99,S100,S101,S102,S103: OUT std_logic_vector(11 downto 0);
		S104,S105,S106,S107,S108,S109,S110,S111: OUT std_logic_vector(11 downto 0);
		S112,S113,S114,S115,S116,S117,S118,S119: OUT std_logic_vector(11 downto 0);
		S120,S121,S122,S123,S124,S125,S126,S127: OUT std_logic_vector(11 downto 0);
		
        S128,S129,S130,S131,S132,S133,S134,S135: OUT std_logic_vector(11 downto 0);
        S136,S137,S138,S139,S140,S141,S142,S143: OUT std_logic_vector(11 downto 0);
        S144,S145,S146,S147,S148,S149,S150,S151: OUT std_logic_vector(11 downto 0);
        S152,S153,S154,S155,S156,S157,S158,S159: OUT std_logic_vector(11 downto 0);
        S160,S161,S162,S163,S164,S165,S166,S167: OUT std_logic_vector(11 downto 0);
        S168,S169,S170,S171,S172,S173,S174,S175: OUT std_logic_vector(11 downto 0);
        S176,S177,S178,S179,S180,S181,S182,S183: OUT std_logic_vector(11 downto 0);
        S184,S185,S186,S187,S188,S189,S190,S191: OUT std_logic_vector(11 downto 0);
		
        S192,S193,S194,S195,S196,S197,S198,S199: OUT std_logic_vector(11 downto 0);
        S200,S201,S202,S203,S204,S205,S206,S207: OUT std_logic_vector(11 downto 0);
        S208,S209,S210,S211,S212,S213,S214,S215: OUT std_logic_vector(11 downto 0);
        S216,S217,S218,S219,S220,S221,S222,S223: OUT std_logic_vector(11 downto 0);
        S224,S225,S226,S227,S228,S229,S230,S231: OUT std_logic_vector(11 downto 0);
        S232,S233,S234,S235,S236,S237,S238,S239: OUT std_logic_vector(11 downto 0);
        S240,S241,S242,S243,S244,S245,S246,S247: OUT std_logic_vector(11 downto 0);
        S248,S249,S250,S251,S252,S253,S254,S255: OUT std_logic_vector(11 downto 0);
		
        S256,S257,S258,S259,S260,S261,S262,S263: OUT std_logic_vector(11 downto 0);
        S264,S265,S266,S267,S268,S269,S270,S271: OUT std_logic_vector(11 downto 0);
        S272,S273,S274,S275,S276,S277,S278,S279: OUT std_logic_vector(11 downto 0);
        S280,S281,S282,S283,S284,S285,S286,S287: OUT std_logic_vector(11 downto 0);
        S288,S289,S290,S291,S292,S293,S294,S295: OUT std_logic_vector(11 downto 0);
        S296,S297,S298,S299,S300,S301,S302,S303: OUT std_logic_vector(11 downto 0);
        S304,S305,S306,S307,S308,S309,S310,S311: OUT std_logic_vector(11 downto 0);
        S312,S313,S314,S315,S316,S317,S318,S319: OUT std_logic_vector(11 downto 0);
		
        S320,S321,S322,S323,S324,S325,S326,S327: OUT std_logic_vector(11 downto 0);
        S328,S329,S330,S331,S332,S333,S334,S335: OUT std_logic_vector(11 downto 0);
        S336,S337,S338,S339,S340,S341,S342,S343: OUT std_logic_vector(11 downto 0);
        S344,S345,S346,S347,S348,S349,S350,S351: OUT std_logic_vector(11 downto 0);
        S352,S353,S354,S355,S356,S357,S358,S359: OUT std_logic_vector(11 downto 0);
        S360,S361,S362,S363,S364,S365,S366,S367: OUT std_logic_vector(11 downto 0);
        S368,S369,S370,S371,S372,S373,S374,S375: OUT std_logic_vector(11 downto 0);
        S376,S377,S378,S379,S380,S381,S382,S383: OUT std_logic_vector(11 downto 0);

        S384,S385,S386,S387,S388,S389,S390,S391: OUT std_logic_vector(11 downto 0);
        S392,S393,S394,S395,S396,S397,S398,S399: OUT std_logic_vector(11 downto 0);
        S400,S401,S402,S403,S404,S405,S406,S407: OUT std_logic_vector(11 downto 0);
        S408,S409,S410,S411,S412,S413,S414,S415: OUT std_logic_vector(11 downto 0);
        S416,S417,S418,S419,S420,S421,S422,S423: OUT std_logic_vector(11 downto 0);
        S424,S425,S426,S427,S428,S429,S430,S431: OUT std_logic_vector(11 downto 0);
        S432,S433,S434,S435,S436,S437,S438,S439: OUT std_logic_vector(11 downto 0);
        S440,S441,S442,S443,S444,S445,S446,S447: OUT std_logic_vector(11 downto 0);

        S448,S449,S450,S451,S452,S453,S454,S455: OUT std_logic_vector(11 downto 0);
        S456,S457,S458,S459,S460,S461,S462,S463: OUT std_logic_vector(11 downto 0);
        S464,S465,S466,S467,S468,S469,S470,S471: OUT std_logic_vector(11 downto 0);
        S472,S473,S474,S475,S476,S477,S478,S479: OUT std_logic_vector(11 downto 0);
        S480,S481,S482,S483,S484,S485,S486,S487: OUT std_logic_vector(11 downto 0);
        S488,S489,S490,S491,S492,S493,S494,S495: OUT std_logic_vector(11 downto 0);
        S496,S497,S498,S499,S500,S501,S502,S503: OUT std_logic_vector(11 downto 0);
        S504,S505,S506,S507,S508,S509,S510,S511: OUT std_logic_vector(11 downto 0)
        );
end LumaInterpolation;

architecture arc of LumaInterpolation is
	TYPE buffer_reg IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 9 downto 0);
	TYPE buffer_reg_orig IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 7 downto 0);
	
	SIGNAl reg_0: buffer_reg_orig(7 downto 0);
	SIGNAl reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7: buffer_reg(7 downto 0);
	
	
	SIGNAl H0_0,H0_1,H0_2,H0_3,H0_4,H0_5,H0_6,H0_7: buffer_reg_orig(7 downto 0);
	SIGNAl H1_0,H1_1,H1_2,H1_3,H1_4,H1_5,H1_6,H1_7: buffer_reg(7 downto 0);
	SIGNAl H2_0,H2_1,H2_2,H2_3,H2_4,H2_5,H2_6,H2_7: buffer_reg(7 downto 0);
	SIGNAl H3_0,H3_1,H3_2,H3_3,H3_4,H3_5,H3_6,H3_7: buffer_reg(7 downto 0);
	SIGNAl H4_0,H4_1,H4_2,H4_3,H4_4,H4_5,H4_6,H4_7: buffer_reg(7 downto 0);
	SIGNAl H5_0,H5_1,H5_2,H5_3,H5_4,H5_5,H5_6,H5_7: buffer_reg(7 downto 0);
	SIGNAl H6_0,H6_1,H6_2,H6_3,H6_4,H6_5,H6_6,H6_7: buffer_reg(7 downto 0);
	SIGNAl H7_0,H7_1,H7_2,H7_3,H7_4,H7_5,H7_6,H7_7: buffer_reg(7 downto 0);
	
	
	
	SIGNAl A0_0,A0_1,A0_2,A0_3,A0_4,A0_5,A0_6,A0_7: buffer_reg(7 downto 0);
	
	SIGNAl V_0,V_1,V_2,V_3,V_4,V_5,V_6,V_7: buffer_reg(7 downto 0);

		
	COMPONENT filtro_H IS
		GENERIC (N : INTEGER := 8);
		port (
		A0,A1,A2,A3,A4,A5,A6,A7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
		s0,s1,s2,s3,s4,s5,s6 : out std_logic_vector(N+1 downto 0)
        );  
	END COMPONENT;	
	
	COMPONENT filtro_V IS
		GENERIC (N : INTEGER := 8);
		port (
		A0,A1,A2,A3,A4,A5,A6,A7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
		s0,s1,s2,s3,s4,s5,s6,s7 : out std_logic_vector(N+1 downto 0)
        );  
	END COMPONENT;	
	
	
begin
	-- etapa responsavel por processar as amostras horizontais
	reg_0(0) <= A3;
	reg_0(1) <= A4;
	reg_0(2) <= A5;
	reg_0(3) <= A6;
	reg_0(4) <= A7;
	reg_0(5) <= A8;
	reg_0(6) <= A9;
	reg_0(7) <= A10;

	H0: filtro_H GENERIC MAP (8) port map(A0, A1, A2, A3, A4, A5, A6, A7,		reg_1(0),reg_2(0),reg_3(0),reg_4(0),reg_5(0),reg_6(0),reg_7(0));
	H1: filtro_H GENERIC MAP (8) port map(A1, A2, A3, A4, A5, A6, A7, A8,		reg_1(1),reg_2(1),reg_3(1),reg_4(1),reg_5(1),reg_6(1),reg_7(1));
	H2: filtro_H GENERIC MAP (8) port map(A2, A3, A4, A5, A6, A7, A8, A9,		reg_1(2),reg_2(2),reg_3(2),reg_4(2),reg_5(2),reg_6(2),reg_7(2));
	H3: filtro_H GENERIC MAP (8) port map(A3, A4, A5, A6, A7, A8, A9, A10,		reg_1(3),reg_2(3),reg_3(3),reg_4(3),reg_5(3),reg_6(3),reg_7(3));
	H4: filtro_H GENERIC MAP (8) port map(A4, A5, A6, A7, A8, A9, A10, A11,		reg_1(4),reg_2(4),reg_3(4),reg_4(4),reg_5(4),reg_6(4),reg_7(4));
	H5: filtro_H GENERIC MAP (8) port map(A5, A6, A7, A8, A9, A10, A11, A12,	reg_1(5),reg_2(5),reg_3(5),reg_4(5),reg_5(5),reg_6(5),reg_7(5));
	H6: filtro_H GENERIC MAP (8) port map(A6, A7, A8, A9, A10, A11, A12, A13,	reg_1(6),reg_2(6),reg_3(6),reg_4(6),reg_5(6),reg_6(6),reg_7(6));
	H7: filtro_H GENERIC MAP (8) port map(A7, A8, A9, A10, A11, A12, A13, A14,	reg_1(7),reg_2(7),reg_3(7),reg_4(7),reg_5(7),reg_6(7),reg_7(7));
		
	-- etapa responsavel por armazenar as amostras processadas pelos filtros horizontais
		
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(ENABLE ='1') THEN
				--amostras inteiras posição 0
				H0_7<=H0_6;
				H0_6<=H0_5;
				H0_5<=H0_4;
				H0_4<=H0_3;
				H0_3<=H0_2;
				H0_2<=H0_1;
				H0_1<=H0_0;
				H0_0<=reg_0;
				
				--posição 1
				H1_7<=H1_6;
				H1_6<=H1_5;
				H1_5<=H1_4;
				H1_4<=H1_3;
				H1_3<=H1_2;
				H1_2<=H1_1;
				H1_1<=H1_0;
				H1_0<=reg_1;
				
				--posição 2
				H2_7<=H2_6;
				H2_6<=H2_5;
				H2_5<=H2_4;
				H2_4<=H2_3;
				H2_3<=H2_2;
				H2_2<=H2_1;
				H2_1<=H2_0;
				H2_0<=reg_2;
				
				--posição 3
				H3_7<=H3_6;
				H3_6<=H3_5;
				H3_5<=H3_4;
				H3_4<=H3_3;
				H3_3<=H3_2;
				H3_2<=H3_1;
				H3_1<=H3_0;
				H3_0<=reg_3;
				
				--posição 4
				H4_7<=H4_6;
				H4_6<=H4_5;
				H4_5<=H4_4;
				H4_4<=H4_3;
				H4_3<=H4_2;
				H4_2<=H4_1;
				H4_1<=H4_0;
				H4_0<=reg_4;
				
				--posição 5
				H5_7<=H5_6;
				H5_6<=H5_5;
				H5_5<=H5_4;
				H5_4<=H5_3;
				H5_3<=H5_2;
				H5_2<=H5_1;
				H5_1<=H5_0;
				H5_0<=reg_5;
				
				--posição 6
				H6_7<=H6_6;
				H6_6<=H6_5;
				H6_5<=H6_4;
				H6_4<=H6_3;
				H6_3<=H6_2;
				H6_2<=H6_1;
				H6_1<=H6_0;
				H6_0<=reg_6;
				
				--posição 7
				H7_7<=H7_6;
				H7_6<=H7_5;
				H7_5<=H7_4;
				H7_4<=H7_3;
				H7_3<=H7_2;
				H7_2<=H7_1;
				H7_1<=H7_0;
				H7_0<=reg_7;
							
				END IF;
			END IF;
	END PROCESS;
	
		
	-- etapa responsavel por processar as amostras verticais
	
	
	--V_i:FOR i IN 0 to 7 GENERATE
	--	A0_0(i) <= std_logic_vector(resize(unSigned(H0_0(i)),10));
	--	A0_1(i) <= std_logic_vector(resize(unSigned(H0_1(i)),10));
	--	A0_2(i) <= std_logic_vector(resize(unSigned(H0_2(i)),10));
	--	A0_3(i) <= std_logic_vector(resize(unSigned(H0_3(i)),10));
	--	A0_4(i) <= std_logic_vector(resize(unSigned(H0_4(i)),10));
	--	A0_5(i) <= std_logic_vector(resize(unSigned(H0_5(i)),10));
	--	A0_6(i) <= std_logic_vector(resize(unSigned(H0_6(i)),10));
	--	A0_7(i) <= std_logic_vector(resize(unSigned(H0_7(i)),10));
	--END GENERATE;
	
	V_i:FOR i IN 0 to 7 GENERATE
		A0_0(i) <= "00"&H0_0(i);
		A0_1(i) <= "00"&H0_1(i);
		A0_2(i) <= "00"&H0_2(i);
		A0_3(i) <= "00"&H0_3(i);
		A0_4(i) <= "00"&H0_4(i);
		A0_5(i) <= "00"&H0_5(i);
		A0_6(i) <= "00"&H0_6(i);
		A0_7(i) <= "00"&H0_7(i);
	END GENERATE;
	
	
--	with SELETOR select 
--		V_7		<=	A0_7 	when "000",
--					H1_7	when "001",
--					H2_7	when "010",
--					H3_7 	when "011",
--					H4_7 	when "100",
--					H5_7 	when "101",
--					H6_7 	when "110",
--					H7_7 	when "111";
--					
--					
--	with SELETOR select 
--		V_6		<=	A0_6 	when "000",
--					H1_6	when "001",
--					H2_6	when "010",
--					H3_6 	when "011",
--					H4_6 	when "100",
--					H5_6 	when "101",
--					H6_6 	when "110",
--					H7_6 	when "111";				
--	
--	with SELETOR select 
--		V_5		<=	A0_5 	when "000",
--					H1_5	when "001",
--					H2_5	when "010",
--					H3_5 	when "011",
--					H4_5 	when "100",
--					H5_5 	when "101",
--					H6_5 	when "110",
--					H7_5 	when "111";
--					
--	with SELETOR select 
--		V_4		<=	A0_4 	when "000",
--					H1_4	when "001",
--					H2_4	when "010",
--					H3_4 	when "011",
--					H4_4 	when "100",
--					H5_4 	when "101",
--					H6_4 	when "110",
--					H7_4 	when "111";	
--					
--	with SELETOR select 
--		V_3		<=	A0_3 	when "000",
--					H1_3	when "001",
--					H2_3	when "010",
--					H3_3 	when "011",
--					H4_3 	when "100",
--					H5_3 	when "101",
--					H6_3 	when "110",
--					H7_3 	when "111";	
--					
--	with SELETOR select 
--		V_2		<=	A0_2 	when "000",
--					H1_2	when "001",
--					H2_2	when "010",
--					H3_2 	when "011",
--					H4_2 	when "100",
--					H5_2 	when "101",
--					H6_2 	when "110",
--					H7_2 	when "111";	
--					
--	with SELETOR select 
--		V_1		<=	A0_1 	when "000",
--					H1_1	when "001",
--					H2_1	when "010",
--					H3_1 	when "011",
--					H4_1 	when "100",
--					H5_1 	when "101",
--					H6_1 	when "110",
--					H7_1 	when "111";	
--					
--	with SELETOR select 
--		V_0		<=	A0_0 	when "000",
--					H1_0	when "001",
--					H2_0	when "010",
--					H3_0 	when "011",
--					H4_0 	when "100",
--					H5_0 	when "101",
--					H6_0 	when "110",
--					H7_0 	when "111";																
--	

	
	V0_0: filtro_V GENERIC MAP (10) port map(A0_7(0),A0_6(0),A0_5(0),A0_4(0),A0_3(0),A0_2(0),A0_1(0),A0_0(0), S0,S1,S2,S3,S4,S5,S6,S7);
	V1_0: filtro_V GENERIC MAP (10) port map(A0_7(1),A0_6(1),A0_5(1),A0_4(1),A0_3(1),A0_2(1),A0_1(1),A0_0(1), S8,S9,S10,S11,S12,S13,S14,S15);
	V2_0: filtro_V GENERIC MAP (10) port map(A0_7(2),A0_6(2),A0_5(2),A0_4(2),A0_3(2),A0_2(2),A0_1(2),A0_0(2), S16,S17,S18,S19,S20,S21,S22,S23);
	V3_0: filtro_V GENERIC MAP (10) port map(A0_7(3),A0_6(3),A0_5(3),A0_4(3),A0_3(3),A0_2(3),A0_1(3),A0_0(3), S24,S25,S26,S27,S28,S29,S30,S31);
	V4_0: filtro_V GENERIC MAP (10) port map(A0_7(4),A0_6(4),A0_5(4),A0_4(4),A0_3(4),A0_2(4),A0_1(4),A0_0(4), S32,S33,S34,S35,S36,S37,S38,S39);
	V5_0: filtro_V GENERIC MAP (10) port map(A0_7(5),A0_6(5),A0_5(5),A0_4(5),A0_3(5),A0_2(5),A0_1(5),A0_0(5), S40,S41,S42,S43,S44,S45,S46,S47);
	V6_0: filtro_V GENERIC MAP (10) port map(A0_7(6),A0_6(6),A0_5(6),A0_4(6),A0_3(6),A0_2(6),A0_1(6),A0_0(6), S48,S49,S50,S51,S52,S53,S54,S55);
	V7_0: filtro_V GENERIC MAP (10) port map(A0_7(7),A0_6(7),A0_5(7),A0_4(7),A0_3(7),A0_2(7),A0_1(7),A0_0(7), S56,S57,S58,S59,S60,S61,S62,S63);
	
	V0_1: filtro_V GENERIC MAP (10) port map(H1_7(0),H1_6(0),H1_5(0),H1_4(0),H1_3(0),H1_2(0),H1_1(0),H1_0(0), S64,S65,S66,S67,S68,S69,S70,S71);
	V1_1: filtro_V GENERIC MAP (10) port map(H1_7(1),H1_6(1),H1_5(1),H1_4(1),H1_3(1),H1_2(1),H1_1(1),H1_0(1), S72,S73,S74,S75,S76,S77,S78,S79);
	V2_1: filtro_V GENERIC MAP (10) port map(H1_7(2),H1_6(2),H1_5(2),H1_4(2),H1_3(2),H1_2(2),H1_1(2),H1_0(2), S80,S81,S82,S83,S84,S85,S86,S87);
	V3_1: filtro_V GENERIC MAP (10) port map(H1_7(3),H1_6(3),H1_5(3),H1_4(3),H1_3(3),H1_2(3),H1_1(3),H1_0(3), S88,S89,S90,S91,S92,S93,S94,S95);
	V4_1: filtro_V GENERIC MAP (10) port map(H1_7(4),H1_6(4),H1_5(4),H1_4(4),H1_3(4),H1_2(4),H1_1(4),H1_0(4), S96,S97,S98,S99,S100,S101,S102,S103);
	V5_1: filtro_V GENERIC MAP (10) port map(H1_7(5),H1_6(5),H1_5(5),H1_4(5),H1_3(5),H1_2(5),H1_1(5),H1_0(5), S104,S105,S106,S107,S108,S109,S110,S111);
	V6_1: filtro_V GENERIC MAP (10) port map(H1_7(6),H1_6(6),H1_5(6),H1_4(6),H1_3(6),H1_2(6),H1_1(6),H1_0(6), S112,S113,S114,S115,S116,S117,S118,S119);
	V7_1: filtro_V GENERIC MAP (10) port map(H1_7(7),H1_6(7),H1_5(7),H1_4(7),H1_3(7),H1_2(7),H1_1(7),H1_0(7), S120,S121,S122,S123,S124,S125,S126,S127);
	
	V0_2: filtro_V GENERIC MAP (10) port map(H2_7(0),H2_6(0),H2_5(0),H2_4(0),H2_3(0),H2_2(0),H2_1(0),H2_0(0), S128,S129,S130,S131,S132,S133,S134,S135);
	V1_2: filtro_V GENERIC MAP (10) port map(H2_7(1),H2_6(1),H2_5(1),H2_4(1),H2_3(1),H2_2(1),H2_1(1),H2_0(1), S136,S137,S138,S139,S140,S141,S142,S143);
	V2_2: filtro_V GENERIC MAP (10) port map(H2_7(2),H2_6(2),H2_5(2),H2_4(2),H2_3(2),H2_2(2),H2_1(2),H2_0(2), S144,S145,S146,S147,S148,S149,S150,S151);
	V3_2: filtro_V GENERIC MAP (10) port map(H2_7(3),H2_6(3),H2_5(3),H2_4(3),H2_3(3),H2_2(3),H2_1(3),H2_0(3), S152,S153,S154,S155,S156,S157,S158,S159);
	V4_2: filtro_V GENERIC MAP (10) port map(H2_7(4),H2_6(4),H2_5(4),H2_4(4),H2_3(4),H2_2(4),H2_1(4),H2_0(4), S160,S161,S162,S163,S164,S165,S166,S167);
	V5_2: filtro_V GENERIC MAP (10) port map(H2_7(5),H2_6(5),H2_5(5),H2_4(5),H2_3(5),H2_2(5),H2_1(5),H2_0(5), S168,S169,S170,S171,S172,S173,S174,S175);
	V6_2: filtro_V GENERIC MAP (10) port map(H2_7(6),H2_6(6),H2_5(6),H2_4(6),H2_3(6),H2_2(6),H2_1(6),H2_0(6), S176,S177,S178,S179,S180,S181,S182,S183);
	V7_2: filtro_V GENERIC MAP (10) port map(H2_7(7),H2_6(7),H2_5(7),H2_4(7),H2_3(7),H2_2(7),H2_1(7),H2_0(7), S184,S185,S186,S187,S188,S189,S190,S191);
	
	V0_3: filtro_V GENERIC MAP (10) port map(H3_7(0),H3_6(0),H3_5(0),H3_4(0),H3_3(0),H3_2(0),H3_1(0),H3_0(0), S192,S193,S194,S195,S196,S197,S198,S199);
	V1_3: filtro_V GENERIC MAP (10) port map(H3_7(1),H3_6(1),H3_5(1),H3_4(1),H3_3(1),H3_2(1),H3_1(1),H3_0(1), S200,S201,S202,S203,S204,S205,S206,S207);
	V2_3: filtro_V GENERIC MAP (10) port map(H3_7(2),H3_6(2),H3_5(2),H3_4(2),H3_3(2),H3_2(2),H3_1(2),H3_0(2), S208,S209,S210,S211,S212,S213,S214,S215);
	V3_3: filtro_V GENERIC MAP (10) port map(H3_7(3),H3_6(3),H3_5(3),H3_4(3),H3_3(3),H3_2(3),H3_1(3),H3_0(3), S216,S217,S218,S219,S220,S221,S222,S223);
	V4_3: filtro_V GENERIC MAP (10) port map(H3_7(4),H3_6(4),H3_5(4),H3_4(4),H3_3(4),H3_2(4),H3_1(4),H3_0(4), S224,S225,S226,S227,S228,S229,S230,S231);
	V5_3: filtro_V GENERIC MAP (10) port map(H3_7(5),H3_6(5),H3_5(5),H3_4(5),H3_3(5),H3_2(5),H3_1(5),H3_0(5), S232,S233,S234,S235,S236,S237,S238,S239);
	V6_3: filtro_V GENERIC MAP (10) port map(H3_7(6),H3_6(6),H3_5(6),H3_4(6),H3_3(6),H3_2(6),H3_1(6),H3_0(6), S240,S241,S242,S243,S244,S245,S246,S247);
	V7_3: filtro_V GENERIC MAP (10) port map(H3_7(7),H3_6(7),H3_5(7),H3_4(7),H3_3(7),H3_2(7),H3_1(7),H3_0(7), S248,S249,S250,S251,S252,S253,S254,S255);
		
	V0_4: filtro_V GENERIC MAP (10) port map(H4_7(0),H4_6(0),H4_5(0),H4_4(0),H4_3(0),H4_2(0),H4_1(0),H4_0(0), S256,S257,S258,S259,S260,S261,S262,S263);
	V1_4: filtro_V GENERIC MAP (10) port map(H4_7(1),H4_6(1),H4_5(1),H4_4(1),H4_3(1),H4_2(1),H4_1(1),H4_0(1), S264,S265,S266,S267,S268,S269,S270,S271);
	V2_4: filtro_V GENERIC MAP (10) port map(H4_7(2),H4_6(2),H4_5(2),H4_4(2),H4_3(2),H4_2(2),H4_1(2),H4_0(2), S272,S273,S274,S275,S276,S277,S278,S279);
	V3_4: filtro_V GENERIC MAP (10) port map(H4_7(3),H4_6(3),H4_5(3),H4_4(3),H4_3(3),H4_2(3),H4_1(3),H4_0(3), S280,S281,S282,S283,S284,S285,S286,S287);
	V4_4: filtro_V GENERIC MAP (10) port map(H4_7(4),H4_6(4),H4_5(4),H4_4(4),H4_3(4),H4_2(4),H4_1(4),H4_0(4), S288,S289,S290,S291,S292,S293,S294,S295);
	V5_4: filtro_V GENERIC MAP (10) port map(H4_7(5),H4_6(5),H4_5(5),H4_4(5),H4_3(5),H4_2(5),H4_1(5),H4_0(5), S296,S297,S298,S299,S300,S301,S302,S303);
	V6_4: filtro_V GENERIC MAP (10) port map(H4_7(6),H4_6(6),H4_5(6),H4_4(6),H4_3(6),H4_2(6),H4_1(6),H4_0(6), S304,S305,S306,S307,S308,S309,S310,S311);
	V7_4: filtro_V GENERIC MAP (10) port map(H4_7(7),H4_6(7),H4_5(7),H4_4(7),H4_3(7),H4_2(7),H4_1(7),H4_0(7), S312,S313,S314,S315,S316,S317,S318,S319);	
	
	V0_5: filtro_V GENERIC MAP (10) port map(H5_7(0),H5_6(0),H5_5(0),H5_4(0),H5_3(0),H5_2(0),H5_1(0),H5_0(0), S320,S321,S322,S323,S324,S325,S326,S327);
	V1_5: filtro_V GENERIC MAP (10) port map(H5_7(1),H5_6(1),H5_5(1),H5_4(1),H5_3(1),H5_2(1),H5_1(1),H5_0(1), S328,S329,S330,S331,S332,S333,S334,S335);
	V2_5: filtro_V GENERIC MAP (10) port map(H5_7(2),H5_6(2),H5_5(2),H5_4(2),H5_3(2),H5_2(2),H5_1(2),H5_0(2), S336,S337,S338,S339,S340,S341,S342,S343);
	V3_5: filtro_V GENERIC MAP (10) port map(H5_7(3),H5_6(3),H5_5(3),H5_4(3),H5_3(3),H5_2(3),H5_1(3),H5_0(3), S344,S345,S346,S347,S348,S349,S350,S351);
	V4_5: filtro_V GENERIC MAP (10) port map(H5_7(4),H5_6(4),H5_5(4),H5_4(4),H5_3(4),H5_2(4),H5_1(4),H5_0(4), S352,S353,S354,S355,S356,S357,S358,S359);
	V5_5: filtro_V GENERIC MAP (10) port map(H5_7(5),H5_6(5),H5_5(5),H5_4(5),H5_3(5),H5_2(5),H5_1(5),H5_0(5), S360,S361,S362,S363,S364,S365,S366,S367);
	V6_5: filtro_V GENERIC MAP (10) port map(H5_7(6),H5_6(6),H5_5(6),H5_4(6),H5_3(6),H5_2(6),H5_1(6),H5_0(6), S368,S369,S370,S371,S372,S373,S374,S375);
	V7_5: filtro_V GENERIC MAP (10) port map(H5_7(7),H5_6(7),H5_5(7),H5_4(7),H5_3(7),H5_2(7),H5_1(7),H5_0(7), S376,S377,S378,S379,S380,S381,S382,S383);	

	V0_6: filtro_V GENERIC MAP (10) port map(H6_7(0),H6_6(0),H6_5(0),H6_4(0),H6_3(0),H6_2(0),H6_1(0),H6_0(0), S384,S385,S386,S387,S388,S389,S390,S391);
	V1_6: filtro_V GENERIC MAP (10) port map(H6_7(1),H6_6(1),H6_5(1),H6_4(1),H6_3(1),H6_2(1),H6_1(1),H6_0(1), S392,S393,S394,S395,S396,S397,S398,S399);
	V2_6: filtro_V GENERIC MAP (10) port map(H6_7(2),H6_6(2),H6_5(2),H6_4(2),H6_3(2),H6_2(2),H6_1(2),H6_0(2), S400,S401,S402,S403,S404,S405,S406,S407);
	V3_6: filtro_V GENERIC MAP (10) port map(H6_7(3),H6_6(3),H6_5(3),H6_4(3),H6_3(3),H6_2(3),H6_1(3),H6_0(3), S408,S409,S410,S411,S412,S413,S414,S415);
	V4_6: filtro_V GENERIC MAP (10) port map(H6_7(4),H6_6(4),H6_5(4),H6_4(4),H6_3(4),H6_2(4),H6_1(4),H6_0(4), S416,S417,S418,S419,S420,S421,S422,S423);
	V5_6: filtro_V GENERIC MAP (10) port map(H6_7(5),H6_6(5),H6_5(5),H6_4(5),H6_3(5),H6_2(5),H6_1(5),H6_0(5), S424,S425,S426,S427,S428,S429,S430,S431);
	V6_6: filtro_V GENERIC MAP (10) port map(H6_7(6),H6_6(6),H6_5(6),H6_4(6),H6_3(6),H6_2(6),H6_1(6),H6_0(6), S432,S433,S434,S435,S436,S437,S438,S439);
	V7_6: filtro_V GENERIC MAP (10) port map(H6_7(7),H6_6(7),H6_5(7),H6_4(7),H6_3(7),H6_2(7),H6_1(7),H6_0(7), S440,S441,S442,S443,S444,S445,S446,S447);			
		
	V0_7: filtro_V GENERIC MAP (10) port map(H7_7(0),H7_6(0),H7_5(0),H7_4(0),H7_3(0),H7_2(0),H7_1(0),H7_0(0), S448,S449,S450,S451,S452,S453,S454,S455);
	V1_7: filtro_V GENERIC MAP (10) port map(H7_7(1),H7_6(1),H7_5(1),H7_4(1),H7_3(1),H7_2(1),H7_1(1),H7_0(1), S456,S457,S458,S459,S460,S461,S462,S463);
	V2_7: filtro_V GENERIC MAP (10) port map(H7_7(2),H7_6(2),H7_5(2),H7_4(2),H7_3(2),H7_2(2),H7_1(2),H7_0(2), S464,S465,S466,S467,S468,S469,S470,S471);
	V3_7: filtro_V GENERIC MAP (10) port map(H7_7(3),H7_6(3),H7_5(3),H7_4(3),H7_3(3),H7_2(3),H7_1(3),H7_0(3), S472,S473,S474,S475,S476,S477,S478,S479);
	V4_7: filtro_V GENERIC MAP (10) port map(H7_7(4),H7_6(4),H7_5(4),H7_4(4),H7_3(4),H7_2(4),H7_1(4),H7_0(4), S480,S481,S482,S483,S484,S485,S486,S487);
	V5_7: filtro_V GENERIC MAP (10) port map(H7_7(5),H7_6(5),H7_5(5),H7_4(5),H7_3(5),H7_2(5),H7_1(5),H7_0(5), S488,S489,S490,S491,S492,S493,S494,S495);
	V6_7: filtro_V GENERIC MAP (10) port map(H7_7(6),H7_6(6),H7_5(6),H7_4(6),H7_3(6),H7_2(6),H7_1(6),H7_0(6), S496,S497,S498,S499,S500,S501,S502,S503);
	V7_7: filtro_V GENERIC MAP (10) port map(H7_7(7),H7_6(7),H7_5(7),H7_4(7),H7_3(7),H7_2(7),H7_1(7),H7_0(7), S504,S505,S506,S507,S508,S509,S510,S511);			
end arc;
