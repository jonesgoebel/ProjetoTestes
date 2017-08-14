library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

entity F_sete is   -- filtro triplo (up,middle,down)
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        um,dois,tres,quatro,cinco,seis,sete : out std_logic_vector(N+1 downto 0));  -- products
end entity F_sete;

architecture circuits of F_sete is

	SIGNAL aux_um, aux_dois, aux_tres, aux_quatro, aux_cinco, aux_seis, aux_sete : std_logic_vector(N+7 downto 0);    
	SIGNAL aux_um1, aux_dois1, aux_tres1, aux_quatro1, aux_cinco1, aux_seis1, aux_sete1 : std_logic_vector(N+2 downto 0);  

	COMPONENT F1 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;

	COMPONENT F2 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;

	COMPONENT F3 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;

	COMPONENT F4 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;

	COMPONENT F5 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;

	COMPONENT F6 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;

	COMPONENT F7 IS
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
        resultado : out std_logic_vector(N+7 downto 0));  -- product
	END COMPONENT;
	
	
	
	
	
BEGIN  -- circuits of F_sete

f1: F1
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_um);
f2: F2
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_dois);
f3: F3
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_tres);
f4: F4
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_quatro);
f5: F5
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_cinco);
f6: F6
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_seis);
f7: F7
	GENERIC MAP (N) PORT MAP(a0,a1,a2,a3,a4,a5,a6,a7,aux_sete);
	
	aux_um1 <= std_logic_vector((Signed(aux_um(N+7 downto 5)))/2);
	aux_dois1 <= std_logic_vector((Signed(aux_dois(N+7 downto 5)))/2);
	aux_tres1 <= std_logic_vector((Signed(aux_tres(N+7 downto 5)))/2);
	aux_quatro1 <= std_logic_vector((Signed(aux_quatro(N+7 downto 5)))/2);
	aux_cinco1 <= std_logic_vector((Signed(aux_cinco(N+7 downto 5)))/2);
	aux_seis1 <= std_logic_vector((Signed(aux_seis(N+7 downto 5)))/2);
	aux_sete1 <= std_logic_vector((Signed(aux_sete(N+7 downto 5)))/2);
	
	um <= aux_um1(N+2 downto 1);
	dois <= aux_dois1(N+2 downto 1);
	tres <= aux_tres1(N+2 downto 1);
	quatro <= aux_quatro1(N+2 downto 1);
	cinco <= aux_cinco1(N+2 downto 1);
	seis <= aux_seis1(N+2 downto 1);
	sete <= aux_sete1(N+2 downto 1);

end architecture circuits;  -- of F_sete
