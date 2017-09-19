library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

entity shift is   -- filtro triplo (up,middle,down)
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6 : in  std_logic_vector(N+8 downto 0);   -- entradas (pixels)
        s0,s1,s2,s3,s4,s5,s6 : out std_logic_vector(N+1 downto 0));  -- products
end entity shift;

architecture circuits of shift is

	SIGNAL aux_um1, aux_dois1, aux_tres1, aux_quatro1, aux_cinco1, aux_seis1, aux_sete1 : std_logic_vector(N+2 downto 0);  
	
	
BEGIN  -- circuits of F_sete


	
	aux_um1 <= std_logic_vector((Signed(a0(N+8 downto 6)))+1);
	aux_dois1 <= std_logic_vector((Signed(a1(N+8 downto 6)))+1);
	aux_tres1 <= std_logic_vector((Signed(a2(N+8 downto 6)))+1);
	aux_quatro1 <= std_logic_vector((Signed(a3(N+8 downto 6)))+1);
	aux_cinco1 <= std_logic_vector((Signed(a4(N+8 downto 6)))+1);
	aux_seis1 <= std_logic_vector((Signed(a5(N+8 downto 6)))+1);
	aux_sete1 <= std_logic_vector((Signed(a6(N+8 downto 6)))+1);
	
	s0 <= aux_um1(N+2 downto 1);
	s1 <= aux_dois1(N+2 downto 1);
	s2 <= aux_tres1(N+2 downto 1);
	s3 <= aux_quatro1(N+2 downto 1);
	s4 <= aux_cinco1(N+2 downto 1);
	s5 <= aux_seis1(N+2 downto 1);
	s6 <= aux_sete1(N+2 downto 1);

end architecture circuits;  -- of F_sete
