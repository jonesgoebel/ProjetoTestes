library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Final is   
  port (	CLK: IN std_logic;
			RESET: IN std_logic;		
			A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: IN std_logic_vector(7 downto 0);--AMOSTRAS PARA SEREM INTERPOLADAS
			B0, B1, B2, B3, B4, B5, B6, B7: IN std_logic_vector(7 downto 0);--AMOSTRAS ORIGINAIS PARA COMPARAÇÃO
			Test: in boolean;
			LOAD_A: OUT  std_logic;
			LOAD_B: OUT  std_logic;
			READY: OUT  std_logic;	
			MVX,MVY: OUT bit_vector(2 downto 0);
			RespT: OUT std_logic;
			SAD: OUT std_logic_vector(16 downto 0)
end entity Final;

architecture arc of Final is
	SIGNAL C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14: std_logic_vector(7 downto 0);
	SIGNAL D0, D1, D2, D3, D4, D5, D6, D7: std_logic_vector(7 downto 0)
	COMPONENT BIST IS
			port (
			READY: IN  std_logic;	
			A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: OUT std_logic_vector(7 downto 0);--AMOSTRAS PARA SEREM INTERPOLADAS
			B0, B1, B2, B3, B4, B5, B6, B7: OUT std_logic_vector(7 downto 0);--AMOSTRAS ORIGINAIS PARA COMPARAÇÃO
			Resultado: out std_logic;
			SAD: OUT std_logic_vector(16 downto 0));
		end component;
		
		
	COMPONENT FMELUMA is
		port (
			CLK: IN std_logic;
			RESET: IN std_logic;		
			A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: IN std_logic_vector(7 downto 0);--AMOSTRAS PARA SEREM INTERPOLADAS
			B0, B1, B2, B3, B4, B5, B6, B7: IN std_logic_vector(7 downto 0);--AMOSTRAS ORIGINAIS PARA COMPARAÇÃO
			LOAD_A: OUT  std_logic;
			LOAD_B: OUT  std_logic;
			READY: OUT  std_logic;	
			MVX,MVY: OUT bit_vector(2 downto 0);
			SAD: OUT std_logic_vector(16 downto 0)
		);
	end COMPONENT;	
		
	begin	
	teste: BIST port map (READY, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, D0, D1, D2, D3, D4, D5, D6, D7, RespT, SAD);
	luma: FMELUMA port map(CLK,RESET,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,B1,B2,B3,B4,B5,B6,B7,LOAD_A,LOAD_B,READY,MVX,MVY,SAD);
	
	
end arc;