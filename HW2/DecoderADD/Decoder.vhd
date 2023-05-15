library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
	Port (
		Input: in STD_LOGIC_VECTOR(2 downto 0);
		Output: out STD_LOGIC_VECTOR(7 downto 0)		
	);
end Decoder;

architecture Behavioral of Decoder is

begin

	Output(0) <= '0' when Input="000" else '1';
	Output(1) <= '0' when Input="001" else '1';
	Output(2) <= '0' when Input="010" else '1';
	Output(3) <= '0' when Input="011" else '1';
	Output(4) <= '0' when Input="100" else '1';
	Output(5) <= '0' when Input="101" else '1';
	Output(6) <= '0' when Input="110" else '1';
	Output(7) <= '0' when Input="111" else '1';
	
end Behavioral;

