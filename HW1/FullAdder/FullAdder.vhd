library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
	Port (
		I0: in STD_LOGIC;
		I1: in STD_LOGIC;
		Cin: in STD_LOGIC;
		S: out STD_LOGIC;
		Cout: out STD_LOGIC
	);
	
end FullAdder;

architecture Behavioral of FullAdder is

	signal Internal_signal0: STD_LOGIC;
	signal Internal_signal1: STD_LOGIC;
	signal Internal_signal2: STD_LOGIC;
	
	component HalfAdder is
		Port (
			In1: in STD_LOGIC;
			In2: in STD_LOGIC;
			Out1: out STD_LOGIC;
			Out2: out STD_LOGIC
		);
	end component;
	
begin
	HalfAdder1: HalfAdder port map(In1 => I1, In2 => I0, Out1 => Internal_signal0, Out2 => Internal_signal1);
	HalfAdder2: HalfAdder port map(In1 => Internal_signal0, In2 => Cin, Out1 => S, Out2 => Internal_Signal2);
	Cout <= Internal_signal2 or Internal_signal1;
end Behavioral;

