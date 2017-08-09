
library IEEE;
use IEEE.std_logic_1164.all;

entity F_triplo is   -- filtro triplo (up,middle,down)
  port (	a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(7 downto 0);   -- entradas (pixels)
        	resultado0,resultado1, resultado2 : out std_logic_vector(7 downto 0));  -- products
end entity F_triplo;

architecture circuits of F_triplo is
	ENTITY F_up IS
		PORT(	a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(7 downto 0);   
        		resultado : out std_logic_vector(7 downto 0));  -- product
	END F_up;
	ENTITY F_down IS
		PORT(	a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(7 downto 0);
        		resultado : out std_logic_vector(7 downto 0));  -- product
	END F_down;
	ENTITY F_middle IS
		PORT(	a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(7 downto 0);
        		resultado : out std_logic_vector(7 downto 0));  -- product
	END F_middle;   
begin  -- circuits of F_triplo

f1: F_up
	PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,resultado0);
f2: F_middle
	PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,resultado1);
f3: F_down
	PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,resultado2);

end architecture circuits;  -- of F_triplo