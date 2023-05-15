--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:32:49 02/26/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW2/comparator/NAND_XOR_TEST.vhd
-- Project Name:  comparator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NAND_XOR
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
 
ENTITY NAND_XOR_TEST IS
END NAND_XOR_TEST;
 
ARCHITECTURE behavior OF NAND_XOR_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NAND_XOR
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NAND_XOR PORT MAP (
          A => A,
          B => B,
          Q => Q
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

    
      -- insert stimulus here 
		
			A <= '0';
			B <= '0';
			wait for 100 ns;
			A <= '1';
			B <= '0';
			wait for 100 ns;
			A <= '0';
			B <= '1';
			wait for 100 ns;
			A <= '1';
			B <= '1';
			wait for 100 ns;
			

      wait;
   end process;

END;
