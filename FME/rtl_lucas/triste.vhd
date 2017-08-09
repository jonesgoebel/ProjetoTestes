library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity triste is   -- filtro bolinha middle
  port (a0,a1,a2,a3 : in  std_logic_vector(7 downto 0);   -- entradas (pixels)
  		b : in  std_logic_vector(7 downto 0);
        r0,r1,r2,r3 : out std_logic_vector(7 downto 0));  -- product
end entity triste;

architecture circuits of triste is
begin  -- circuits of triste
  r0 <= std_logic_vector(abs(signed(a0)-signed(b))); 
  r1 <= std_logic_vector(abs(signed(a1)-signed(b))); 
  r2 <= std_logic_vector(abs(signed(a2)-signed(b)));
  r3 <= std_logic_vector(abs(signed(a3)-signed(b)));   
end architecture circuits;  -- of triste