LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity FMELUMA is
	port (
		CLK: IN std_logic;
		RESET: IN std_logic;		
		A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: IN std_logic_vector(7 downto 0);--AMOSTRAS PARA SEREM INTERPOLADAS
		B0, B1, B2, B3, B4, B5, B6, B7: IN std_logic_vector(7 downto 0);--AMOSTRAS ORIGINAIS PARA COMPARAÇÃO
		LOAD_A: OUT  std_logic;
		LOAD_B: OUT  std_logic;
		READY: OUT  std_logic;	
		MVX,MVY: OUT std_logic_vector(2 downto 0);
		SAD: OUT std_logic_vector(15 downto 0)
	);
end FMELUMA;

architecture arc of FMELUMA is
	
	SIGNAL S0,S1,S2,S3,S4,S5,S6,S7: std_logic_vector(11 downto 0);
	SIGNAL S8,S9,S10,S11,S12,S13,S14,S15: std_logic_vector(11 downto 0);
	SIGNAL S16,S17,S18,S19,S20,S21,S22,S23: std_logic_vector(11 downto 0);
	SIGNAL S24,S25,S26,S27,S28,S29,S30,S31: std_logic_vector(11 downto 0);
	SIGNAL S32,S33,S34,S35,S36,S37,S38,S39: std_logic_vector(11 downto 0);
	SIGNAL S40,S41,S42,S43,S44,S45,S46,S47: std_logic_vector(11 downto 0);
	SIGNAL S48,S49,S50,S51,S52,S53,S54,S55: std_logic_vector(11 downto 0);
	SIGNAL S56,S57,S58,S59,S60,S61,S62,S63: std_logic_vector(11 downto 0);
	
	SIGNAL R0,R1,R2,R3,R4,R5,R6,R7: std_logic_vector(7 downto 0);
	
	SIGNAL READY,ENABLE_RI, RESET_SAD,ENABLE_SAD,CAL_SAD :std_logic;
	SIGNAL SELETOR :BIT_VECTOR(2 downto 0);
	
	COMPONENT LumaInterpolation IS
		port (
		CLK: IN std_logic;
		ENABLE: IN std_logic;
		SELETOR: IN  BIT_VECTOR(2 downto 0);	
		S0,S1,S2,S3,S4,S5,S6,S7: OUT std_logic_vector(11 downto 0);
		S8,S9,S10,S11,S12,S13,S14,S15: OUT std_logic_vector(11 downto 0);
		S16,S17,S18,S19,S20,S21,S22,S23: OUT std_logic_vector(11 downto 0);
		S24,S25,S26,S27,S28,S29,S30,S31: OUT std_logic_vector(11 downto 0);
		S32,S33,S34,S35,S36,S37,S38,S39: OUT std_logic_vector(11 downto 0);
		S40,S41,S42,S43,S44,S45,S46,S47: OUT std_logic_vector(11 downto 0);
		S48,S49,S50,S51,S52,S53,S54,S55: OUT std_logic_vector(11 downto 0);
		S56,S57,S58,S59,S60,S61,S62,S63: OUT std_logic_vector(11 downto 0)
	END COMPONENT;	
		
	COMPONENT cal_sad IS
		port (
			S0,S1,S2,S3,S4,S5,S6,S7: IN std_logic_vector(11 downto 0);
			S8,S9,S10,S11,S12,S13,S14,S15: IN std_logic_vector(11 downto 0);
			S16,S17,S18,S19,S20,S21,S22,S23: IN std_logic_vector(11 downto 0);
			S24,S25,S26,S27,S28,S29,S30,S31: IN std_logic_vector(11 downto 0);
			S32,S33,S34,S35,S36,S37,S38,S39: IN std_logic_vector(11 downto 0);
			S40,S41,S42,S43,S44,S45,S46,S47: IN std_logic_vector(11 downto 0);
			S48,S49,S50,S51,S52,S53,S54,S55: IN std_logic_vector(11 downto 0);
			S56,S57,S58,S59,S60,S61,S62,S63: IN std_logic_vector(11 downto 0);
			b0,b1,b2,b3,b4,b5,b6,b7 : in  std_logic_vector(7 downto 0);
			r0,r1,r2,r3,r4,r5,r6,r7 : out std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SAD_reg is
		port (
			CLK: IN std_logic;
			RESET_SAD: IN std_logic;
			ENABLE_SAD: IN std_logic;
			SELETOR: IN BIT_VECTOR(2 downto 0);
			CAL_SAD: IN std_logic;	
			A0, A1, A2, A3, A4, A5, A6, A7: IN std_logic_vector(7 downto 0);
			READY: OUT  BIT;	
			MVX,MVY: OUT std_logic_vector(2 downto 0);
			SAD: OUT std_logic_vector(16 downto 0)
		);
	END COMPONENT;
	
	COMPONENT controle is
		port (
			CLK: IN std_logic;
			RESET: IN std_logic;	
			READY: IN  BIT;
			LOAD_A: OUT  BIT;
			LOAD_B: OUT  BIT;
			ENABLE_RI: OUT  BIT;	
			SELETOR: OUT BIT_VECTOR(2 downto 0);
			RESET_SAD: OUT std_logic;
			ENABLE_SAD: OUT std_logic;
			CAL_SAD: OUT std_logic	
		);
	END COMPONENT;
	
begin
	Inter: LumaInterpolation port map(CLK,ENABLE_RI,SELETOR,A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14,
					S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,
					S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,
					S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,
					S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63);
					
	arvore_sad: cal_sad port map(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,
					S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31,
					S32,S33,S34,S35,S36,S37,S38,S39,S40,S41,S42,S43,S44,S45,S46,S47,
					S48,S49,S50,S51,S52,S53,S54,S55,S56,S57,S58,S59,S60,S61,S62,S63,
					B0,B1,B2,B3,B4,B5,B6,B7, R0,R1,R2,R3,R4,R5,R6,R7);
					
	result_sad: SAD_reg port map(CLK,RESET_SAD,ENABLE_SAD,SELETOR,CAL_SAD,
								R0,R1,R2,R3,R4,R5,R6,R7,
								READY,MVX,MVY,SAD);
					
	control: controle port map(CLK,RESET,READY,LOAD_A,LOAD_B,ENABLE_RI,SELETOR,
									RESET_SAD,ENABLE_SAD,CAL_SAD);
				
	
end arc;
