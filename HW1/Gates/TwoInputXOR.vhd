library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoInputXOR is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end TwoInputXOR;

architecture Behavioral of TwoInputXOR is

begin

	C <= A XOR B;

end Behavioral;

