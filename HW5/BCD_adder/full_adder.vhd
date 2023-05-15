library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is
		port (
			 A: in STD_LOGIC;
			 B: in STD_LOGIC;
			 Cin: in STD_LOGIC;
			 S: out STD_LOGIC; 
			 Cout: out STD_LOGIC
	);

end full_adder;

architecture Behavioral of full_adder is	
begin
	
	
	 S <= A XOR B XOR Cin ;
	 Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;



end Behavioral;

