LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity controle is
	port (
		CLK: IN std_logic;
		RESET: IN std_logic;	
		READY: IN  std_logic;
		LOAD_A: OUT  std_logic;
		LOAD_B: OUT  std_logic;
		ENABLE_RI: OUT  std_logic;	
		SELETOR: OUT BIT_VECTOR(2 downto 0);
		RESET_SAD: OUT std_logic;
		ENABLE_SAD: OUT std_logic;
		CAL_SAD: OUT std_logic
	);
end controle;

architecture arc of controle is
	
	type estados is (loading,vert_0,vert_1,vert_2,vert_3,vert_4,vert_5,vert_6,vert_7,horizontal,final);
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
			CAL_SAD <= '0';
			
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
							CAL_SAD <= '0';						
							
							IF (cont>=6) THEN
								estado <= horizontal;
								cont<=0;
							ELSE
								cont<=cont+1;
							END IF;
						
						WHEN vert_0 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "000";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							estado <= vert_1;
						
						WHEN vert_1 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "001";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							estado <= vert_2;	
						
						WHEN vert_2 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "010";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							estado <= vert_3;

						WHEN vert_3 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "011";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							estado <= vert_4;
							
						WHEN vert_4 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "100";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							estado <= vert_5;	
						
						WHEN vert_5 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "101";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							estado <= vert_6;
							
						WHEN vert_6 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "110";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							estado <= vert_7;
							
						WHEN vert_7 =>
							LOAD_A <= '0';
							LOAD_B <= '0';
							ENABLE_RI <= '0';
							SELETOR <= "111";
							RESET_SAD <= '0';
							ENABLE_SAD <= '1';
							CAL_SAD <= '0';		
							
							IF (cont>=6) THEN
								estado <= final;	
							ELSE
								estado <= horizontal;	
							END IF;
						
						WHEN horizontal =>
							LOAD_A <= '1';
							LOAD_B <= '1';
							ENABLE_RI <= '1';
							SELETOR <= "000";
							RESET_SAD <= '0';
							ENABLE_SAD <= '0';
							CAL_SAD <= '0';		

							cont<=cont+1;
							estado <= vert_0;

							
						WHEN final =>
							LOAD_A <= '1';
							LOAD_B <= '0';
							ENABLE_RI <= '1';
							SELETOR <= "000";
							RESET_SAD <= '1';
							ENABLE_SAD <= '0';
							CAL_SAD <= '0';		
		
							estado <= loading;
							cont<=1;

					END CASE;
				END IF;	
			END IF;
		END PROCESS;		

	
end arc;
