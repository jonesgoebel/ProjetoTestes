LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity SAD_reg is
	port (
		CLK: IN std_logic;
		RESET_SAD: IN std_logic;
		ENABLE_SAD: IN std_logic;
		SELETOR: IN BIT_VECTOR(2 downto 0);
		RESET_BEST_SAD: IN std_logic;	
		A0, A1, A2, A3, A4, A5, A6, A7: IN std_logic_vector(11 downto 0);
		MVX,MVY: OUT bit_vector(2 downto 0);
		SAD: OUT std_logic_vector(16 downto 0)
	);
end SAD_reg;

architecture arc of SAD_reg is
	TYPE reg IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 16 downto 0);
	SIGNAL REG_SAD: reg(63 downto 0);
	SIGNAL AUX_SAD: reg(7 downto 0);
	SIGNAL SOMA_SAD: reg(7 downto 0);
	
	SIGNAL CAL_BEST_SAD: reg(6 downto 0);
	SIGNAL BEST_SAD: STD_LOGIC_VECTOR( 16 downto 0);
	
	SIGNAL VY_0,VY_1,VY_2,VY_3,VY_4,VY_5,VY_6: bit_vector(2 downto 0);
	
	SIGNAL VX,VY: bit_vector(2 downto 0);
	SIGNAL SAD_R: std_logic_vector(16 downto 0);
	
	SIGNAL VETORX,VETORY: bit_vector(2 downto 0);
	SIGNAL SAD_A: std_logic_vector(16 downto 0);
	
