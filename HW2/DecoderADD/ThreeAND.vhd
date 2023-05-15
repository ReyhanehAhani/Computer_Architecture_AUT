library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourAND is
	Port (
			I: in STD_LOGIC_VECTOR(3 downto 0);
			R: out STD_LOGIC
		);
end FourAND;

architecture Behavioral of FourAND is

begin

	R <= I(0) and I(1) and I(2) and I(3); 

end Behavioral;

