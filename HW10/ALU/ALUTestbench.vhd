--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:17:42 05/12/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW10/ALU/ALUTestbench.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALUTestbench IS
END ALUTestbench;
 
ARCHITECTURE behavior OF ALUTestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         o : OUT  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
   signal c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          a => a,
          b => b,
          o => o,
          sel => sel,
          c => c
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
			-- add
			a <= "11111111";
			b <= "00000001";
			sel <= "000";
			wait for 10 ns;
			
			
			-- or
			a <= "10101010";
			b <= "01010101";
			sel <= "001";
			wait for 10 ns;
			
			-- and
			a <= "11111111";
			b <= "01010101";
			sel <= "010";
			wait for 10 ns;
			
			-- output A
			a <= "10101010";
			b <= "00000000";
			sel <= "011";
			wait for 10 ns;
			
			-- A+1
			a <= "10101010";
			b <= "01010101";
			sel <= "100";
			wait for 10 ns;
			
			-- B+1
			a <= "10101010";
			b <= "01010101";
			sel <= "101";
			wait for 10 ns;
			
			-- shift A
			a <= "10101010";
			b <= "00000000";
			sel <= "110";
			wait for 10 ns;
			
			-- unused state
			a <= "10101010";
			b <= "11111111";
			sel <= "111";
			wait for 10 ns;
			
			
      wait;
   end process;

END;
