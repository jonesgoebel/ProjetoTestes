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
	
	SIGNAl regOri,regOri_0,regOri_1,regOri_2,regOri_3,regOri_4,regOri_5,regOri_6,regOri_7: regInt(7 downto 0);
	SIGNAl regf1,regf2,regf3: reg(7 downto 0);
	SIGNAl regf0_0,regf0_1,regf0_2,regf0_3,regf0_4,regf0_5,regf0_6,regf0_7: reg(7 downto 0);
	SIGNAl regf1_0,regf1_1,regf1_2,regf1_3,regf1_4,regf1_5,regf1_6,regf1_7: reg(7 downto 0);
	SIGNAl regf2_0,regf2_1,regf2_2,regf2_3,regf2_4,regf2_5,regf2_6,regf2_7: reg(7 downto 0);
	SIGNAl regf3_0,regf3_1,regf3_2,regf3_3,regf3_4,regf3_5,regf3_6,regf3_7: reg(7 downto 0);
	SIGNAl vert_0,vert_1,vert_2,vert_3,vert_4,vert_5,vert_6,vert_7: reg(7 downto 0);
	
		
	COMPONENT sad IS
			port (
			a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31 : in  std_logic_vector(7 downto 0);
  			b0,b1,b2,b3,b4,b5,b6,b7 : in  std_logic_vector(7 downto 0);
        	r0,r1,r2,r3 : out std_logic_vector(7 downto 0));
	END COMPONENT;
	
begin
	
	
end arc;
