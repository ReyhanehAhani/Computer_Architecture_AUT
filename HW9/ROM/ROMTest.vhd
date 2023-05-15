--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:46:02 05/10/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW9/ROM/ROMTest.vhd
-- Project Name:  ROM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM32X8
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ROMTest IS
END ROMTest;
 
ARCHITECTURE behavior OF ROMTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM32X8
    PORT(
         CLK : IN  std_logic;
         RD : IN  std_logic;
         ADDRESS : IN  std_logic_vector(4 downto 0);
         DATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RD : std_logic := '0';
   signal ADDRESS : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM32X8 PORT MAP (
          CLK => CLK,
          RD => RD,
          ADDRESS => ADDRESS,
          DATA => DATA
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
		
		for a in 0 to 32 loop
			RD <= '1';
			ADDRESS <= std_logic_vector(to_unsigned(a, 5));
			wait for CLK_period;
		end loop;
      -- insert stimulus here 

      wait;
   end process;

END;
