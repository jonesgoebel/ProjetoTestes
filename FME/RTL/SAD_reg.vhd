LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity SAD_reg is
	port (
		CLK: IN std_logic;
		RESET_SAD: IN std_logic;
		ENABLE_SAD: IN std_logic;
		SELETOR: IN BIT_VECTOR(2 downto 0);
		CAL_SAD: IN std_logic;	
		A0, A1, A2, A3, A4, A5, A6, A7: IN std_logic_vector(7 downto 0);
		READY: OUT  std_logic;	
		MVX,MVY: OUT std_logic_vector(2 downto 0);
		SAD: OUT std_logic_vector(16 downto 0)
	);
end SAD_reg;

architecture arc of SAD_reg is
	TYPE reg IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 15 downto 0);
	SIGNAL REG_SAD: reg(63 downto 0);
	SIGNAL AUX_SAD: reg(7 downto 0);
	SIGNAL SOMA_SAD: reg(7 downto 0);
	SIGNAL CAL_SAD: reg(6 downto 0);
	SIGNAL BEST_SAD: STD_LOGIC_VECTOR( 15 downto 0);
	
	SIGNAL VETORX,VETORY: OUT std_logic_vector(2 downto 0);
	SIGNAL SAD_A: OUT std_logic_vector(16 downto 0)
	
begin				
	PROCESS (CLK)
		BEGIN
			IF (CLK'EVENT AND CLK = '1') THEN
				IF(RESET_SAD ='1') THEN
					
					REG_SAD(0) <="0000000000000000";	
					REG_SAD(1) <="0000000000000000";	
					REG_SAD(2) <="0000000000000000";	
					REG_SAD(3) <="0000000000000000";	
					REG_SAD(4) <="0000000000000000";	
					REG_SAD(5) <="0000000000000000";	
					REG_SAD(6) <="0000000000000000";	
					REG_SAD(7) <="0000000000000000";	
					REG_SAD(8) <="0000000000000000";	
					REG_SAD(9) <="0000000000000000";	
					REG_SAD(10)<="0000000000000000";	
					REG_SAD(11)<="0000000000000000";	
					REG_SAD(12)<="0000000000000000";	
					REG_SAD(13)<="0000000000000000";	
					REG_SAD(14)<="0000000000000000";	
					REG_SAD(15)<="0000000000000000";	
					REG_SAD(16)<="0000000000000000";	
					REG_SAD(17)<="0000000000000000";	
					REG_SAD(18)<="0000000000000000";	
					REG_SAD(19)<="0000000000000000";	
					REG_SAD(20)<="0000000000000000";	
					REG_SAD(21)<="0000000000000000";	
					REG_SAD(22)<="0000000000000000";	
					REG_SAD(23)<="0000000000000000";	
					REG_SAD(24)<="0000000000000000";	
					REG_SAD(25)<="0000000000000000";	
					REG_SAD(26)<="0000000000000000";	
					REG_SAD(27)<="0000000000000000";	
					REG_SAD(28)<="0000000000000000";	
					REG_SAD(29)<="0000000000000000";	
					REG_SAD(30)<="0000000000000000";	
					REG_SAD(31)<="0000000000000000";	
					REG_SAD(32)<="0000000000000000";	
					REG_SAD(33)<="0000000000000000";	
					REG_SAD(34)<="0000000000000000";	
					REG_SAD(35)<="0000000000000000";	
					REG_SAD(36)<="0000000000000000";	
					REG_SAD(37)<="0000000000000000";	
					REG_SAD(38)<="0000000000000000";	
					REG_SAD(39)<="0000000000000000";	
					REG_SAD(40)<="0000000000000000";	
					REG_SAD(41)<="0000000000000000";	
					REG_SAD(42)<="0000000000000000";	
					REG_SAD(43)<="0000000000000000";	
					REG_SAD(44)<="0000000000000000";	
					REG_SAD(45)<="0000000000000000";	
					REG_SAD(46)<="0000000000000000";	
					REG_SAD(47)<="0000000000000000";	
					REG_SAD(48)<="0000000000000000";	
					REG_SAD(49)<="0000000000000000";	
					REG_SAD(50)<="0000000000000000";	
					REG_SAD(51)<="0000000000000000";	
					REG_SAD(52)<="0000000000000000";	
					REG_SAD(53)<="0000000000000000";	
					REG_SAD(54)<="0000000000000000";	
					REG_SAD(55)<="0000000000000000";	
					REG_SAD(56)<="0000000000000000";	
					REG_SAD(57)<="0000000000000000";	
					REG_SAD(58)<="0000000000000000";	
					REG_SAD(59)<="0000000000000000";	
					REG_SAD(60)<="0000000000000000";	
					REG_SAD(61)<="0000000000000000";	
					REG_SAD(62)<="0000000000000000";	
					REG_SAD(63)<="0000000000000000";	
				
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
	
	SOMA_SAD(0) <= AUX_SAD(0)+A0;
	SOMA_SAD(1) <= AUX_SAD(1)+A1;
	SOMA_SAD(2) <= AUX_SAD(2)+A2;
	SOMA_SAD(3) <= AUX_SAD(3)+A3;
	SOMA_SAD(4) <= AUX_SAD(4)+A4;
	SOMA_SAD(5) <= AUX_SAD(5)+A5;
	SOMA_SAD(6) <= AUX_SAD(6)+A6;
	SOMA_SAD(7) <= AUX_SAD(7)+A7;
	
	
	when SOMA_SAD(0)-SOMA_SAD(1) > 0 else  

	
end arc;
