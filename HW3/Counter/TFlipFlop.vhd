library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TFlipFlop is
	Port (
		CLK: in STD_LOGIC;
		T: in STD_LOGIC;
		R: in STD_LOGIC;
		Q: out STD_LOGIC
	);
end TFlipFlop;

architecture Behavioral of TFlipFlop is
	
begin

	process(CLK) 
		variable state: STD_LOGIC := '0';
	begin
		if CLK = '1' and rising_edge(CLK) then
			if R = '1' then
				state := '0';
			elsif T = '1' then
				state := not state;
			end if;
		end if;
		
		Q <= state;
	end process;


end Behavioral;

