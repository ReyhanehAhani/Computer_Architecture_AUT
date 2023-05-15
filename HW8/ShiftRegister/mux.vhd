library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
	port (
		a : in std_logic;
		b : in std_logic;
		s : in std_logic;
		o : out std_logic
	);
end mux;

architecture Behavioral of mux is

begin

	o <= a when s = '1' else b;


end Behavioral;

