library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
	Port (
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		EQ: out STD_LOGIC;
		GT: out STD_LOGIC;
		LT: out STD_LOGIC
	);

end comparator;

architecture Behavioral of comparator is

	component NAND_XOR is
		Port (
			A: in STD_LOGIC;
			B: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;
	
	signal Ap, Bp, EQp: STD_LOGIC;

begin

	Ap <= not A;
	Bp <= not B;
	
	XOR1: NAND_XOR port map(A => A, B => B, Q => EQp);
	GT <= Bp and A;
	LT <= B and Ap;
	EQ <= not EQp;


end Behavioral;

