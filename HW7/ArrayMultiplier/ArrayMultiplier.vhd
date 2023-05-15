library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArrayMultiplier is
	Port (
		A : in STD_LOGIC_VECTOR(3 downto 0);
		B : in STD_LOGIC_VECTOR(4 downto 0);
		P : out STD_LOGIC_VECTOR(8 downto 0)
	);	
end ArrayMultiplier;

architecture Behavioral of ArrayMultiplier is
	component RippleAdder is
		port (
			A : in STD_LOGIC_VECTOR(3 downto 0);
			B : in STD_LOGIC_VECTOR(3 downto 0);
			Cin : in STD_LOGIC;
			S : out STD_LOGIC_VECTOR(3 downto 0);
			Cout : out STD_LOGIC
		);
	end component;
	
	signal R0, R1, R2, R3 : STD_LOGIC_VECTOR(3 downto 0);
	signal Inputs : STD_LOGIC_VECTOR(19 downto 0);
	signal Carries : STD_LOGIC_VECTOR(3 downto 0);
begin
	
	Inputs(0) <= B(0) and A(0);
	Inputs(1) <= B(0) and A(1);
	Inputs(2) <= B(0) and A(2);
	Inputs(3) <= B(0) and A(3);
	
	Inputs(4) <= B(1) and A(0);
	Inputs(5) <= B(1) and A(1);
	Inputs(6) <= B(1) and A(2);
	Inputs(7) <= B(1) and A(3);
	
	Inputs(8) <= B(2) and A(0);
	Inputs(9) <= B(2) and A(1);
	Inputs(10) <= B(2) and A(2);
	Inputs(11) <= B(2) and A(3);
	
	Inputs(12) <= B(3) and A(0);
	Inputs(13) <= B(3) and A(1);
	Inputs(14) <= B(3) and A(2);
	Inputs(15) <= B(3) and A(3);
	
	Inputs(16) <= B(4) and A(0);
	Inputs(17) <= B(4) and A(1);
	Inputs(18) <= B(4) and A(2);
	Inputs(19) <= B(4) and A(3);
	
	
	
	P(0) <= Inputs(0);
	P(1) <= R0(0);
	P(2) <= R1(0);
	P(3) <= R2(0);
	P(4) <= R3(0);
	P(5) <= R3(1);
	P(6) <= R3(2);
	P(7) <= R3(3);
	
	RA0 : RippleAdder port map(A(2 downto 0) => Inputs(3 downto 1), A(3) => '0', B => Inputs(7 downto 4), Cin => '0', Cout => Carries(0), S => R0);
	RA1 : RippleAdder port map(A(2 downto 0) => R0(3 downto 1), A(3) => Carries(0), B => Inputs(11 downto 8), Cin => '0', Cout => Carries(1), S => R1);
	RA2 : RippleAdder port map(A(2 downto 0) => R1(3 downto 1), A(3) => Carries(1), B => Inputs(15 downto 12), Cin => '0', Cout => Carries(2), S => R2);
	RA3 : RippleAdder port map(A(2 downto 0) => R2(3 downto 1), A(3) => Carries(2), B => Inputs(19 downto 16), Cin => '0', Cout => P(8), S => R3);
	

end Behavioral;

