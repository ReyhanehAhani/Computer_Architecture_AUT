LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ORTest IS
END ORTest;
 
ARCHITECTURE behavior OF ORTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TwoInputOR
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal C : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TwoInputOR PORT MAP (
          A => A,
          B => B,
          C => C
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
