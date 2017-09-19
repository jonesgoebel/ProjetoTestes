library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;

entity filtro_H is   -- filtro triplo (up,middle,down)
	GENERIC (N : INTEGER := 8); --numeros de bits
	port (
		A0,A1,A2,A3,A4,A5,A6,A7 : in  std_logic_vector(N-1 downto 0);   -- entradas (pixels)
		s0,s1,s2,s3,s4,s5,s6 : out std_logic_vector(N+1 downto 0));  -- products
end entity filtro_H;

architecture circuits of filtro_H is 

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
	signal aux0,aux1,aux2,aux3,aux4,aux5,aux6:  std_logic_vector(N+9 downto 0);
	signal Ax0,Ax1,Ax2,Ax3,Ax4,Ax5,Ax6,Ax7:  std_logic_vector(N downto 0);
	
BEGIN  
	Ax0<='0'&A0;
	Ax1<='0'&A1;
	Ax2<='0'&A2;
	Ax3<='0'&A3;
	Ax4<='0'&A4;
	Ax5<='0'&A5;
	Ax6<='0'&A6;
	Ax7<='0'&A7;

	F: F_sete GENERIC MAP (N+1) port map(Ax0,Ax1,Ax2,Ax3,Ax4,Ax5,Ax6,Ax7,aux0,aux1,aux2,aux3,aux4,aux5,aux6);
	
	S: shift GENERIC MAP (N) port map(aux0(N+8 downto 0),aux1(N+8 downto 0),aux2(N+8 downto 0),aux3(N+8 downto 0),aux4(N+8 downto 0),aux5(N+8 downto 0),aux6(N+8 downto 0),s0,s1,s2,s3,s4,s5,s6);

	

end architecture circuits; 
