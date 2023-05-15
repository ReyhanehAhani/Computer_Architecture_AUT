library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySaveAdder is
	port (
		A, B, C: in STD_LOGIC_VECTOR(3 downto 0);
		S: out STD_LOGIC_VECTOR(4 downto 0);
		Cout: out STD_LOGIC
	);
end CarrySaveAdder;

architecture Behavioral of CarrySaveAdder is
	component RipplerAdder is
		port (
			A : in STD_LOGIC_VECTOR(3 downto 0);
			B : in STD_LOGIC_VECTOR(3 downto 0);
			Cin : in STD_LOGIC;
			S : out STD_LOGIC_VECTOR(3 downto 0);
			Cout : out STD_LOGIC );
	end component;
	component FullAdder is
		port (
				 A: in STD_LOGIC;
				 B: in STD_LOGIC;
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC; 
				 Cout: out STD_LOGIC
		);
	end component;
	signal X,Y: STD_LOGIC_VECTOR(3 downto 0);
begin	
	
	-- Adder
	FA0: FullAdder port map(A => A(0), B => B(0), Cin => C(0), S => S(0), Cout => X(0));
	FA1: FullAdder port map(A => A(1), B => B(1), Cin => C(1), S => Y(0), Cout => X(1));
	FA2: FullAdder port map(A => A(2), B => B(2), Cin => C(2), S => Y(1), Cout => X(2));
	FA3: FullAdder port map(A => A(3), B => B(3), Cin => C(3), S => Y(2), Cout => X(3));
	Y(3) <= '0';
	
	-- Carry
	CS: RipplerAdder port map(A => X, B => Y, Cin => '0', S(0) => S(1), S(1) => S(2), S(2) => S(3), S(3) => S(4), Cout => Cout);
end Behavioral;

