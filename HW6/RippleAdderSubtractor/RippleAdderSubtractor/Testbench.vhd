--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:55:38 04/17/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW6/RippleAdderSubtractor/RippleAdderSubtractor/Testbench.vhd
-- Project Name:  RippleAdderSubtractor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RippleAdderSubtractor
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
 
    COMPONENT RippleAdderSubtractor
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         K : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal K : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleAdderSubtractor PORT MAP (
          A => A,
          B => B,
          K => K,
          S => S,
          Cout => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      -- insert stimulus here 
		
		A <= "0101";
		B <= "1101";
		K <= '0';
		wait for 100 ns;
		
		A <= "1111";
		B <= "0000";
		K <= '0';
		wait for 100 ns;
		
		A <= "1110";
		B <= "0011";
		K <= '0';
		wait for 100 ns;
		
		A <= "0111";
		B <= "0101";
		K <= '1';
		wait for 100 ns;
		
		
		A <= "0101";
		B <= "0101";
		K <= '1';
		wait for 100 ns;
		
		A <= "1101";
		B <= "1011";
		K <= '1';
	
      wait;
   end process;

END;