begin				
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(RESET_SAD ='1') THEN
					
					REG_SAD(0) <="00000000000000000";	
					REG_SAD(1) <="00000000000000000";	
					REG_SAD(2) <="00000000000000000";	
					REG_SAD(3) <="00000000000000000";	
					REG_SAD(4) <="00000000000000000";	
					REG_SAD(5) <="00000000000000000";	
					REG_SAD(6) <="00000000000000000";	
					REG_SAD(7) <="00000000000000000";	
					REG_SAD(8) <="00000000000000000";	
					REG_SAD(9) <="00000000000000000";	
					REG_SAD(10)<="00000000000000000";	
					REG_SAD(11)<="00000000000000000";	
					REG_SAD(12)<="00000000000000000";	
					REG_SAD(13)<="00000000000000000";	
					REG_SAD(14)<="00000000000000000";	
					REG_SAD(15)<="00000000000000000";	
					REG_SAD(16)<="00000000000000000";	
					REG_SAD(17)<="00000000000000000";	
					REG_SAD(18)<="00000000000000000";	
					REG_SAD(19)<="00000000000000000";	
					REG_SAD(20)<="00000000000000000";	
					REG_SAD(21)<="00000000000000000";	
					REG_SAD(22)<="00000000000000000";	
					REG_SAD(23)<="00000000000000000";	
					REG_SAD(24)<="00000000000000000";	
					REG_SAD(25)<="00000000000000000";	
					REG_SAD(26)<="00000000000000000";	
					REG_SAD(27)<="00000000000000000";	
					REG_SAD(28)<="00000000000000000";	
					REG_SAD(29)<="00000000000000000";	
					REG_SAD(30)<="00000000000000000";	
					REG_SAD(31)<="00000000000000000";	
					REG_SAD(32)<="00000000000000000";	
					REG_SAD(33)<="00000000000000000";	
					REG_SAD(34)<="00000000000000000";	
					REG_SAD(35)<="00000000000000000";	
					REG_SAD(36)<="00000000000000000";	
					REG_SAD(37)<="00000000000000000";	
					REG_SAD(38)<="00000000000000000";	
					REG_SAD(39)<="00000000000000000";	
					REG_SAD(40)<="00000000000000000";	
					REG_SAD(41)<="00000000000000000";	
					REG_SAD(42)<="00000000000000000";	
					REG_SAD(43)<="00000000000000000";	
					REG_SAD(44)<="00000000000000000";	
					REG_SAD(45)<="00000000000000000";	
					REG_SAD(46)<="00000000000000000";	
					REG_SAD(47)<="00000000000000000";	
					REG_SAD(48)<="00000000000000000";	
					REG_SAD(49)<="00000000000000000";	
					REG_SAD(50)<="00000000000000000";	
					REG_SAD(51)<="00000000000000000";	
					REG_SAD(52)<="00000000000000000";	
					REG_SAD(53)<="00000000000000000";	
					REG_SAD(54)<="00000000000000000";	
					REG_SAD(55)<="00000000000000000";	
					REG_SAD(56)<="00000000000000000";	
					REG_SAD(57)<="00000000000000000";	
					REG_SAD(58)<="00000000000000000";	
					REG_SAD(59)<="00000000000000000";	
					REG_SAD(60)<="00000000000000000";	
					REG_SAD(61)<="00000000000000000";	
					REG_SAD(62)<="00000000000000000";	
					REG_SAD(63)<="00000000000000000";
					
				ELSE
					IF(ENABLE_SAD ='1') THEN
						CASE SELETOR IS
						WHEN "000" =>
							REG_SAD(0) <=SOMA_SAD(0);
							REG_SAD(8) <=SOMA_SAD(1);
							REG_SAD(16)<=SOMA_SAD(2);
							REG_SAD(24)<=SOMA_SAD(3);
							REG_SAD(32)<=SOMA_SAD(4);
							REG_SAD(40)<=SOMA_SAD(5);
							REG_SAD(48)<=SOMA_SAD(6);
							REG_SAD(56)<=SOMA_SAD(7);
						WHEN "001" =>
							REG_SAD(1) <=SOMA_SAD(0);
							REG_SAD(9) <=SOMA_SAD(1);
							REG_SAD(17)<=SOMA_SAD(2);
							REG_SAD(25)<=SOMA_SAD(3);
							REG_SAD(33)<=SOMA_SAD(4);
							REG_SAD(41)<=SOMA_SAD(5);
							REG_SAD(49)<=SOMA_SAD(6);
							REG_SAD(57)<=SOMA_SAD(7);
						WHEN "010" =>
							REG_SAD(2) <=SOMA_SAD(0);
							REG_SAD(10)<=SOMA_SAD(1);
							REG_SAD(18)<=SOMA_SAD(2);
							REG_SAD(26)<=SOMA_SAD(3);
							REG_SAD(34)<=SOMA_SAD(4);
							REG_SAD(42)<=SOMA_SAD(5);
							REG_SAD(50)<=SOMA_SAD(6);
							REG_SAD(58)<=SOMA_SAD(7);
						WHEN "011" =>
							REG_SAD(3) <=SOMA_SAD(0);
							REG_SAD(11)<=SOMA_SAD(1);
							REG_SAD(19)<=SOMA_SAD(2);
							REG_SAD(27)<=SOMA_SAD(3);
							REG_SAD(35)<=SOMA_SAD(4);
							REG_SAD(43)<=SOMA_SAD(5);
							REG_SAD(51)<=SOMA_SAD(6);
							REG_SAD(59)<=SOMA_SAD(7);	
						WHEN "100" =>
							REG_SAD(4) <=SOMA_SAD(0);
							REG_SAD(12)<=SOMA_SAD(1);
							REG_SAD(20)<=SOMA_SAD(2);
							REG_SAD(28)<=SOMA_SAD(3);
							REG_SAD(36)<=SOMA_SAD(4);
							REG_SAD(44)<=SOMA_SAD(5);
							REG_SAD(52)<=SOMA_SAD(6);
							REG_SAD(60)<=SOMA_SAD(7);	
						WHEN "101" =>
							REG_SAD(5) <=SOMA_SAD(0);
							REG_SAD(13)<=SOMA_SAD(1);
							REG_SAD(21)<=SOMA_SAD(2);
							REG_SAD(29)<=SOMA_SAD(3);
							REG_SAD(37)<=SOMA_SAD(4);
							REG_SAD(45)<=SOMA_SAD(5);
							REG_SAD(53)<=SOMA_SAD(6);
							REG_SAD(61)<=SOMA_SAD(7);	
						WHEN "110" =>
							REG_SAD(6) <=SOMA_SAD(0);
							REG_SAD(14)<=SOMA_SAD(1);
							REG_SAD(22)<=SOMA_SAD(2);
							REG_SAD(30)<=SOMA_SAD(3);
							REG_SAD(38)<=SOMA_SAD(4);
							REG_SAD(46)<=SOMA_SAD(5);
							REG_SAD(54)<=SOMA_SAD(6);
							REG_SAD(62)<=SOMA_SAD(7);	
						WHEN "111" =>
							REG_SAD(7) <=SOMA_SAD(0);
							REG_SAD(15)<=SOMA_SAD(1);
							REG_SAD(23)<=SOMA_SAD(2);
							REG_SAD(31)<=SOMA_SAD(3);
							REG_SAD(39)<=SOMA_SAD(4);
							REG_SAD(47)<=SOMA_SAD(5);
							REG_SAD(55)<=SOMA_SAD(6);
							REG_SAD(63)<=SOMA_SAD(7);	
						END CASE;
						
					END IF;
				END IF;	
			END IF;
	END PROCESS;
	
	
	PROCESS (CLK)
		BEGIN
		IF (CLK'EVENT AND CLK = '1') THEN
			IF(RESET_BEST_SAD ='1') THEN
				VETORX <= "000";
				VETORY <= "000";
				BEST_SAD <= "11111111111111111";	
			ELSE
				VETORX <= VX;
				VETORY <= VY;
				BEST_SAD <= SAD_A;
			END IF;		
		END IF;
	END PROCESS;
	
	--------------------------------------------------------------
	V_i:FOR i IN 0 to 7 GENERATE
		with SELETOR select 
			AUX_SAD(i)<=	REG_SAD(i*8) 		when "000",
							REG_SAD((i*8)+1)	when "001",
							REG_SAD((i*8)+2)	when "010",
							REG_SAD((i*8)+3)	when "011",
							REG_SAD((i*8)+4)	when "100",
							REG_SAD((i*8)+5)	when "101",
							REG_SAD((i*8)+6)	when "110",
							REG_SAD((i*8)+7)	when "111";	
	END GENERATE;					
	
	SOMA_SAD(0) <= std_logic_vector(signed(AUX_SAD(0))+signed(A0));
	SOMA_SAD(1) <= std_logic_vector(signed(AUX_SAD(1))+signed(A1));
	SOMA_SAD(2) <= std_logic_vector(signed(AUX_SAD(2))+signed(A2));
	SOMA_SAD(3) <= std_logic_vector(signed(AUX_SAD(3))+signed(A3));
	SOMA_SAD(4) <= std_logic_vector(signed(AUX_SAD(4))+signed(A4));
	SOMA_SAD(5) <= std_logic_vector(signed(AUX_SAD(5))+signed(A5));
	SOMA_SAD(6) <= std_logic_vector(signed(AUX_SAD(6))+signed(A6));
	SOMA_SAD(7) <= std_logic_vector(signed(AUX_SAD(7))+signed(A7));
	
	------------------------------------------------------------------------
	CAL_BEST_SAD(0) <= SOMA_SAD(0) WHEN SOMA_SAD(0) < SOMA_SAD(1) ELSE SOMA_SAD(1);
	CAL_BEST_SAD(1) <= SOMA_SAD(2) WHEN SOMA_SAD(2) < SOMA_SAD(3) ELSE SOMA_SAD(3);
	CAL_BEST_SAD(2) <= SOMA_SAD(4) WHEN SOMA_SAD(4) < SOMA_SAD(5) ELSE SOMA_SAD(5);
	CAL_BEST_SAD(3) <= SOMA_SAD(6) WHEN SOMA_SAD(6) < SOMA_SAD(7) ELSE SOMA_SAD(7);
	
	CAL_BEST_SAD(4) <= CAL_BEST_SAD(0) WHEN CAL_BEST_SAD(0) < CAL_BEST_SAD(1) ELSE CAL_BEST_SAD(1);
	CAL_BEST_SAD(5) <= CAL_BEST_SAD(2) WHEN CAL_BEST_SAD(2) < CAL_BEST_SAD(3) ELSE CAL_BEST_SAD(3);
	
	CAL_BEST_SAD(6) <= CAL_BEST_SAD(4) WHEN CAL_BEST_SAD(4) < CAL_BEST_SAD(5) ELSE CAL_BEST_SAD(5);
	
	SAD_A <= CAL_BEST_SAD(6) WHEN CAL_BEST_SAD(6) < BEST_SAD ELSE BEST_SAD;
	
	--------------------------------------------------------------------------
	VY_0 <= "000" WHEN SOMA_SAD(0) < SOMA_SAD(1) ELSE "001";
	VY_1 <= "010" WHEN SOMA_SAD(2) < SOMA_SAD(3) ELSE "011";
	VY_2 <= "100" WHEN SOMA_SAD(4) < SOMA_SAD(5) ELSE "101";
	VY_3 <= "110" WHEN SOMA_SAD(6) < SOMA_SAD(7) ELSE "111";
	
	VY_4 <= VY_0 WHEN CAL_BEST_SAD(0) < CAL_BEST_SAD(1) ELSE VY_1;
	VY_5 <= VY_2 WHEN CAL_BEST_SAD(2) < CAL_BEST_SAD(3) ELSE VY_3;
	
	VY_6 <= VY_4 WHEN CAL_BEST_SAD(4) < CAL_BEST_SAD(5) ELSE VY_5;
	
	VY <= VY_6 WHEN CAL_BEST_SAD(6) < BEST_SAD ELSE VETORY;
	
	VX <= SELETOR WHEN CAL_BEST_SAD(6) < BEST_SAD ELSE VETORX;
	
	--------------------------------------------------------------------------
	MVX <= VETORX;
	MVY <= VETORY;
	
	SAD <= BEST_SAD;
end arc;
