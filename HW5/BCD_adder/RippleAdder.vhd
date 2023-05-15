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
		A : in STD_LOGIC_VECTOR(3 downto 0);
		B : in STD_LOGIC_VECTOR(3 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(3 downto 0);
		Cout : out STD_LOGIC
	);
			
end RippleAdder;


architecture Behavioral of RippleAdder is

	component full_adder is 
		port (
				 A: in STD_LOGIC;
				 B: in STD_LOGIC;
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC; 
				 Cout: out STD_LOGIC); 
	end component;
	
	signal Carries : STD_LOGIC_VECTOR(2 downto 0);

begin
	
	FA1: full_adder port map(A => A(0), B => B(0), Cin => Cin, S => S(0), Cout => Carries(0));
	FA2: full_adder port map(A => A(1), B => B(1), Cin => Carries(0), S => S(1), Cout => Carries(1));
	FA3: full_adder port map(A => A(2), B => B(2), Cin => Carries(1), S => S(2), Cout => Carries(2));
	FA4: full_adder port map(A => A(3), B => B(3), Cin => Carries(2), S => S(3), Cout => Cout);


end Behavioral;

