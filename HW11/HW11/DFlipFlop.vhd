library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlop is
	port (
		Q : out std_logic;    
      CLK : in std_logic;   
      D : in std_logic;
		RES : in std_logic
	);
end DFlipFlop;

architecture Behavioral of DFlipFlop is

begin

	process(CLK, RES)
		begin 
			if RES = '1' then 
				Q <= '0';
			elsif rising_edge(CLK) and CLK = '1' then
				if D = '1' then -- Pervent undefined
					Q <= '1';
				else
					Q <= '0';
				end if;
			end if;      
	end process;


end Behavioral;

