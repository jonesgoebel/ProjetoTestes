library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity F_middle is   -- filtro bolinha middle
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
end entity F_middle;

architecture circuits of F_middle is
begin  -- circuits of F_middle
  resultado <= std_logic_vector(resize(Signed(a0) * (-1) + Signed(a1) * (4) + Signed(a2) * (-11) + Signed(a3) * (40) + Signed(a4) * (40) + Signed(a5) * (-11) + Signed(a6) * (4) + Signed(a7) * (-1),N+8));   
 
end architecture circuits;  -- of F_middle
