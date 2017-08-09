library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

entity F_triplo is   -- filtro triplo (up,middle,down)
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        up, middle, down : out std_logic_vector(N+1 downto 0));  -- products
end entity F_triplo;

architecture circuits of F_triplo is

	SIGNAL aux_up, aux_middle, aux_down : std_logic_vector(N+7 downto 0);    
	SIGNAL aux_up1, aux_middle1, aux_down1 : std_logic_vector(N+2 downto 0);  

	COMPONENT F_up IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;
	
	COMPONENT F_down IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;
	
	COMPONENT F_middle IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;
	
	
	
BEGIN  -- circuits of F_triplo

f1: F_up
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_up);
f2: F_middle
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_middle);
f3: F_down
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_down);
	
	aux_up1 <= std_logic_vector((Signed(aux_up(N+7 downto 5)))/2);
	aux_middle1 <= std_logic_vector((Signed(aux_middle(N+7 downto 5)))/2);
	aux_down1 <= std_logic_vector((Signed(aux_down(N+7 downto 5)))/2);
	
	up <= aux_up1(N+2 downto 1);
	middle <= aux_middle1(N+2 downto 1);
	down <= aux_down1(N+2 downto 1);
	

end architecture circuits;  -- of F_triplo
