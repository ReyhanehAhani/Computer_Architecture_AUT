----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:33 04/27/2022 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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



entity DFF is

	port ( d : in std_logic;
			 q : out std_logic;
			 clk : in std_logic
			 );		 
	
end DFF;

architecture Behavioral of DFF is
	

begin
	
	process(clk)
		variable next_q : std_logic := '0';
		begin 
			if clk = '1' and rising_edge(clk) then 
				next_q := d;
			end if;
		
		q <= next_q;
			
	end process;


end Behavioral;

