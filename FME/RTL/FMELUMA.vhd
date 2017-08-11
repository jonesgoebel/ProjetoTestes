LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity FMELUMA is
	port (
		CLK: IN std_logic;
		RESET: IN std_logic;		
		A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: IN std_logic_vector(7 downto 0);--AMOSTRAS PARA SEREM INTERPOLADAS
		B0, B1, B2, B3, B4, B5, B6, B7: IN std_logic_vector(7 downto 0);--AMOSTRAS ORIGINAIS PARA COMPARAÇÃO
		MVX,MVX: OUT std_logic_vector(1 downto 0);
		SAD: OUT std_logic_vector(11 downto 0)
	);
end FMELUMA;

architecture arc of FMELUMA is
	TYPE reg IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 9 downto 0);
	TYPE regInt IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 7 downto 0);
	
	
	
	COMPONENT sad IS
		port (
		CLK: IN std_logic;
		RESET: IN std_logic;		
		A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: IN std_logic_vector(7 downto 0);
		LOAD: OUT  BIT;
		SELETOR: INOUT  BIT_VECTOR(2 downto 0);
		S0,S1,S2,S3,S4,S5,S6,S7: OUT std_logic_vector(11 downto 0);
		S8,S9,S10,S11,S12,S13,S14,S15: OUT std_logic_vector(11 downto 0);
		S16,S17,S18,S19,S20,S21,S22,S23: OUT std_logic_vector(11 downto 0);
		S24,S25,S26,S27,S28,S29,S30,S31: OUT std_logic_vector(11 downto 0);
		S32,S33,S34,S35,S36,S37,S38,S39: OUT std_logic_vector(11 downto 0);
		S40,S41,S42,S43,S44,S45,S46,S47: OUT std_logic_vector(11 downto 0);
		S48,S49,S50,S51,S52,S53,S54,S55: OUT std_logic_vector(11 downto 0);
		S56,S57,S58,S59,S60,S61,S62,S63: OUT std_logic_vector(11 downto 0)
	END COMPONENT;	
		
	COMPONENT sad IS
			port (
			a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31 : in  std_logic_vector(7 downto 0);
  			b0,b1,b2,b3,b4,b5,b6,b7 : in  std_logic_vector(7 downto 0);
        	r0,r1,r2,r3 : out std_logic_vector(7 downto 0));
	END COMPONENT;
	
begin
	
	
end arc;
