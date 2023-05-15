library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder is
	Port (
		In1: in STD_LOGIC;
		In2: in STD_LOGIC;
		Out1: out STD_LOGIC;
		Out2: out STD_LOGIC
	);
end HalfAdder;

architecture Behavioral of HalfAdder is

begin

	Out1 <= In1 xor In2;
	Out2 <= In1 and In2;

end Behavioral;

