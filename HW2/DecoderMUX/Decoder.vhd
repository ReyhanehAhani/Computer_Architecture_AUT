library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
	Port (
		Input: in STD_LOGIC_VECTOR(1 downto 0);
		Output: out STD_LOGIC_VECTOR(3 downto 0)		
	);
end Decoder;

architecture Behavioral of Decoder is

begin

	Output(0) <= '1' when Input="00" else '0';
	Output(1) <= '1' when Input="01" else '0';
	Output(2) <= '1' when Input="10" else '0';
	Output(3) <= '1' when Input="11" else '0';
	
end Behavioral;

