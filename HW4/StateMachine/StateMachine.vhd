library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity StateMachine is
	Port (
		input: in STD_LOGIC;
		output: out STD_LOGIC;
		clk: in STD_LOGIC
	);
end StateMachine;

architecture Behavioral of StateMachine is
	type state_t is (S0, S1, S2);
	signal state: state_t := S0;
	signal next_state: state_t := S0;
	signal next_output: STD_LOGIC := '0';
begin

	process(input, CLK)
	begin
		if clk='1' and rising_edge(clk) then
			state <= next_state;
			output <= next_output;
		end if;
	end process;
	
	process(input)
	begin
		case next_state is
			when S0 =>
				if input = '1' then
					next_state <= S2;
					next_output <= '1';
				else
					next_state <= S1;
					next_output <= '0';
				end if;
			when S1 =>
				if input = '1' then
					next_state <= S2;
					next_output <= '1';
				else
					next_state <= S1;
					next_output <= '1';
				end if;
			when S2 =>
				if input = '1' then
					next_state <= S2;
					next_output <= '0';
				else
					next_state <= S1;
					next_output <= '0';
				end if;
			when others => 
				next_state <= S0;
				next_output <= '0';
		end case;
	end process;
	

end Behavioral;

