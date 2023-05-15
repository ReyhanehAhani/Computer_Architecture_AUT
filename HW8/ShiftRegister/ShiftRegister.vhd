
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister is
	port(
		  sel : in std_logic; -- SEL = '0' => Pal, SEL = '1' => Ser
		  p : in std_logic_vector (3 downto 0);
		  q : out std_logic;
		  data : in std_logic;
		  clk : in std_logic
	);
end ShiftRegister;

architecture Behavioral of ShiftRegister is
	component mux is
		port (
			a : in std_logic;
			b : in std_logic;
			s : in std_logic;
			o : out std_logic
		);
	end component;
	component DFF is
		port ( d : in std_logic;
				 q : out std_logic;
				 clk : in std_logic
				 );		 	
	end component;
	
	signal dff_in : std_logic_vector(3 downto 0);
	signal dff_out : std_logic_vector(4 downto 0);
	
begin

	dff_out(0) <= data;

	mux0 : mux port map(
		a => dff_out(0),
		b => P(3),
		s => sel,
		o => dff_in(0)
	);
	
	mux1 : mux port map(
		a => dff_out(1),
		b => P(2),
		s => sel,
		o => dff_in(1)
	);
	
	mux2 : mux port map(
		a => dff_out(2),
		b => P(1),
		s => sel,
		o => dff_in(2)
	);
	
	mux3 : mux port map(
		a => dff_out(3),
		b => P(0),
		s => sel,
		o => dff_in(3)
	);
	
	
	
	
	dff0 : dff port map(
		d => dff_in(0),
		q => dff_out(1),
		clk => clk
	);
	dff1 : dff port map(
		d => dff_in(1),
		q => dff_out(2),
		clk => clk
	);
	dff2 : dff port map(
		d => dff_in(2),
		q => dff_out(3),
		clk => clk
	);
	dff3 : dff port map(
		d => dff_in(3),
		q => dff_out(4),
		clk => clk
	);
	
	q <= dff_out(4);
	
	
	
	

	


end Behavioral;

