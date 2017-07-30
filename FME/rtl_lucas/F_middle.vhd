
library IEEE;
use IEEE.std_logic_1164.all;

entity F_middle is   -- filtro bolinha middle
  port (a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(7 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(7 downto 0));  -- product
end entity F_middle;

architecture circuits of F_middle is
begin  -- circuits of F_middle
  resultado <= a0 * (-1) + a1 * (4) + a2 * (-11) + a3 * (40) + a4 * (40) + a5 * (-11) + a6 * (4) + a7 * (-1);   
 
end architecture circuits;  -- of F_middle