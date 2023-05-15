library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD is
	Port (
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		Cin: in STD_LOGIC;
		
		Q: out STD_LOGIC;
		Cout: out STD_LOGIC
	);
end ADD;

architecture Behavioral of ADD is
	
	component Decoder is
		Port (
			Input: in STD_LOGIC_VECTOR(2 downto 0);
			Output: out STD_LOGIC_VECTOR(7 downto 0)		
		);
	end component;
	component FourAND is
		Port (
				I: in STD_LOGIC_VECTOR(3 downto 0);
				R: out STD_LOGIC
			);
	end component;
	
	signal Decoder_out: STD_LOGIC_VECTOR(7 downto 0);
	signal SumANDOut, SumCINOut: STD_LOGIC;
begin

	Decoder1: Decoder port map(Input(0) => A, Input(1) => B, Input(2) => Cin, Output => Decoder_out);
	SumAND: FourAND port map(I(0) => Decoder_out(1), I(1) => Decoder_out(2), I(2) => Decoder_out(4), I(3) => Decoder_out(7), R => SumANDOut);
	SumCIN: FourAND port map(I(0) => Decoder_out(3), I(1) => Decoder_out(5), I(2) => Decoder_out(6), I(3) => Decoder_out(7), R => SumCINOut);
	
	Q <= not SumANDOut;
	Cout <= not SumCINOut;

end Behavioral;

