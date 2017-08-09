LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity LumaInterpolation is
	port (
		RESET: in std_logic;
		A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: in std_logic_vector(7 downto 0);
		S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,S27,S28,S29,S30,S31: out std_logic_vector(10 downto 0)
	);
end LumaInterpolation;

architecture arc of LumaInterpolation is
	TYPE reg IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 11 downto 0);
	TYPE regInt IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 7 downto 0);
	SIGNAl regOri,regOri_0,regOri_1,regOri_2,regOri_3,regOri_4,regOri_5,regOri_6,regOri_7: regInt(7 downto 0);
	SIGNAl regf1,regf2,regf3: reg(7 downto 0);
	SIGNAl regf1_0,regf1_1,regf1_2,regf1_3,regf1_4,regf1_5,regf1_6,regf1_7: reg(7 downto 0);
	SIGNAl regf2_0,regf2_1,regf2_2,regf2_3,regf2_4,regf2_5,regf2_6,regf2_7: reg(7 downto 0);
	SIGNAl vert_0,vert_1,vert_2,vert_3,vert_4,vert_5,vert_6,vert_7: reg(7 downto 0);
	
	SIGNAl enable: STD_LOGIC:='1';
	SIGNAl SEL: STD_LOGIC_VECTOR( 1 downto 0):="00";
	
	SIGNAL CV :STD_LOGIC_VECTOR( 1 downto 0);
		
	COMPONENT filtro IS
		GENERIC (N : INTEGER := 8);
		PORT (
			A0, A2, A3, A4, A5, A6, A7: IN std_logic_vector(N-1 downto 0);
			S0,S1,S2: OUT std_logic_vector(N+2 downto 0)
		);
	END COMPONENT;
	
