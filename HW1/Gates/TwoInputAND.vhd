library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoInputAND is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end TwoInputAND;

architecture Behavioral of TwoInputAND is

begin

	C <= A and B;


end Behavioral;

