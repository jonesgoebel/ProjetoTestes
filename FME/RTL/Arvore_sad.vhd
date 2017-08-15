library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity Arvore_sad is   -- filtro triplo (up,middle,down)
  port (	
			S0,S1,S2,S3,S4,S5,S6,S7: IN std_logic_vector(11 downto 0);
			S8,S9,S10,S11,S12,S13,S14,S15: IN std_logic_vector(11 downto 0);
			S16,S17,S18,S19,S20,S21,S22,S23: IN std_logic_vector(11 downto 0);
			S24,S25,S26,S27,S28,S29,S30,S31: IN std_logic_vector(11 downto 0);
			S32,S33,S34,S35,S36,S37,S38,S39: IN std_logic_vector(11 downto 0);
			S40,S41,S42,S43,S44,S45,S46,S47: IN std_logic_vector(11 downto 0);
			S48,S49,S50,S51,S52,S53,S54,S55: IN std_logic_vector(11 downto 0);
			S56,S57,S58,S59,S60,S61,S62,S63: IN std_logic_vector(11 downto 0);
			b0,b1,b2,b3,b4,b5,b6,b7 : in  std_logic_vector(7 downto 0);
			r0,r1,r2,r3,r4,r5,r6,r7 : out std_logic_vector(11 downto 0)
			);  -- products
end entity Arvore_sad;

architecture circuits of Arvore_sad is
signal	C0,C1,C2,C3,C4,C5,C6,C7: std_logic_vector(11 downto 0);
signal	C8,C9,C10,C11,C12,C13,C14,C15: std_logic_vector(11 downto 0);
signal	C16,C17,C18,C19,C20,C21,C22,C23: std_logic_vector(11 downto 0);
signal	C24,C25,C26,C27,C28,C29,C30,C31: std_logic_vector(11 downto 0);
signal	C32,C33,C34,C35,C36,C37,C38,C39: std_logic_vector(11 downto 0);
signal	C40,C41,C42,C43,C44,C45,C46,C47: std_logic_vector(11 downto 0);
signal	C48,C49,C50,C51,C52,C53,C54,C55: std_logic_vector(11 downto 0);
signal	C56,C57,C58,C59,C60,C61,C62,C63: std_logic_vector(11 downto 0);

	COMPONENT triste IS
		PORT(	a0,a1,a2,a3,a4,a5,a6,a7 : in  std_logic_vector(11 downto 0);   -- entradas (pixels)
  		b : in  std_logic_vector(7 downto 0);
        r0,r1,r2,r3,r4,r5,r6,r7 : out std_logic_vector(11 downto 0));
	END COMPONENT;
	
begin  -- circuits of sad

f1: triste	
	PORT MAP(S0,S1,S2,S3,S4,S5,S6,S7,b0,C0,C1,C2,C3,C4,C5,C6,C7);
f2: triste	
	PORT MAP(S8,S9,S10,S11,S12,S13,S14,S15,b1,C8,C9,C10,C11,C12,C13,C14,C15);
f3: triste	
	PORT MAP(S16,S17,S18,S19,S20,S21,S22,S23,b2,C16,C17,C18,C19,C20,C21,C22,C23);
f4: triste
	PORT MAP(S24,S25,S26,S27,S28,S29,S30,S31,b3,C24,C25,C26,C27,C28,C29,C30,C31);
f5: triste
	PORT MAP(S32,S33,S34,S35,S36,S37,S38,S39,b4,C32,C33,C34,C35,C36,C37,C38,C39);
f6: triste
	PORT MAP(S40,S41,S42,S43,S44,S45,S46,S47,b5,C40,C41,C42,C43,C44,C45,C46,C47);
f7: triste
	PORT MAP(S48,S49,S50,S51,S52,S53,S54,S55,b6,C48,C49,C50,C51,C52,C53,C54,C55);
f8: triste
	PORT MAP(S56,S57,S58,S59,S60,S61,S62,S63,b7,C56,C57,C58,C59,C60,C61,C62,C63);

r0<=std_logic_vector(signed(c0)+signed(c8) +signed(c16)+signed(c24)+signed(c32)+signed(c40)+signed(c48)+signed(c56));
r1<=std_logic_vector(signed(c1)+signed(c9) +signed(c17)+signed(c25)+signed(c33)+signed(c41)+signed(c49)+signed(c57));
r2<=std_logic_vector(signed(c2)+signed(c10)+signed(c18)+signed(c26)+signed(c34)+signed(c42)+signed(c50)+signed(c58));
r3<=std_logic_vector(signed(c3)+signed(c11)+signed(c19)+signed(c27)+signed(c35)+signed(c43)+signed(c51)+signed(c59));
r4<=std_logic_vector(signed(c4)+signed(c12)+signed(c20)+signed(c28)+signed(c36)+signed(c44)+signed(c52)+signed(c60));
r5<=std_logic_vector(signed(c5)+signed(c13)+signed(c21)+signed(c29)+signed(c37)+signed(c45)+signed(c53)+signed(c61));
r6<=std_logic_vector(signed(c6)+signed(c14)+signed(c22)+signed(c30)+signed(c38)+signed(c46)+signed(c54)+signed(c62));
r7<=std_logic_vector(signed(c7)+signed(c15)+signed(c23)+signed(c31)+signed(c39)+signed(c47)+signed(c55)+signed(c63));

end architecture circuits;  -- of sad
