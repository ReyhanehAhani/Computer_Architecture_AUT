library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
	Port (
		S: in STD_LOGIC_VECTOR(1 downto 0);
		I: in STD_LOGIC_VECTOR(3 downto 0);
		Q: out STD_LOGIC
	);
end MUX;

architecture Behavioral of MUX is
	component Decoder is
		Port (
			Input: in STD_LOGIC_VECTOR(1 downto 0);
			Output: out STD_LOGIC_VECTOR(3 downto 0)		
		);
	end component;
	component FourOR is
		Port (
			I: in STD_LOGIC_VECTOR(3 downto 0);
			R: out STD_LOGIC
		);
	end component;

	
	signal decoder_out, and_out: STD_LOGIC_VECTOR(3 downto 0);
	
begin

	Decoder1: Decoder port map(Input => S, Output => decoder_out);
	and_out(0) <= I(0) and decoder_out(0);
	and_out(1) <= I(1) and decoder_out(1);
	and_out(2) <= I(2) and decoder_out(2);
	and_out(3) <= I(3) and decoder_out(3);
	FourOR1: FourOR port map(I => and_out, R => Q);

end Behavioral;

