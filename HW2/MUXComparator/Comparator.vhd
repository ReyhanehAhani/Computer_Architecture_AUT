library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator is
	Port (
		A: in STD_LOGIC_VECTOR(1 downto 0);
		B: in STD_LOGIC_VECTOR(1 downto 0);
		GT: out STD_LOGIC
	);	
end Comparator;

architecture Behavioral of Comparator is
	component FourToOneMUX is
		Port (
			I: in STD_LOGIC_VECTOR(3 downto 0);
			O: out STD_LOGIC;
			S: in STD_LOGIC_VECTOR(1 downto 0)
		);
	end component;
	
	signal NOR_B, NOT_B0, NAND_B : STD_LOGIC;
begin
	NOR_B <= B(0) nor B(1);
	NOT_B0 <= not B(0);
	NAND_B <= B(0) nand B(1);
	
	MUX1: FourToOneMUX port map(I(0) => '0', I(1) => NOR_B, I(2) => NOT_B0, I(3) => NAND_B, S(0) => A(0), S(1) => A(1), O => GT);


end Behavioral;

