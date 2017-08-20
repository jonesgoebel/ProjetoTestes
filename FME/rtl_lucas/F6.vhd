library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F6 is   -- filtro triangulo up
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
end entity F6;

architecture circuits of F6 is
begin  -- circuits of F6

  resultado <= std_logic_vector(resize(Signed(a0) * (-2) + Signed(a1) * (6) + Signed(a2) * (-13) + Signed(a3) * (37) + Signed(a4) * (115) + Signed(a5) * (-20) + Signed(a6) * (9) + Signed(a7) * (-4),N+8));   
 
end architecture circuits;  -- of F6
