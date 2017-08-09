library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F_down is   -- filtro triangulo down
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
end entity F_down;

architecture circuits of F_down is
begin  -- circuits of F_down

  resultado <= std_logic_vector(resize(Signed(a0) * (-1) + Signed(a1) * (3) + Signed(a2) * (-7) + Signed(a3) * (17) + Signed(a4) * (58) + Signed(a5) * (-10) + Signed(a6) * (4) + Signed(a7) * (-1),N+8));   
 
end architecture circuits;  -- of F_down
