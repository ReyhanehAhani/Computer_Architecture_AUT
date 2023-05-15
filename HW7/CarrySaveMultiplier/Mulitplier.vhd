library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mulitplier is
	Port (
		A: in STD_LOGIC_VECTOR(4 downto 0);
		B: in STD_LOGIC_VECTOR(3 downto 0);
		P: out STD_LOGIC_VECTOR(8 downto 0)
	);
end Mulitplier;

architecture Behavioral of Mulitplier is
	component FullAdder is 
		port (
				 A: in STD_LOGIC;
				 B: in STD_LOGIC;
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC; 
				 Cout: out STD_LOGIC); 
	end component;
	
	component RippleAdder is
		port (
			A : in STD_LOGIC_VECTOR(8 downto 0);
			B : in STD_LOGIC_VECTOR(8 downto 0);
			Cin : in STD_LOGIC;
			S : out STD_LOGIC_VECTOR(8 downto 0);
			Cout : out STD_LOGIC
		);
	end component;
	
	signal AB_AND : STD_LOGIC_VECTOR(19 downto 0);
	
	signal Carries1, Sums1 : STD_LOGIC_VECTOR(7 downto 0);
	signal Carries2, Sums2 : STD_LOGIC_VECTOR(7 downto 0);
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
	
	
	
	-- Stage 1
	FA10: FullAdder port map(A => AB_AND(0), B => '0',       Cin => '0',        S => Sums1(0), Cout => Carries1(0));
	FA11: FullAdder port map(A => AB_AND(1), B => AB_AND(5), Cin => '0',        S => Sums1(1), Cout => Carries1(1));
	FA12: FullAdder port map(A => AB_AND(2), B => AB_AND(6), Cin => AB_AND(10), S => Sums1(2), Cout => Carries1(2));
	FA13: FullAdder port map(A => AB_AND(3), B => AB_AND(7), Cin => AB_AND(11), S => Sums1(3), Cout => Carries1(3));
	FA14: FullAdder port map(A => AB_AND(4), B => AB_AND(8), Cin => AB_AND(12), S => Sums1(4), Cout => Carries1(4));
	FA15: FullAdder port map(A => '0',       B => AB_AND(9), Cin => AB_AND(13), S => Sums1(5), Cout => Carries1(5));
	FA16: FullAdder port map(A => '0',       B => '0',       Cin => AB_AND(14), S => Sums1(6), Cout => Carries1(6));
	FA17: FullAdder port map(A => '0',       B => '0',       Cin => '0',        S => Sums1(7), Cout => Carries1(7));
	
	
	-- Stage 2
	FA20: FullAdder port map(A => Sums1(0), B => Carries1(0), Cin => '0',        S => Sums2(0), Cout => Carries2(0));
	FA21: FullAdder port map(A => Sums1(1), B => Carries1(1), Cin => '0',        S => Sums2(1), Cout => Carries2(1));
	FA22: FullAdder port map(A => Sums1(2), B => Carries1(2), Cin => '0',        S => Sums2(2), Cout => Carries2(2));
	FA23: FullAdder port map(A => Sums1(3), B => Carries1(3), Cin => AB_AND(15), S => Sums2(3), Cout => Carries2(3));
	FA24: FullAdder port map(A => Sums1(4), B => Carries1(4), Cin => AB_AND(16), S => Sums2(4), Cout => Carries2(4));
	FA25: FullAdder port map(A => Sums1(5), B => Carries1(5), Cin => AB_AND(17), S => Sums2(5), Cout => Carries2(5));
	FA26: FullAdder port map(A => Sums1(6), B => Carries1(6), Cin => AB_AND(18), S => Sums2(6), Cout => Carries2(6));
	FA27: FullAdder port map(A => Sums1(7), B => Carries1(7), Cin => AB_AND(19), S => Sums2(7), Cout => Carries2(7));
	
	-- Stage 3
	RA0: RippleAdder port map(A(7 downto 0) => Sums2, A(8) => '0', B(8 downto 1) => Carries2, B(0) => '0', S => P, Cin => '0');
	
	

end Behavioral;

