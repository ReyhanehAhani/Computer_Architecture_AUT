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
entity RAM is
	port (
		CLK: in STD_LOGIC;
		ADDRESS_READ: in STD_LOGIC_VECTOR(4 downto 0);
		ADDRESS_WRITE: in STD_LOGIC_VECTOR(4 downto 0);
		DATA_OUT: out STD_LOGIC_VECTOR(7 downto 0);
		DATA_IN: in STD_LOGIC_VECTOR(7 downto 0)
	);
end RAM;

architecture Behavioral of RAM is
	type memory is Array(31 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal RAM: memory := (
		others => "00000000"
	);
	
	signal read_addr, write_addr: integer range 31 downto 0;
begin
	
	CMB: process(CLK)
	begin
		read_addr <= to_integer(unsigned(ADDRESS_READ));
		write_addr <= to_integer(unsigned(ADDRESS_WRITE));
		if rising_edge(CLK) and CLK = '1' then
			DATA_OUT <= RAM(read_addr);
			RAM(write_addr) <= DATA_IN;
		end if;
	
	end process;

end Behavioral;

