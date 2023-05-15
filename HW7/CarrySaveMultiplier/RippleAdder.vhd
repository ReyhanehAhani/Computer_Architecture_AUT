----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:56 04/06/2022 
-- Design Name: 
-- Module Name:    RipperAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RippleAdder is
	port (
		A : in STD_LOGIC_VECTOR(8 downto 0);
		B : in STD_LOGIC_VECTOR(8 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(8 downto 0);
		Cout : out STD_LOGIC
	);
			
end RippleAdder;


architecture Behavioral of RippleAdder is

	component FullAdder is 
		port (
				 A: in STD_LOGIC;
				 B: in STD_LOGIC;
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC; 
				 Cout: out STD_LOGIC); 
	end component;
	
	signal Carries : STD_LOGIC_VECTOR(7 downto 0);

begin
	
	FA1: FullAdder port map(A => A(0), B => B(0), Cin => Cin, S => S(0), Cout => Carries(0));
	FA2: FullAdder port map(A => A(1), B => B(1), Cin => Carries(0), S => S(1), Cout => Carries(1));
	FA3: FullAdder port map(A => A(2), B => B(2), Cin => Carries(1), S => S(2), Cout => Carries(2));
	FA4: FullAdder port map(A => A(3), B => B(3), Cin => Carries(2), S => S(3), Cout => Carries(3));
	FA5: FullAdder port map(A => A(4), B => B(4), Cin => Carries(3), S => S(4), Cout => Carries(4));
	FA6: FullAdder port map(A => A(5), B => B(5), Cin => Carries(4), S => S(5), Cout => Carries(5));
	FA7: FullAdder port map(A => A(6), B => B(6), Cin => Carries(5), S => S(6), Cout => Carries(6));
	FA8: FullAdder port map(A => A(7), B => B(7), Cin => Carries(6), S => S(7), Cout => Carries(7));
	FA9: FullAdder port map(A => A(8), B => B(8), Cin => Carries(7), S => S(8), Cout => Cout);
	

end Behavioral;

