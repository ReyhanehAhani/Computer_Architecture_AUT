library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
	port (
		CLK : in std_logic;
		ROM_addr : in STD_LOGIC_VECTOR(4 downto 0);
		RAM_addr : in STD_LOGIC_VECTOR(4 downto 0);
		ALU_sel : in std_logic_vector(2 DOWNTO 0);
		REG_2_input : in std_logic_vector(7 downto 0);
		RESET : in std_logic;
		REG_out: out std_logic_vector(7 downto 0)
	);
end Main;

architecture Behavioral of Main is
	component Reg is
		port (
			I : in std_logic_vector(7 downto 0);
			O : out std_logic_vector(7 downto 0);
			CLK : in std_logic;
			RES : in STD_LOGIC
		);
	end component;
	component ROM is
		port (
			CLK: in STD_LOGIC;
			RD: in STD_LOGIC;
			ADDRESS: in STD_LOGIC_VECTOR(4 downto 0);
			DATA: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	component ALU IS
		PORT
		(
			a   : IN std_logic_vector(7 DOWNTO 0);
			b   : IN std_logic_vector(7 DOWNTO 0);
			o   : OUT std_logic_vector(7 DOWNTO 0);
			sel : IN std_logic_vector(2 DOWNTO 0);
			c   : OUT std_logic
		);
	END component;
	component RAM is
		port (
			CLK: in STD_LOGIC;
			ADDRESS_READ: in STD_LOGIC_VECTOR(4 downto 0);
			ADDRESS_WRITE: in STD_LOGIC_VECTOR(4 downto 0);
			DATA_OUT: out STD_LOGIC_VECTOR(7 downto 0);
			DATA_IN: in STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	signal ROM_data, REG1_output, REG2_output, ALU_output, RESULT_REG_output, RAM_output: STD_LOGIC_VECTOR(7 downto 0);
begin
	
	ROM0: ROM port map(CLK => CLK, RD => '1', ADDRESS => ROM_addr, DATA => ROM_data);
	REG1: REG port map(CLK => CLK, RES => RESET, I => ROM_data, O => REG1_output);
	REG2: REG port map(CLK => CLK, RES => RESET, I => REG_2_input, O => REG2_output);
	ALU0: ALU port map(A => REG1_output, B => REG2_output, O => ALU_output, SEL => ALU_sel);
	RESULT_REG: REG port map(CLK => CLK, RES => RESET, I => ALU_output, O => RESULT_REG_output);
	RAM0: RAM port map(CLK => CLK, ADDRESS_WRITE => RAM_addr, DATA_IN => RESULT_REG_output, DATA_OUT => RAM_output, ADDRESS_READ => RAM_addr);
	OUT_REG: REG port map(CLK => CLK, RES => RESET, I => RAM_output, O => REG_out);
end Behavioral;

