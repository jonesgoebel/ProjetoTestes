library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

entity F_sete is   -- filtro triplo (up,middle,down)
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        um,dois,tres,quatro,cinco,seis,sete : out std_logic_vector(N+8 downto 0));  -- products
end entity F_sete;

architecture circuits of F_sete is 

	COMPONENT F1 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
	END COMPONENT;

	COMPONENT F2 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
	END COMPONENT;

	COMPONENT F3 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
	END COMPONENT;

	COMPONENT F4 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
	END COMPONENT;

	COMPONENT F5 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
	END COMPONENT;

	COMPONENT F6 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
	END COMPONENT;

	COMPONENT F7 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+8 downto 0));  -- product
	END COMPONENT;
	
	
	
	
	
BEGIN  -- circuits of F_sete

f1_a: F1
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,um);
f2_a: F2
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,dois);
f3_a: F3
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,tres);
f4_a: F4
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,quatro);
f5_a: F5
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,cinco);
f6_a: F6
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,seis);
f7_a: F7
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,sete);
	

end architecture circuits;  -- of F_sete
