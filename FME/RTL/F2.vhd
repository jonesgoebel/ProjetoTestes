library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F2 is   -- filtro triangulo up
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
end entity F2;

architecture circuits of F2 is
begin  -- circuits of F2

  resultado <= std_logic_vector(resize(Signed(a0) * (-4) + Signed(a1) * (9) + Signed(a2) * (-20) + Signed(a3) * (115) + Signed(a4) * (37) + Signed(a5) * (-13) + Signed(a6) * (6) + Signed(a7) * (-2),N+9));   
 
end architecture circuits;  -- of F2
