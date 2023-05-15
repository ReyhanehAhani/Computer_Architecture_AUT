library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JKFlipFlop is
	Port (
		J, K, CLK, R: in STD_LOGIC;
		Q, Qb: out STD_LOGIC
	);
end JKFlipFlop;

architecture Behavioral of JKFlipFlop is

begin
	process(CLK, R)
		variable Qn: STD_LOGIC := '0';
	begin
		if R='1' then
			Qn := '0';
		elsif CLK = '1' and rising_edge(CLK) then
			if J = '0' and K = '0' then
				Qn := Qn;
			elsif J='1' and K='0' then
				Qn := '1';
			elsif J='0' and K='1' then
				Qn := '0';
			elsif J='1' and K='1' then
				Qn := not Qn;
			end if;
		end if;
		Q <= Qn;
		Qb <= not Qn;
	end process;


end Behavioral;

