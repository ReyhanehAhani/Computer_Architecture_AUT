LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FourInputORTest IS
END FourInputORTest;
 
ARCHITECTURE behavior OF FourInputORTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourInputOR
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         R : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal D : std_logic := '0';

 	--Outputs
   signal R : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourInputOR PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          R => R
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      -- insert stimulus here 
			A <= '0';
			B <= '0';
			C <= '0';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '0';
			C <= '0';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '0';
			B <= '1';
			C <= '0';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '1';
			C <= '0';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '0';
			B <= '0';
			C <= '1';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '0';
			C <= '1';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '0';
			B <= '1';
			C <= '1';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '1';
			C <= '1';
			D <= '0';
			
			wait for 10 ns;
			
			A <= '0';
			B <= '0';
			C <= '0';
			D <= '1';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '0';
			C <= '0';
			D <= '1';
			
			wait for 10 ns;
			
			A <= '0';
			B <= '1';
			C <= '0';
			D <= '1';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '1';
			C <= '0';
			D <= '1';
			
			wait for 10 ns;
			
			A <= '0';
			B <= '0';
			C <= '1';
			D <= '1';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '0';
			C <= '1';
			D <= '1';
			
			wait for 10 ns;
			
			A <= '0';
			B <= '1';
			C <= '1';
			D <= '1';
			
			wait for 10 ns;
			
			A <= '1';
			B <= '1';
			C <= '1';
			D <= '1';
			
			wait for 10 ns;
			

      wait;
   end process;

END;