begin
	-- etapa responsavel por processar as amostras horizontais
	regOri(0) <= A3;
	regOri(1) <= A4;
	regOri(2) <= A5;
	regOri(3) <= A6;
	regOri(4) <= A7;
	regOri(5) <= A8;
	regOri(6) <= A9;
	regOri(7) <= A10;

	H0: filtro GENERIC MAP (8) port map(A0, A1, A2, A3, A4, A5, A6, A7,		regf1(0),regf2(0),regf3(0));
	H1: filtro GENERIC MAP (8) port map(A1, A2, A3, A4, A5, A6, A7, A8,		regf1(1),regf2(1),regf3(1));
	H2: filtro GENERIC MAP (8) port map(A2, A3, A4, A5, A6, A7, A8, A9,		regf1(2),regf2(2),regf3(2));
	H3: filtro GENERIC MAP (8) port map(A3, A4, A5, A6, A7, A8, A9, A10,	regf1(3),regf2(3),regf3(3));
	H4: filtro GENERIC MAP (8) port map(A4, A5, A6, A7, A8, A9, A10, A11,	regf1(4),regf2(4),regf3(4));
	H5: filtro GENERIC MAP (8) port map(A5, A6, A7, A8, A9, A10, A11, A12,	regf1(5),regf2(5),regf3(5));
	H6: filtro GENERIC MAP (8) port map(A6, A7, A8, A9, A10, A11, A12, A13,	regf1(6),regf2(6),regf3(6));
	H7: filtro GENERIC MAP (8) port map(A7, A8, A9, A10, A11, A12, A13, A14,regf1(7),regf2(7),regf3(7));
		
	-- etapa responsavel por armazenar as amostras processadas pelos filtros horizontais
		
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(enable=='1')
				regOri_0<=regOri;	
				regOri_1<=regOri_0;
				regOri_2<=regOri_1;
				regOri_3<=regOri_2;
				regOri_4<=regOri_3;
				regOri_5<=regOri_4;
				regOri_6<=regOri_5;
				regOri_7<=regOri_6;				
				END IF;
			END IF;
		END PROCESS;
	
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(enable=='1')
					regf1_0<=regf1;
					regf1_1<=regf1_0;
					regf1_2<=regf1_1;
					regf1_3<=regf1_2;
					regf1_4<=regf1_3;
					regf1_5<=regf1_4;
					regf1_6<=regf1_5;
					regf1_7<=regf1_6;					
				END IF;
			END IF;
		END PROCESS;
	
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(enable=='1')
					regf2_0<=regf2;
					regf2_1<=regf2_0;
					regf2_2<=regf2_1;
					regf2_3<=regf2_2;
					regf2_4<=regf2_3;
					regf2_5<=regf2_4;
					regf2_6<=regf2_5;
					regf2_7<=regf2_6;
					
				END IF;
			END IF;
		END PROCESS;
		
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(enable=='1')
					regf3_0<=regf3;
					regf3_1<=regf3_0;
					regf3_2<=regf3_1;
					regf3_3<=regf3_2;
					regf3_4<=regf3_3;
					regf3_5<=regf3_4;
					regf3_6<=regf3_5;
					regf3_7<=regf3_6;
					
				END IF;
			END IF;
		END PROCESS;	
	-- etapa responsavel por processar as amostras verticais
	
	with SEL select 
		vert_7		<=	regOri_7	when "00",
						regf1_7		when "01",
						regf2_7		when "10",
						regf3_7 	when "11";
	
	with SEL select 
		vert_6		<=	regOri_6	when "00",
						regf1_6		when "01",
						regf2_6		when "10",
						regf3_6 	when "11";
							
	with SEL select 
		vert_5		<=	regOri_5	when "00",
						regf1_5		when "01",
						regf2_5		when "10",
						regf3_5 	when "11";
						
	with SEL select 
		vert_4		<=	regOri_4	when "00",
						regf1_4		when "01",
						regf2_4		when "10",
						regf3_4 	when "11";
						
	with SEL select 
		vert_3		<=	regOri_3	when "00",
						regf1_3		when "01",
						regf2_3		when "10",
						regf3_3 	when "11";

	with SEL select 
		vert_2		<=	regOri_2	when "00",
						regf1_2		when "01",
						regf2_2		when "10",
						regf3_2 	when "11";

	with SEL select 
		vert_1		<=	regOri_1	when "00",
						regf1_1		when "01",
						regf2_1		when "10",
						regf3_1 	when "11";					
				
	with SEL select 
		vert_0		<=	regOri_0	when "00",
						regf1_0		when "01",
						regf2_0		when "10",
						regf3_0 	when "11";

	
	S0 <=  vert_0(3);
	S4 <=  vert_1(3);
	S8 <=  vert_2(3);
	S12 <= vert_3(3);
	S16 <= vert_4(3);
	S20 <= vert_5(3);
	S24 <= vert_6(3);
	S28 <= vert_7(3);
	
	V0: filtro GENERIC MAP (11) port map(vert_0(0),vert_1(0),vert_2(0),vert_3(0),vert_4(0),vert_5(0),vert_6(0),vert_7(0), S1,S2,S3);
	V1: filtro GENERIC MAP (11) port map(vert_0(1),vert_1(1),vert_2(1),vert_3(1),vert_4(1),vert_5(1),vert_6(1),vert_7(1), S5,S6,S7);
	V2: filtro GENERIC MAP (11) port map(vert_0(2),vert_1(2),vert_2(2),vert_3(2),vert_4(2),vert_5(2),vert_6(2),vert_7(2), S9,S10,S11);
	V3: filtro GENERIC MAP (11) port map(vert_0(3),vert_1(3),vert_2(3),vert_3(3),vert_4(3),vert_5(3),vert_6(3),vert_7(3), S13,S14,S15);
	V4: filtro GENERIC MAP (11) port map(vert_0(4),vert_1(4),vert_2(4),vert_3(4),vert_4(4),vert_5(4),vert_6(4),vert_7(4), S17,S18,S19);
	V5: filtro GENERIC MAP (11) port map(vert_0(5),vert_1(5),vert_2(5),vert_3(5),vert_4(5),vert_5(5),vert_6(5),vert_7(5), S21,S22,S23);
	V6: filtro GENERIC MAP (11) port map(vert_0(6),vert_1(6),vert_2(6),vert_3(6),vert_4(6),vert_5(6),vert_6(6),vert_7(6), S25,S26,S27);
	V7: filtro GENERIC MAP (11) port map(vert_0(7),vert_1(7),vert_2(7),vert_3(7),vert_4(7),vert_5(7),vert_6(7),vert_7(7), S29,S30,S31);	
		
	-- controle
	
	
	
	
		
end arc;
