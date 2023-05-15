--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:06:56 05/11/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW9/RAM/RAMTest.vhd
-- Project Name:  RAM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM32X8
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
 
ENTITY RAMTest IS
END RAMTest;
 
ARCHITECTURE behavior OF RAMTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM32X8
    PORT(
         CLK : IN  std_logic;
         RW : IN  std_logic;
         ADDRESS : IN  std_logic_vector(4 downto 0);
         DATA_OUT : OUT  std_logic_vector(7 downto 0);
         DATA_IN : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RW : std_logic := '0';
   signal ADDRESS : std_logic_vector(4 downto 0) := (others => '0');
   signal DATA_IN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DATA_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM32X8 PORT MAP (
          CLK => CLK,
          RW => RW,
          ADDRESS => ADDRESS,
          DATA_OUT => DATA_OUT,
          DATA_IN => DATA_IN
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
      RW <= '1';
		ADDRESS <= "00000";
		DATA_IN    <= "10101010";
		wait for CLK_period;
		
		DATA_IN <= "00000000";
		RW <= '0';
		ADDRESS <= "00000";
		wait for CLK_period;

      wait;
   end process;

END;
