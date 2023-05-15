library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlop is
	Port ( 
		D, CLK, R: in STD_LOGIC;
		Q, Qb: out STD_LOGIC
	);
end DFlipFlop;

architecture Behavioral of DFlipFlop is

begin

	process(CLK, R)
	begin
		if R = '1' then
			Q <= '0';
			Qb <= '1';
		elsif CLK = '1' and rising_edge(CLK) then
			Q <= D;
			Qb <= not D;
		end if;
	end process;


end Behavioral;

