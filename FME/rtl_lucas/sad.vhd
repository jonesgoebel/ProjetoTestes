library IEEE;
use IEEE.std_logic_1164.all;

entity sad is   -- filtro triplo (up,middle,down)
  port (	a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31 : in  std_logic_vector(7 downto 0);
  			b0,b1,b2,b3,b4,b5,b6,b7 : in  std_logic_vector(7 downto 0);
        	r0,r1,r2,r3 : out std_logic_vector(7 downto 0));  -- products
end entity sad;

architecture circuits of sad is
variable c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31 : std_logic_vector(7 downto 0);
	ENTITY triste IS
		PORT(	a0,a1,a2,a3 : in  std_logic_vector(7 downto 0);   -- entradas (pixels)
  		b : in  std_logic_vector(7 downto 0);
        r0,r1,r2,r3 : out std_logic_vector(7 downto 0));
	END triste;
	
begin  -- circuits of sad

f1: triste
	PORT MAP(a0,a1,a2,a3,b0,c0,c1,c2,c3);
f2: triste
	PORT MAP(a4,a5,a6,a7,b1,c4,c5,c6,c7);
f3: triste
	PORT MAP(a8,a9,a10,a11,b2,c8,c9,c10,c11);
f4: triste
	PORT MAP(a12,a13,a14,a15,b3,c12,c13,c14,c15);
f5: triste
	PORT MAP(a16,a17,a18,a19,b4,c16,c17,c18,c19);
f6: triste
	PORT MAP(a20,a21,a22,a23,b5,c20,c21,c22,c23);
f7: triste
	PORT MAP(a24,a25,a26,a27,b6,c24,c25,c26,c27);
f8: triste
	PORT MAP(a28,a29,a30,a31,b7,c28,c29,c30,c31);

r0<=c0+c4+c8+c12+c16+c20+c24+c28;
r1<=c1+c5+c9+c13+c17+c21+c25+c29;
r2<=c2+c6+c10+c14+c18+c22+c26+c30;
r3<=c3+c7+c11+c15+c19+c23+c27+c31;

end architecture circuits;  -- of sad