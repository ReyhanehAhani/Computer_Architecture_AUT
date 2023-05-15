library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_XOR is
	Port (
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end NAND_XOR;

architecture Behavioral of NAND_XOR is
	signal sig1, sig2, sig3: STD_LOGIC;
	
begin
	
	sig1 <= A nand B;
	sig2 <= sig1 nand A;
	sig3 <= sig1 nand B;
	Q <= sig2 nand sig3;


end Behavioral;

