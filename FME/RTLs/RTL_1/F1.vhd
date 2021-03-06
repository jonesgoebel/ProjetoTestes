library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F1 is   -- filtro triangulo up
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
end entity F1;

architecture circuits of F1 is
 
begin  -- circuits of F1


--resultado <= std_logic_vector(resize(Signed('0'&a1)*(-2),N+8));   
  resultado <= std_logic_vector(resize(Signed(a0) * (-2) + Signed(a1) * (5) + Signed(a2) * (-13) + Signed(a3) * (125) + Signed(a4) * (17) + Signed(a5) * (-6) + Signed(a6) * (3) + Signed(a7) * (-1),N+9));   
 
end architecture circuits;  -- of F1
