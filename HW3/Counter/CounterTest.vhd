--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:07:30 03/03/2022
-- Design Name:   
-- Module Name:   F:/term6/ComputerAz/HW3/Counter/CounterTest.vhd
-- Project Name:  Counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UpDownCounter
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
 
ENTITY CounterTest IS
END CounterTest;
 
ARCHITECTURE behavior OF CounterTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UpDownCounter
    PORT(
         CLK : IN  std_logic;
         S : IN  std_logic;
         R : IN  std_logic;
			E : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal S : std_logic := '0';
   signal R : std_logic := '0';
	signal E : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UpDownCounter PORT MAP (
          CLK => CLK,
          S => S,
          R => R,
          Q => Q,
			 E => E
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		
		E <= '1';
		-- Up counter
		S <= '0';
		R <= '0';
		for i in 0 to 16 loop
			wait for CLK_period;
		end loop;
		
		R <= '1';
		wait for CLK_period;
		R <= '0';
		wait for CLK_period;
		
		-- Down counter
		S <= '1';
		R <= '0';
		for i in 0 to 16 loop
			wait for CLK_period;
		end loop;
		
		R <= '1';
		wait for CLK_period;
		R <= '0';
		wait for CLK_period;

      wait;
   end process;

END;
