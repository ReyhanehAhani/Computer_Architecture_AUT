--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:46:34 04/23/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW7/ArrayMultiplier/Testbench.vhd
-- Project Name:  ArrayMultiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ArrayMultiplier
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
 
    COMPONENT ArrayMultiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(4 downto 0);
         P : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ArrayMultiplier PORT MAP (
          A => A,
          B => B,
          P => P
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
      -- insert stimulus here 
		
		-- Zero test
      B <= "00000";
		A <= "0000";
		wait for 100 ns;
		
		
		B <= "00001";
		A <= "0000";
		wait for 100 ns;
		
		B <= "00000";
		A <= "0001";
		wait for 100 ns;
		
		
		-- One test
		B <= "00001";
		A <= "0001";
		wait for 100 ns;
		
		B <= "00001";
		A <= "0010";
		wait for 100 ns;
		
		
		-- 2*6
		B <= "00010";
		A <= "0110";
		wait for 100 ns;
		
		-- 4*4
		B <= "00100";
		A <= "0100";
		wait for 100 ns;
		
		-- 2*2
		B <= "00010";
		A <= "0010";
		wait for 100 ns;
		
		-- 3*3
		B <= "00011";
		A <= "0011";
		wait for 100 ns;
		
		-- 3*2
		B <= "00010";
		A <= "0011";
		wait for 100 ns;
		
      wait;
   end process;

END;
