
library IEEE;
use IEEE.std_logic_1164.all;

entity F_down is   -- filtro triangulo down
  port (a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(7 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(7 downto 0));  -- product
end entity F_down;

architecture circuits of F_down is
begin  -- circuits of F_down
  resultado <= a0 * (-1) + a1 * (3) + a2 * (-7) + a3 * (17) + a4 * (58) + a5 * (-10) + a6 * (4) + a7 * (-1);   
 
end architecture circuits;  -- of F_down