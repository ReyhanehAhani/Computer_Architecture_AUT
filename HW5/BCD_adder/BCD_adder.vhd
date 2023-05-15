
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity BCD_adder is
	port (
			A : in std_logic_vector(3 downto 0);
			B : in std_logic_vector(3 downto 0);
			Cout : out std_logic;
			S : out std_logic_vector(3 downto 0)
			);
	
end BCD_adder;

architecture Behavioral of BCD_adder is
	
	component RippleAdder is 
		port (
				A : in STD_LOGIC_VECTOR(3 downto 0);
				B : in STD_LOGIC_VECTOR(3 downto 0);
				Cin : in STD_LOGIC;
				S : out STD_LOGIC_VECTOR(3 downto 0);
				Cout : out STD_LOGIC
		);
	end component;

	signal binary_adder_out: STD_LOGIC_VECTOR(3 downto 0);
	signal binary_adder_carry: STD_LOGIC;
	
	signal sig13: STD_LOGIC;
	signal sig23: STD_LOGIC;
	signal bcd_cout: STD_LOGIC;
	
begin
	
	sig13 <= binary_adder_out(1) and binary_adder_out(3);
	sig23 <= binary_adder_out(2) and binary_adder_out(3);
	
	bcd_cout <= sig13 or sig23 or binary_adder_carry;
	cout <= bcd_cout;
	
	BinaryAdder : RippleAdder port map(A => A, B => B, Cin => '0', S => binary_adder_out, Cout => binary_adder_carry);
	BCDAdder: RippleAdder port map(A => binary_adder_out, B(0) => '0', B(1) => bcd_cout, B(2) => bcd_cout, B(3) => '0', Cin => '0', S => S);
	


end Behavioral;

