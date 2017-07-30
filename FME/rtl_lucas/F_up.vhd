
library IEEE;
use IEEE.std_logic_1164.all;

entity F_up is   -- filtro triangulo up
  port (a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(7 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(7 downto 0));  -- product
end entity F_up;

architecture circuits of F_up is
begin  -- circuits of F_up
  resultado <= a0 * (-1) + a1 * (4) + a2 * (-10) + a3 * (58) + a4 * (17) + a5 * (-7) + a6 * (3) + a7 * (-1);   
 
end architecture circuits;  -- of F_up