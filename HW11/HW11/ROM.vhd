library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ROM is
	port (
		CLK: in STD_LOGIC;
		RD: in STD_LOGIC;
		ADDRESS: in STD_LOGIC_VECTOR(4 downto 0);
		DATA: out STD_LOGIC_VECTOR(7 downto 0)
	);
end ROM;

architecture Behavioral of ROM is
	type memory is Array(31 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	constant rom: memory := (
		"10100011",
		"10100001",
		"10010111",
		"01011011",
		"01001110",
		"11100111",
		"11010011",
		"11001001",
		"10101110",
		"01001100",
		"10100010",
		"10100001",
		"00000101",
		"11101010",
		"00010100",
		"00010101",
		"01100110",
		"11010111",
		"11111000",
		"01000001",
		"00100000",
		"10000100",
		"01110000",
		"10101101",
		"10111011",
		"01101000",
		"10111011",
		"10100000",
		"01000001",
		"00111010",
		"00000100",
		"10101110"
	);
	
	signal addr: integer range 31 downto 0;
begin
	
	CMB: process(CLK)
	begin
		addr <= to_integer(unsigned(address));
		if rising_edge(CLK) and CLK = '1' then
			if RD = '1' then
				DATA <= rom(addr);
			end if;
		end if;
	
	end process;

end Behavioral;

