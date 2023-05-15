----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:26:31 05/10/2022 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
--use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;
entity RAM32X8 is
	port (
		CLK: in STD_LOGIC;
		RW: in STD_LOGIC; -- Read = 0, Write = 1
		ADDRESS: in STD_LOGIC_VECTOR(4 downto 0);
		DATA_OUT: out STD_LOGIC_VECTOR(7 downto 0);
		DATA_IN: in STD_LOGIC_VECTOR(7 downto 0)
	);
end RAM32X8;

architecture Behavioral of RAM32X8 is
	type memory is Array(31 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal RAM: memory := (
		others => "00000000"
	);
	
	signal addr: integer range 31 downto 0;
begin
	
	CMB: process(CLK)
	begin
		addr <= to_integer(unsigned(address));
		if rising_edge(CLK) and CLK = '1' then
			if RW = '0' then
				DATA_OUT <= RAM(addr);
			else
				RAM(addr) <= DATA_IN;
			end if;
		end if;
	
	end process;

end Behavioral;

