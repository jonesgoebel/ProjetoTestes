library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F3 is   -- filtro triangulo up
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
end entity F3;

architecture circuits of F3 is
begin  -- circuits of F3

  resultado <= std_logic_vector(resize(Signed(a0) * (-4) + Signed(a1) * (10) + Signed(a2) * (-24) + Signed(a3) * (100) + Signed(a4) * (59) + Signed(a5) * (-19) + Signed(a6) * (9) + Signed(a7) * (-3),N+9));   
 
end architecture circuits;  -- of F3
