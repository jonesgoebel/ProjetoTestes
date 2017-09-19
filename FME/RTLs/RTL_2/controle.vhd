LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity controle is
	port (
		CLK: IN std_logic;
		RESET: IN std_logic;	
		READY: OUT  std_logic;
		LOAD_A: OUT  std_logic;
		LOAD_B: OUT  std_logic;
		ENABLE_RI: OUT  std_logic;	
		SELETOR: OUT BIT_VECTOR(2 downto 0);
		RESET_SAD: OUT std_logic;
		ENABLE_SAD: OUT std_logic;
		RESET_BEST_SAD: OUT std_logic
	);
end controle;

architecture arc of controle is
	
	type estados is (loading,vert,horiz_0,horiz_1,horiz_2,horiz_3,horiz_4,horiz_5,horiz_6,horiz_7,resetBEST_SAD);
	signal estado:estados;
	signal cont: integer range 0 to 15;
	
begin				
	PROCESS (CLK,RESET)
		BEGIN
		IF (RESET='1') THEN
			LOAD_A <= '0';
			LOAD_B <= '0';
			ENABLE_RI <= '0';
			SELETOR <= "000";
			RESET_SAD <= '1';
			ENABLE_SAD <= '0';
			RESET_BEST_SAD <= '1';
			READY<='0';
			
			estado <= loading;
			cont <= 0;
				
		ELSE
			IF (CLK'EVENT AND CLK = '1') THEN
				
					CASE estado IS
					
						WHEN loading =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "000";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';						
							READY<='0';
							
							IF (cont>=7) THEN
								estado <= vert;
								cont<=0;
							ELSE
								cont<=cont+1;
							END IF;
						
						WHEN horiz_0 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "000";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= horiz_1;
						
						WHEN horiz_1 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "001";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= horiz_2;	
						
						WHEN horiz_2 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "010";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= horiz_3;

						WHEN horiz_3 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "011";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= horiz_4;
							
						WHEN horiz_4 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "100";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= horiz_5;	
						
						WHEN horiz_5 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "101";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= horiz_6;
							
						WHEN horiz_6 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "110";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= horiz_7;
							
						WHEN horiz_7 =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "111";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='0';
							
							estado <= resetBEST_SAD;	
						
						
						WHEN vert	=>
							LOAD_A <= '1';
							LOAD_B <= '1';
							ENABLE_RI <= '1';
							SELETOR <= "000";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';							
							--READY<='1';

							IF (cont>7) THEN
								estado <= horiz_0;	
								RESET_BEST_SAD <= '1';
							ELSE
								cont<=cont+1;
								RESET_BEST_SAD <= '0';		
							END IF;

							
						WHEN resetBEST_SAD =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "000";
							RESET_SAD <= '1';
							ENABLE_SAD <= '0';
							RESET_BEST_SAD <= '0';		
							READY<='1';
		
							estado <= vert;							
							

					END CASE;
				END IF;	
			END IF;
		END PROCESS;		

	
end arc;
