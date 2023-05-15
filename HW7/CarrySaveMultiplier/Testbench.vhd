--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:17:06 04/23/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW7/CarrySaveMultiplier/Testbench.vhd
-- Project Name:  CarrySaveMultiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mulitplier
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
 
    COMPONENT Mulitplier
    PORT(
         A : IN  std_logic_vector(4 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(4 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mulitplier PORT MAP (
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
      A <= "00000";
		b <= "0000";
		wait for 10 ns;
		
		
		A <= "00001";
		b <= "0000";
		wait for 10 ns;
		
		A <= "00000";
		b <= "0001";
		wait for 10 ns;
		
		
		-- One test
		A <= "00001";
		b <= "0001";
		wait for 10 ns;
		
		A <= "00001";
		b <= "0010";
		wait for 10 ns;
		
		A <= "00010";
		b <= "0001";
		wait for 10 ns;
		
		A <= "00011";
		b <= "0001";
		wait for 10 ns;
		
		A <= "00001";
		b <= "0011";
		wait for 10 ns;
		
		
		-- 2*6
		A <= "00010";
		B <= "0110";
		wait for 10 ns;
		
		-- 4*4
		A <= "00100";
		B <= "0100";
		wait for 10 ns;
		
		-- 2*2
		A <= "00010";
		B <= "0010";
		wait for 10 ns;
		
		-- 3*2
		A <= "00010";
		B <= "0011";
		wait for 10 ns;
		
		-- 5*3
		A <= "00101";
		B <= "0011";
		wait for 10 ns;
		
		-- 3*5
		B <= "0101";
		A <= "0101";
		wait for 10 ns;

      wait;
   end process;

END;
