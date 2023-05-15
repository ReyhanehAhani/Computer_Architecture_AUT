library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourOR is
	Port (
			I: in STD_LOGIC_VECTOR(3 downto 0);
			R: out STD_LOGIC
		);
end FourOR;

architecture Behavioral of FourOR is

begin

	R <= I(0) or I(1) or I(2) or I(3); 

end Behavioral;

