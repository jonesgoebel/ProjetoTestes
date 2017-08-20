library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F4 is   -- filtro triangulo up
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
end entity F4;

architecture circuits of F4 is
begin  -- circuits of F4

  resultado <= std_logic_vector(resize(Signed(a0) * (-4) + Signed(a1) * (11) + Signed(a2) * (-23) + Signed(a3) * (80) + Signed(a4) * (80) + Signed(a5) * (-23) + Signed(a6) * (11) + Signed(a7) * (-4),N+8));   
 
end architecture circuits;  -- of F4
