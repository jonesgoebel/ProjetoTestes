LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity LumaInterpolation is
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
	);
end LumaInterpolation;

architecture arc of LumaInterpolation is
	TYPE buffer_reg IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 9 downto 0);
	TYPE buffer_reg_orig IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 7 downto 0);
	
	SIGNAl reg_0: buffer_reg_orig(7 downto 0);
	SIGNAl reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7: buffer_reg(6 downto 0);
	
	
	SIGNAl H0_0,H0_1,H0_2,H0_3,H0_4,H0_5,H0_6,H0_7: buffer_reg_orig(7 downto 0);
	SIGNAl H1_0,H1_1,H1_2,H1_3,H1_4,H1_5,H1_6,H1_7: buffer_reg(6 downto 0);
	SIGNAl H2_0,H2_1,H2_2,H2_3,H2_4,H2_5,H2_6,H2_7: buffer_reg(6 downto 0);
	SIGNAl H3_0,H3_1,H3_2,H3_3,H3_4,H3_5,H3_6,H3_7: buffer_reg(6 downto 0);
	SIGNAl H4_0,H4_1,H4_2,H4_3,H4_4,H4_5,H4_6,H4_7: buffer_reg(6 downto 0);
	SIGNAl H5_0,H5_1,H5_2,H5_3,H5_4,H5_5,H5_6,H5_7: buffer_reg(6 downto 0);
	SIGNAl H6_0,H6_1,H6_2,H6_3,H6_4,H6_5,H6_6,H6_7: buffer_reg(6 downto 0);
	SIGNAl H7_0,H7_1,H7_2,H7_3,H7_4,H7_5,H7_6,H7_7: buffer_reg(6 downto 0);
	
	
	
	SIGNAl A0_0,A0_1,A0_2,A0_3,A0_4,A0_5,A0_6,A0_7: buffer_reg(7 downto 0);
	
	SIGNAl V_0,V_1,V_2,V_3,V_4,V_5,V_6,V_7: buffer_reg(7 downto 0);
	

	
	
	SIGNAl enable: STD_LOGIC:='1';
	
	type estados is (loading,horizontal,vertical);
	signal estado:estados;
	signal cont: integer range 0 to 15;
	
		
	COMPONENT F_triplo IS
		GENERIC (N : INTEGER := 8);
		port (
			a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);
			b0,b1,b2,b3,b4,b5,b6,b7 : out std_logic_vector(N+1 downto 0)
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

	--H0: F_triplo GENERIC MAP (8) port map(A0, A1, A2, A3, A4, A5, A6, A7,		reg_1(0),reg_2(0),reg_3(0),reg_4(0),reg_5(0),reg_6(0),reg_7(0));
	--H1: F_triplo GENERIC MAP (8) port map(A1, A2, A3, A4, A5, A6, A7, A8,		reg_1(1),reg_2(1),reg_3(1),reg_4(1),reg_5(1),reg_6(1),reg_7(1));
	--H2: F_triplo GENERIC MAP (8) port map(A2, A3, A4, A5, A6, A7, A8, A9,		reg_1(2),reg_2(2),reg_3(2),reg_4(2),reg_5(2),reg_6(2),reg_7(2));
	--H3: F_triplo GENERIC MAP (8) port map(A3, A4, A5, A6, A7, A8, A9, A10,		reg_1(3),reg_2(3),reg_3(3),reg_4(3),reg_5(3),reg_6(3),reg_7(3));
	--H4: F_triplo GENERIC MAP (8) port map(A4, A5, A6, A7, A8, A9, A10, A11,		reg_1(4),reg_2(4),reg_3(4),reg_4(4),reg_5(4),reg_6(4),reg_7(4));
	--H5: F_triplo GENERIC MAP (8) port map(A5, A6, A7, A8, A9, A10, A11, A12,	reg_1(5),reg_2(5),reg_3(5),reg_4(5),reg_5(5),reg_6(5),reg_7(5));
	--H6: F_triplo GENERIC MAP (8) port map(A6, A7, A8, A9, A10, A11, A12, A13,	reg_1(6),reg_2(6),reg_3(6),reg_4(6),reg_5(6),reg_6(6),reg_7(6));
	--H7: F_triplo GENERIC MAP (8) port map(A7, A8, A9, A10, A11, A12, A13, A14,	reg_1(7),reg_2(7),reg_3(7),reg_4(7),reg_5(7),reg_6(7),reg_7(7));
		
	-- etapa responsavel por armazenar as amostras processadas pelos filtros horizontais
		
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(enable ='1') THEN
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
	
	
	V_i:FOR i IN 0 to 7 GENERATE
		A0_0(i) <= std_logic_vector(resize(Signed(H0_0(i)),10));
		A0_1(i) <= std_logic_vector(resize(Signed(H0_1(i)),10));
		A0_2(i) <= std_logic_vector(resize(Signed(H0_2(i)),10));
		A0_3(i) <= std_logic_vector(resize(Signed(H0_3(i)),10));
		A0_4(i) <= std_logic_vector(resize(Signed(H0_4(i)),10));
		A0_5(i) <= std_logic_vector(resize(Signed(H0_5(i)),10));
		A0_6(i) <= std_logic_vector(resize(Signed(H0_6(i)),10));
		A0_7(i) <= std_logic_vector(resize(Signed(H0_7(i)),10));
	END GENERATE;
	
	
	with SELETOR select 
		V_7		<=	A0_7 	when "000",
					H1_7	when "001",
					H2_7	when "010",
					H3_7 	when "011",
					H4_7 	when "100",
					H5_7 	when "101",
					H6_7 	when "110",
					H7_7 	when "111";
					
					
	with SELETOR select 
		V_6		<=	A0_6 	when "000",
					H1_6	when "001",
					H2_6	when "010",
					H3_6 	when "011",
					H4_6 	when "100",
					H5_6 	when "101",
					H6_6 	when "110",
					H7_6 	when "111";				
	
	with SELETOR select 
		V_5		<=	A0_5 	when "000",
					H1_5	when "001",
					H2_5	when "010",
					H3_5 	when "011",
					H4_5 	when "100",
					H5_5 	when "101",
					H6_5 	when "110",
					H7_5 	when "111";
					
	with SELETOR select 
		V_4		<=	A0_4 	when "000",
					H1_4	when "001",
					H2_4	when "010",
					H3_4 	when "011",
					H4_4 	when "100",
					H5_4 	when "101",
					H6_4 	when "110",
					H7_4 	when "111";	
					
	with SELETOR select 
		V_3		<=	A0_3 	when "000",
					H1_3	when "001",
					H2_3	when "010",
					H3_3 	when "011",
					H4_3 	when "100",
					H5_3 	when "101",
					H6_3 	when "110",
					H7_3 	when "111";	
					
	with SELETOR select 
		V_2		<=	A0_2 	when "000",
					H1_2	when "001",
					H2_2	when "010",
					H3_2 	when "011",
					H4_2 	when "100",
					H5_2 	when "101",
					H6_2 	when "110",
					H7_2 	when "111";	
					
	with SELETOR select 
		V_1		<=	A0_1 	when "000",
					H1_1	when "001",
					H2_1	when "010",
					H3_1 	when "011",
					H4_1 	when "100",
					H5_1 	when "101",
					H6_1 	when "110",
					H7_1 	when "111";	
					
	with SELETOR select 
		V_0		<=	A0_0 	when "000",
					H1_0	when "001",
					H2_0	when "010",
					H3_0 	when "011",
					H4_0 	when "100",
					H5_0 	when "101",
					H6_0 	when "110",
					H7_0 	when "111";																
	
	S0 <=  std_logic_vector(resize(Signed(V_0(3)),12));
	S8 <=  std_logic_vector(resize(Signed(V_1(3)),12));
	S16 <= std_logic_vector(resize(Signed(V_2(3)),12));
	S24 <= std_logic_vector(resize(Signed(V_3(3)),12));
	S32 <= std_logic_vector(resize(Signed(V_4(3)),12));
	S40 <= std_logic_vector(resize(Signed(V_5(3)),12));
	S48 <= std_logic_vector(resize(Signed(V_6(3)),12));
	S56 <= std_logic_vector(resize(Signed(V_7(3)),12));
	
	--V0: F_triplo GENERIC MAP (10) port map(V_7(0),V_6(0),V_5(0),V_4(0),V_3(0),V_2(0),V_1(0),V_0(0), S1,S2,S3,S4,S5,S6,S7);
	--V1: F_triplo GENERIC MAP (10) port map(V_7(1),V_6(1),V_5(1),V_4(1),V_3(1),V_2(1),V_1(1),V_0(1), S9,S10,S11,S12,S13,S14,S15);
	--V2: F_triplo GENERIC MAP (10) port map(V_7(2),V_6(2),V_5(2),V_4(2),V_3(2),V_2(2),V_1(2),V_0(2), S17,S18,S19,S20,S21,S22,S23);
	--V3: F_triplo GENERIC MAP (10) port map(V_7(3),V_6(3),V_5(3),V_4(3),V_3(3),V_2(3),V_1(3),V_0(3), S25,S26,S27,S28,S29,S30,S31);
	--V4: F_triplo GENERIC MAP (10) port map(V_7(4),V_6(4),V_5(4),V_4(4),V_3(4),V_2(4),V_1(4),V_0(4), S33,S34,S35,S36,S37,S38,S39);
	--V5: F_triplo GENERIC MAP (10) port map(V_7(5),V_6(5),V_5(5),V_4(5),V_3(5),V_2(5),V_1(5),V_0(5), S41,S42,S43,S44,S45,S46,S47);
	--V6: F_triplo GENERIC MAP (10) port map(V_7(6),V_6(6),V_5(6),V_4(6),V_3(6),V_2(6),V_1(6),V_0(6), S49,S50,S51,S52,S53,S54,S55);
	--V7: F_triplo GENERIC MAP (10) port map(V_7(7),V_6(7),V_5(7),V_4(7),V_3(7),V_2(7),V_1(7),V_0(7), S57,S58,S59,S60,S61,S62,S63);	
		
	-- controle
	PROCESS (CLK,RESET)
		BEGIN
		IF (RESET='1') THEN
			estado <= loading;
			LOAD <= '0';
			cont <= 0;
			SELETOR <= "000";
				
		ELSE
			IF (CLK'EVENT AND CLK = '1') THEN
				
					CASE estado IS
					
					
						WHEN loading =>
							LOAD <= '1';
							enable<= '1';							
							
							IF (cont>=7) THEN
								estado <= vertical;
								cont<=0;
								LOAD <= '0';
								SELETOR <= "000";
							ELSE
								cont<=cont+1;
							END IF;
						
						
						WHEN vertical =>
							LOAD <= '0';
							enable<= '0';
							CASE cont IS
								WHEN 0 =>
									SELETOR <= "00";
								WHEN 1 =>
									SELETOR <= "01";
								WHEN 2 =>
									SELETOR <= "10";
								WHEN OTHERS  =>
									SELETOR <= "11";
							END CASE;
								
							IF(cont>=3) THEN
								estado <= horizontal;
								cont<=0;
							ELSE
								cont<=cont+1;
							END IF;		
								
													
						WHEN horizontal =>
							LOAD <= '1';
							enable<= '1';
							SELETOR <= "00";							
							estado <= vertical;
							
					END CASE;
				END IF;	
			END IF;
		END PROCESS;	
end arc;
