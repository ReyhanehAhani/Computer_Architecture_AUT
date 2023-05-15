library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UpDownCounter is
	Port (
		CLK: in STD_LOGIC;
		S: in STD_LOGIC; -- S=0 => Down, S=1 => Up
		R: in STD_LOGIC;
		E: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(3 downto 0)
	);
end UpDownCounter;

architecture Behavioral of UpDownCounter is
	
	component TFlipFlop is
		Port (
			CLK: in STD_LOGIC;
			T: in STD_LOGIC;
			R: in STD_LOGIC;
			Q: out STD_LOGIC
		);
	end component;
	
	signal FlipFlopIn: STD_LOGIC_VECTOR(3 downto 0);
	signal FlipFlopOut: STD_LOGIC_VECTOR(3 downto 0);
	signal EnabledCLK: STD_LOGIC;
begin
	EnabledCLK <= CLK and E;
	
	T0: TFlipFlop port map(CLK => FlipFlopIn(0), T => '1', R => R, Q => FlipFlopOut(0));
	T1: TFlipFlop port map(CLK => FlipFlopIn(1), T => '1', R => R, Q => FlipFlopOut(1));
	T2: TFlipFlop port map(CLK => FlipFlopIn(2), T => '1', R => R, Q => FlipFlopOut(2));
	T3: TFlipFlop port map(CLK => FlipFlopIn(3), T => '1', R => R, Q => FlipFlopOut(3));
	
	FlipFlopIn(0) <= EnabledCLK;
	FlipFlopIn(1) <= FlipFlopOut(0) xor S;
	FlipFlopIn(2) <= FlipFlopOut(1) xor S;
	FlipFlopIn(3) <= FlipFlopOut(2) xor S;
	
	Q <= FlipFlopOut;
end Behavioral; 