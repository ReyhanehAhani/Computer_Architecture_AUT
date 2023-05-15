library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourToOneMUX is
	Port (
		I: in STD_LOGIC_VECTOR(3 downto 0);
		O: out STD_LOGIC;
		S: in STD_LOGIC_VECTOR(1 downto 0)
	);
end FourToOneMUX;

architecture Behavioral of FourToOneMUX is

begin


	O <= I(0) when s = "00" else 
	 I(1) when s = "01" else 
	 I(2) when s = "10" else 
	 I(3) when s = "11";


end Behavioral;

