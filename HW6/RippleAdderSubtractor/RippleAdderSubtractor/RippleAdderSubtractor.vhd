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

entity RippleAdderSubtractor is
	port (
		A : in STD_LOGIC_VECTOR(3 downto 0);
		B : in STD_LOGIC_VECTOR(3 downto 0);
		K : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(3 downto 0);
		Cout : out STD_LOGIC
	);
			
end RippleAdderSubtractor;


architecture Behavioral of RippleAdderSubtractor is

	component FullAdder is 
		port (
				 A: in STD_LOGIC;
				 B: in STD_LOGIC;
				 Cin: in STD_LOGIC;
				 S: out STD_LOGIC; 
				 Cout: out STD_LOGIC
		); 
	end component;
	
	signal Carries : STD_LOGIC_VECTOR(3 downto 0);
	signal BXor : STD_LOGIC_VECTOR(3 downto 0);

begin
	BXor(0) <= K xor B(0);
	BXor(1) <= K xor B(1);
	BXor(2) <= K xor B(2);
	BXor(3) <= K xor B(3);
	
	FA1: FullAdder port map(A => A(0), B => BXor(0), Cin => K, S => S(0), Cout => Carries(0));
	FA2: FullAdder port map(A => A(1), B => BXor(1), Cin => Carries(0), S => S(1), Cout => Carries(1));
	FA3: FullAdder port map(A => A(2), B => BXor(2), Cin => Carries(1), S => S(2), Cout => Carries(2));
	FA4: FullAdder port map(A => A(3), B => BXor(3), Cin => Carries(2), S => S(3), Cout => Carries(3));
	
	Cout <= Carries(3);	
end Behavioral;

