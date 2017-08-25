library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

entity filtro_V is   -- filtro triplo (up,middle,down)
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		A0,A1,A2,A3,A4,A5,A6,A7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
		s0,s1,s2,s3,s4,s5,s6 : out std_logic_vector(N+1 downto 0));  -- products
end entity filtro_V;

architecture circuits of filtro_V is 

COMPONENT F_sete IS
		GENERIC (N : INTEGER := 8);
		port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        um,dois,tres,quatro,cinco,seis,sete : out std_logic_vector(N+8 downto 0)  -- products
        );  
	END COMPONENT;
	
	COMPONENT shift IS
		GENERIC (N : INTEGER := 8); --numeros de bits
		port (
		a0,a1,a2,a3,a4,a5,a6 : in  std_logic_vector(N+8 downto 0);
        s0,s1,s2,s3,s4,s5,s6 : out std_logic_vector(N+1 downto 0)
		);
	END COMPONENT;	
	signal aux0,aux1,aux2,aux3,aux4,aux5,aux6:  std_logic_vector(N+8 downto 0);

	
BEGIN  

	F: F_sete GENERIC MAP (N) port map(A0,A1,A2,A3,A4,A5,A6,A7,aux0,aux1,aux2,aux3,aux4,aux5,aux6);
	
	S: shift GENERIC MAP (N) port map(aux0,aux1,aux2,aux3,aux4,aux5,aux6,s0,s1,s2,s3,s4,s5,s6);

	

end architecture circuits; 
