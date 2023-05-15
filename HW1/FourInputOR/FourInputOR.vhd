library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourInputOR is
	Port (
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		C: in STD_LOGIC;
		D: in STD_LOGIC;
		R: out STD_LOGIC
	);
end FourInputOR;

architecture Behavioral of FourInputOR is

signal W1: STD_LOGIC;
signal W2: STD_LOGIC;

begin

	W1 <= A or B;
	W2 <= C or D;
	R <= W1 or W2;

end Behavioral;

