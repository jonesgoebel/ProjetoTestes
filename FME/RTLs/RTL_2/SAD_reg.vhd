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
		A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,
		A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,
		A32,A33,A34,A35,A36,A37,A38,A39,A40,A41,A42,A43,A44,A45,A46,A47,
		A48,A49,A50,A51,A52,A53,A54,A55,A56,A57,A58,A59,A60,A61,A62,A63: IN std_logic_vector(11 downto 0);
		MVX,MVY: OUT bit_vector(2 downto 0);
		SAD: OUT std_logic_vector(16 downto 0)
	);
end SAD_reg;

architecture arc of SAD_reg is
	TYPE reg IS ARRAY (natural range <>) OF STD_LOGIC_VECTOR( 16 downto 0);
	SIGNAL REG_SAD: reg(63 downto 0);
	SIGNAL AUX_SAD: reg(7 downto 0);
	SIGNAL SOMA_SAD: reg(63 downto 0);
	
	SIGNAL CAL_BEST_SAD: reg(6 downto 0);
	SIGNAL BEST_SAD: STD_LOGIC_VECTOR( 16 downto 0);
	
	SIGNAL VY_0,VY_1,VY_2,VY_3,VY_4,VY_5,VY_6: bit_vector(2 downto 0);
	
	SIGNAL VX,VY: bit_vector(2 downto 0);
	
	
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
						REG_SAD(0) <=SOMA_SAD(0);
						REG_SAD(1) <=SOMA_SAD(1);
						REG_SAD(2) <=SOMA_SAD(2);
						REG_SAD(3) <=SOMA_SAD(3);
						REG_SAD(4) <=SOMA_SAD(4);
						REG_SAD(5) <=SOMA_SAD(5);
						REG_SAD(6) <=SOMA_SAD(6);
						REG_SAD(7) <=SOMA_SAD(7);
						REG_SAD(8) <=SOMA_SAD(8);
						REG_SAD(9) <=SOMA_SAD(9);
						REG_SAD(10) <=SOMA_SAD(10);
						REG_SAD(11) <=SOMA_SAD(11);
						REG_SAD(12) <=SOMA_SAD(12);
						REG_SAD(13) <=SOMA_SAD(13);
						REG_SAD(14) <=SOMA_SAD(14);
						REG_SAD(15) <=SOMA_SAD(15);
						REG_SAD(16) <=SOMA_SAD(16);
						REG_SAD(17) <=SOMA_SAD(17);
						REG_SAD(18) <=SOMA_SAD(18);
						REG_SAD(19) <=SOMA_SAD(19);
						REG_SAD(20) <=SOMA_SAD(20);
						REG_SAD(21) <=SOMA_SAD(21);
						REG_SAD(22) <=SOMA_SAD(22);
						REG_SAD(23) <=SOMA_SAD(23);
						REG_SAD(24) <=SOMA_SAD(24);
						REG_SAD(25) <=SOMA_SAD(25);
						REG_SAD(26) <=SOMA_SAD(26);
						REG_SAD(27) <=SOMA_SAD(27);
						REG_SAD(28) <=SOMA_SAD(28);
						REG_SAD(29) <=SOMA_SAD(29);
						REG_SAD(30) <=SOMA_SAD(30);
						REG_SAD(31) <=SOMA_SAD(31);
						REG_SAD(32) <=SOMA_SAD(32);
						REG_SAD(33) <=SOMA_SAD(33);
						REG_SAD(34) <=SOMA_SAD(34);
						REG_SAD(35) <=SOMA_SAD(35);
						REG_SAD(36) <=SOMA_SAD(36);
						REG_SAD(37) <=SOMA_SAD(37);
						REG_SAD(38) <=SOMA_SAD(38);
						REG_SAD(39) <=SOMA_SAD(39);
						REG_SAD(40) <=SOMA_SAD(40);
						REG_SAD(41) <=SOMA_SAD(41);
						REG_SAD(42) <=SOMA_SAD(42);
						REG_SAD(43) <=SOMA_SAD(43);
						REG_SAD(44) <=SOMA_SAD(44);
						REG_SAD(45) <=SOMA_SAD(45);
						REG_SAD(46) <=SOMA_SAD(46);
						REG_SAD(47) <=SOMA_SAD(47);
						REG_SAD(48) <=SOMA_SAD(48);
						REG_SAD(49) <=SOMA_SAD(49);
						REG_SAD(50) <=SOMA_SAD(50);
						REG_SAD(51) <=SOMA_SAD(51);
						REG_SAD(52) <=SOMA_SAD(52);
						REG_SAD(53) <=SOMA_SAD(53);
						REG_SAD(54) <=SOMA_SAD(54);
						REG_SAD(55) <=SOMA_SAD(55);
						REG_SAD(56) <=SOMA_SAD(56);
						REG_SAD(57) <=SOMA_SAD(57);
						REG_SAD(58) <=SOMA_SAD(58);
						REG_SAD(59) <=SOMA_SAD(59);
						REG_SAD(60) <=SOMA_SAD(60);
						REG_SAD(61) <=SOMA_SAD(61);
						REG_SAD(62) <=SOMA_SAD(62);
						REG_SAD(63) <=SOMA_SAD(63);

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
				BEST_SAD <= "01111111111111111";	
			ELSE
				VETORX <= VX;
				VETORY <= VY;
				BEST_SAD <= SAD_A;
			END IF;		
		END IF;
	END PROCESS;
	
	--------------------------------------------------------------					
	
	SOMA_SAD(0) <= std_logic_vector(signed(REG_SAD(0))+signed(A0));
	SOMA_SAD(1) <= std_logic_vector(signed(REG_SAD(1))+signed(A1));
	SOMA_SAD(2) <= std_logic_vector(signed(REG_SAD(2))+signed(A2));
	SOMA_SAD(3) <= std_logic_vector(signed(REG_SAD(3))+signed(A3));
	SOMA_SAD(4) <= std_logic_vector(signed(REG_SAD(4))+signed(A4));
	SOMA_SAD(5) <= std_logic_vector(signed(REG_SAD(5))+signed(A5));
	SOMA_SAD(6) <= std_logic_vector(signed(REG_SAD(6))+signed(A6));
	SOMA_SAD(7) <= std_logic_vector(signed(REG_SAD(7))+signed(A7));
	SOMA_SAD(8) <= std_logic_vector(signed(REG_SAD(8))+signed(A8));
	SOMA_SAD(9) <= std_logic_vector(signed(REG_SAD(9))+signed(A9));
	SOMA_SAD(10) <= std_logic_vector(signed(REG_SAD(10))+signed(A10));
	SOMA_SAD(11) <= std_logic_vector(signed(REG_SAD(11))+signed(A11));
	SOMA_SAD(12) <= std_logic_vector(signed(REG_SAD(12))+signed(A12));
	SOMA_SAD(13) <= std_logic_vector(signed(REG_SAD(13))+signed(A13));
	SOMA_SAD(14) <= std_logic_vector(signed(REG_SAD(14))+signed(A14));
	SOMA_SAD(15) <= std_logic_vector(signed(REG_SAD(15))+signed(A15));
    SOMA_SAD(16) <= std_logic_vector(signed(REG_SAD(16))+signed(A16));
    SOMA_SAD(17) <= std_logic_vector(signed(REG_SAD(17))+signed(A17));
    SOMA_SAD(18) <= std_logic_vector(signed(REG_SAD(18))+signed(A18));
    SOMA_SAD(19) <= std_logic_vector(signed(REG_SAD(19))+signed(A19));
    SOMA_SAD(20) <= std_logic_vector(signed(REG_SAD(20))+signed(A20));
    SOMA_SAD(21) <= std_logic_vector(signed(REG_SAD(21))+signed(A21));
    SOMA_SAD(22) <= std_logic_vector(signed(REG_SAD(22))+signed(A22));
    SOMA_SAD(23) <= std_logic_vector(signed(REG_SAD(23))+signed(A23));
	SOMA_SAD(24) <= std_logic_vector(signed(REG_SAD(24))+signed(A24));
	SOMA_SAD(25) <= std_logic_vector(signed(REG_SAD(25))+signed(A25));
	SOMA_SAD(26) <= std_logic_vector(signed(REG_SAD(26))+signed(A26));
	SOMA_SAD(27) <= std_logic_vector(signed(REG_SAD(27))+signed(A27));
	SOMA_SAD(28) <= std_logic_vector(signed(REG_SAD(28))+signed(A28));
	SOMA_SAD(29) <= std_logic_vector(signed(REG_SAD(29))+signed(A29));
	SOMA_SAD(30) <= std_logic_vector(signed(REG_SAD(30))+signed(A30));
	SOMA_SAD(31) <= std_logic_vector(signed(REG_SAD(31))+signed(A31));
	SOMA_SAD(32) <= std_logic_vector(signed(REG_SAD(32))+signed(A32));
	SOMA_SAD(33) <= std_logic_vector(signed(REG_SAD(33))+signed(A33));
	SOMA_SAD(34) <= std_logic_vector(signed(REG_SAD(34))+signed(A34));
	SOMA_SAD(35) <= std_logic_vector(signed(REG_SAD(35))+signed(A35));
	SOMA_SAD(36) <= std_logic_vector(signed(REG_SAD(36))+signed(A36));
	SOMA_SAD(37) <= std_logic_vector(signed(REG_SAD(37))+signed(A37));
	SOMA_SAD(38) <= std_logic_vector(signed(REG_SAD(38))+signed(A38));
	SOMA_SAD(39) <= std_logic_vector(signed(REG_SAD(39))+signed(A39));
	SOMA_SAD(40) <= std_logic_vector(signed(REG_SAD(40))+signed(A40));
	SOMA_SAD(41) <= std_logic_vector(signed(REG_SAD(41))+signed(A41));
	SOMA_SAD(42) <= std_logic_vector(signed(REG_SAD(42))+signed(A42));
	SOMA_SAD(43) <= std_logic_vector(signed(REG_SAD(43))+signed(A43));
	SOMA_SAD(44) <= std_logic_vector(signed(REG_SAD(44))+signed(A44));
	SOMA_SAD(45) <= std_logic_vector(signed(REG_SAD(45))+signed(A45));
	SOMA_SAD(46) <= std_logic_vector(signed(REG_SAD(46))+signed(A46));
	SOMA_SAD(47) <= std_logic_vector(signed(REG_SAD(47))+signed(A47));
	SOMA_SAD(48) <= std_logic_vector(signed(REG_SAD(48))+signed(A48));
	SOMA_SAD(49) <= std_logic_vector(signed(REG_SAD(49))+signed(A49));
	SOMA_SAD(50) <= std_logic_vector(signed(REG_SAD(50))+signed(A50));
	SOMA_SAD(51) <= std_logic_vector(signed(REG_SAD(51))+signed(A51));
	SOMA_SAD(52) <= std_logic_vector(signed(REG_SAD(52))+signed(A52));
	SOMA_SAD(53) <= std_logic_vector(signed(REG_SAD(53))+signed(A53));
	SOMA_SAD(54) <= std_logic_vector(signed(REG_SAD(54))+signed(A54));
	SOMA_SAD(55) <= std_logic_vector(signed(REG_SAD(55))+signed(A55));
	SOMA_SAD(56) <= std_logic_vector(signed(REG_SAD(56))+signed(A56));
	SOMA_SAD(57) <= std_logic_vector(signed(REG_SAD(57))+signed(A57));
	SOMA_SAD(58) <= std_logic_vector(signed(REG_SAD(58))+signed(A58));
	SOMA_SAD(59) <= std_logic_vector(signed(REG_SAD(59))+signed(A59));
	SOMA_SAD(60) <= std_logic_vector(signed(REG_SAD(60))+signed(A60));
	SOMA_SAD(61) <= std_logic_vector(signed(REG_SAD(61))+signed(A61));
	SOMA_SAD(62) <= std_logic_vector(signed(REG_SAD(62))+signed(A62));
	SOMA_SAD(63) <= std_logic_vector(signed(REG_SAD(63))+signed(A63));



	------------------------------------------------------------------------
	
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
	
	
	CAL_BEST_SAD(0) <= AUX_SAD(0) WHEN AUX_SAD(0) < AUX_SAD(1) ELSE AUX_SAD(1);
	CAL_BEST_SAD(1) <= AUX_SAD(2) WHEN AUX_SAD(2) < AUX_SAD(3) ELSE AUX_SAD(3);
	CAL_BEST_SAD(2) <= AUX_SAD(4) WHEN AUX_SAD(4) < AUX_SAD(5) ELSE AUX_SAD(5);
	CAL_BEST_SAD(3) <= AUX_SAD(6) WHEN AUX_SAD(6) < AUX_SAD(7) ELSE AUX_SAD(7);
	
	CAL_BEST_SAD(4) <= CAL_BEST_SAD(0) WHEN CAL_BEST_SAD(0) < CAL_BEST_SAD(1) ELSE CAL_BEST_SAD(1);
	CAL_BEST_SAD(5) <= CAL_BEST_SAD(2) WHEN CAL_BEST_SAD(2) < CAL_BEST_SAD(3) ELSE CAL_BEST_SAD(3);
	
	CAL_BEST_SAD(6) <= CAL_BEST_SAD(4) WHEN CAL_BEST_SAD(4) < CAL_BEST_SAD(5) ELSE CAL_BEST_SAD(5);
	
	SAD_A <= CAL_BEST_SAD(6) WHEN CAL_BEST_SAD(6) < BEST_SAD ELSE BEST_SAD;
	
	----------------------------------------------------------------------------
	VY_0 <= "000" WHEN AUX_SAD(0) <= AUX_SAD(1) ELSE "001";
	VY_1 <= "010" WHEN AUX_SAD(2) <= AUX_SAD(3) ELSE "011";
	VY_2 <= "100" WHEN AUX_SAD(4) <= AUX_SAD(5) ELSE "101";
	VY_3 <= "110" WHEN AUX_SAD(6) <= AUX_SAD(7) ELSE "111";
	
	VY_4 <= VY_0 WHEN CAL_BEST_SAD(0) <= CAL_BEST_SAD(1) ELSE VY_1;
	VY_5 <= VY_2 WHEN CAL_BEST_SAD(2) <= CAL_BEST_SAD(3) ELSE VY_3;
	
	VY_6 <= VY_4 WHEN CAL_BEST_SAD(4) <= CAL_BEST_SAD(5) ELSE VY_5;
	
	VY <= VY_6 WHEN CAL_BEST_SAD(6) < BEST_SAD ELSE VETORY;
	
	VX <= SELETOR WHEN CAL_BEST_SAD(6) < BEST_SAD ELSE VETORX;
	
	----------------------------------------------------------------------------
	MVX <= VETORX;
	MVY <= VETORY;
	
	SAD <= BEST_SAD;
end arc;
