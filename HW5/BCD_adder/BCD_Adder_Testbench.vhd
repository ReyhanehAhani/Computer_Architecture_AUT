--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:48:25 04/06/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW5/BCD_adder/BCD_Adder_Testbench.vhd
-- Project Name:  BCD_adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD_adder
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

use ieee.numeric_std.all;
 
ENTITY BCD_Adder_Testbench IS
END BCD_Adder_Testbench;
 
ARCHITECTURE behavior OF BCD_Adder_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCD_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic;
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   signal S : std_logic_vector(3 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD_adder PORT MAP (
          A => A,
          B => B,
          Cout => Cout,
          S => S
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		for i in 0 to 16 loop
			for j in 0 to 16 loop
				A <= std_logic_vector(to_unsigned(i, 4));
				B <= std_logic_vector(to_unsigned(j, 4));
				wait for 1 ns;
			end loop;
		end loop;
		
      wait;
   end process;

END;
