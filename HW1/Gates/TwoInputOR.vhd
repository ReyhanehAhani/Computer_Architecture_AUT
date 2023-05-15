library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoInputOR is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end TwoInputOR;

architecture Behavioral of TwoInputOR is

begin

	C <= A OR B;


end Behavioral;

