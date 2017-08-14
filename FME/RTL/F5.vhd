library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F5 is   -- filtro triangulo up
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
end entity F5;

architecture circuits of F5 is
begin  -- circuits of F5

  resultado <= std_logic_vector(resize(Signed(a0) * (-3) + Signed(a1) * (9) + Signed(a2) * (-19) + Signed(a3) * (59) + Signed(a4) * (100) + Signed(a5) * (-24) + Signed(a6) * (10) + Signed(a7) * (-4),N+8));   
 
end architecture circuits;  -- of F5
