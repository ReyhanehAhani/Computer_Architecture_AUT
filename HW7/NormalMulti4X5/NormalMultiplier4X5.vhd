library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NormalMultiplier4X5 is
	Port (
		A: in STD_LOGIC_VECTOR(4 downto 0);
		B: in STD_LOGIC_VECTOR(3 downto 0);
		P: out STD_LOGIC_VECTOR(8 downto 0)
	);
end NormalMultiplier4X5;

architecture Behavioral of NormalMultiplier4X5 is
	
	component FullAdder is
		port (
				 A: in STD_LOGIC;
				 B: in STD_LOGIC;
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC; 
				 Cout: out STD_LOGIC
		);
	end component;
	
	signal Carries : STD_LOGIC_VECTOR(12 downto 0);
	signal TempResult : STD_LOGIC_VECTOR(12 downto 0);
	signal AB_AND : STD_LOGIC_VECTOR(19 downto 0);
	
begin
	di: for i in 3 downto 0 generate
		dj: for j in 4 downto 0 generate
			AB_AND(i*5+j) <= A(j) and B(i);
		end generate dj;
	end generate di;
	
-- The code above produces the same output as below
--	AB_AND(0) <= A(0) and B(0);
--	AB_AND(1) <= A(1) and B(0);
--	AB_AND(2) <= A(2) and B(0);
--	AB_AND(3) <= A(3) and B(0);
--	AB_AND(4) <= A(4) and B(0);
--	
--	AB_AND(5) <= A(0) and B(1);
--	AB_AND(6) <= A(1) and B(1);
--	AB_AND(7) <= A(2) and B(1);
--	AB_AND(8) <= A(3) and B(1);
--	AB_AND(9) <= A(4) and B(1);
--	
--	AB_AND(10) <= A(0) and B(2);
--	AB_AND(11) <= A(1) and B(2);
--	AB_AND(12) <= A(2) and B(2);
--	AB_AND(13) <= A(3) and B(2);
--	AB_AND(14) <= A(4) and B(2);
--	
--	AB_AND(15) <= A(0) and B(3);
--	AB_AND(16) <= A(1) and B(3);
--	AB_AND(17) <= A(2) and B(3);
--	AB_AND(18) <= A(3) and B(3);
--	AB_AND(19) <= A(4) and B(3);
	
	
	-- P0
	P(0) <= AB_AND(0);
	
	-- P1
	FA10 : FullAdder port map(A => AB_AND(1), B => AB_AND(5), S => P(1), Cin => '0', Cout => Carries(0));
	
	-- P2
	FA20 : FullAdder port map(A => AB_AND(1), B => AB_AND(6), S => TempResult(0), Cin => Carries(0), Cout => Carries(1));
	FA21 : FullAdder port map(A => TempResult(0), B => AB_AND(10), S => P(2), Cin => Carries(1), Cout => Carries(2));
	
	-- P3
	FA30 : FullAdder port map(A => AB_AND(3), B => AB_AND(7), S => TempResult(1), Cin => Carries(2), Cout => Carries(3));
	FA31 : FullAdder port map(A => TempResult(1), B => AB_AND(11), S => TempResult(2), Cin => Carries(3), Cout => Carries(4));
	FA32 : FullAdder port map(A => TempResult(2), B => AB_AND(15), S => P(3), Cin => Carries(4), Cout => Carries(5));
	
	-- P4
	FA40 : FullAdder port map(A => AB_AND(4), B => AB_AND(8), S => TempResult(3), Cin => Carries(5), Cout => Carries(6));
	FA41 : FullAdder port map(A => TempResult(3), B => AB_AND(12), S => TempResult(4), Cin => Carries(6), Cout => Carries(7));
	FA42 : FullAdder port map(A => TempResult(4), B => AB_AND(16), S => P(4), Cin => Carries(7), Cout => Carries(8));
	
	-- P5
	FA50 : FullAdder port map(A => AB_AND(9), B => AB_AND(13), S => TempResult(5), Cin => Carries(8), Cout => Carries(9));
	FA51 : FullAdder port map(A => TempResult(5), B => AB_AND(17), S => P(5), Cin => Carries(9), Cout => Carries(10));
	
	-- P6
	FA60 : FullAdder port map(A => AB_AND(14), B => AB_AND(18), S => P(6), Cin => Carries(10), Cout => Carries(11));
	
	-- P71
	FA70 : FullAdder port map(A => AB_AND(19), B => '0', S => P(7), Cin => Carries(11), Cout => P(8));
	
	
	
end Behavioral;

