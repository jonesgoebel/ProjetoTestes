library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity BIST is   -- filtro triangulo up
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		READY: IN  std_logic;	
		A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14: OUT std_logic_vector(7 downto 0);--AMOSTRAS PARA SEREM INTERPOLADAS
		B0, B1, B2, B3, B4, B5, B6, B7: OUT std_logic_vector(7 downto 0);--AMOSTRAS ORIGINAIS PARA COMPARAÇÃO
		Resultado: out std_logic;
		SAD: OUT std_logic_vector(16 downto 0));
end entity BIST;

architecture circuits of BIST is
signal RESP: std_logic_vector(16 downto 0);
begin  -- circuits of BIST
A0<=" 00000000" ; --adicionar os valores reais que vamos usar no teste
A1<=" 00000000" ;
A2<=" 00000000" ;
A3<=" 00000000" ;
A4<=" 00000000" ;
A5<=" 00000000" ;
A6<=" 00000000" ;
A7<=" 00000000" ;
A8<=" 00000000" ;
A9<=" 00000000" ;
A10<=" 00000000" ;
A11<=" 00000000" ;
A12<=" 00000000" ;
A13<=" 00000000" ;
A14<=" 00000000" ;
B0<=" 00000000" ;
B1<=" 00000000" ;
B2<=" 00000000" ;
B3<=" 00000000" ;
B4<=" 00000000" ;
B5<=" 00000000" ;
B6<=" 00000000" ;
B7<=" 00000000" ;
RESP<=" 0000000000000000" ;
process (READY)
begin
	wait until READY'event and READY='1';
   if (RESP = SAD) then
		Resultado<='1'; -- colocar o valor que deve ser a saída;
	else
		Resultado<='0';
	end if;
end process;
 
end architecture circuits;  -- of BIST
