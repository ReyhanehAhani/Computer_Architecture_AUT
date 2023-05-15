--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:22:47 06/01/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW11/HW11/Testbench.vhd
-- Project Name:  HW11
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Testbench IS
END Testbench;
 
ARCHITECTURE behavior OF Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         CLK : IN  std_logic;
         ROM_addr : IN  std_logic_vector(4 downto 0);
         RAM_addr : IN  std_logic_vector(4 downto 0);
         ALU_sel : IN  std_logic_vector(2 downto 0);
         REG_2_input : IN  std_logic_vector(7 downto 0);
         RESET : IN  std_logic;
         REG_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ROM_addr : std_logic_vector(4 downto 0) := (others => '0');
   signal RAM_addr : std_logic_vector(4 downto 0) := (others => '0');
   signal ALU_sel : std_logic_vector(2 downto 0) := (others => '0');
   signal REG_2_input : std_logic_vector(7 downto 0) := (others => '0');
   signal RESET : std_logic := '0';

 	--Outputs
   signal REG_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          CLK => CLK,
          ROM_addr => ROM_addr,
          RAM_addr => RAM_addr,
          ALU_sel => ALU_sel,
          REG_2_input => REG_2_input,
          RESET => RESET,
          REG_out => REG_out
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      ROM_addr <= "00000";
		RAM_addr <= "00000";
		ALU_sel <= "000";
		REG_2_input <= "00000001";
		RESET <= '0'; 

      wait;
   end process;

END;
