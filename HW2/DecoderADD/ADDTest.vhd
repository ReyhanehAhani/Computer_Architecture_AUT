LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ADDTest IS
END ADDTest;
 
ARCHITECTURE behavior OF ADDTest IS 
 
    COMPONENT ADD
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Q : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Q => Q,
          Cout => Cout
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
			
		A <= '0';
		B <= '0';
		Cin <= '0';
		wait for 100 ns;

		A <= '1';
		B <= '0';
		Cin <= '0';
		wait for 100 ns;

		A <= '0';
		B <= '1';
		Cin <= '0';
		wait for 100 ns;

		A <= '1';
		B <= '1';
		Cin <= '0';
		wait for 100 ns;

		A <= '0';
		B <= '0';
		Cin <= '1';
		wait for 100 ns;

		A <= '1';
		B <= '0';
		Cin <= '1';
		wait for 100 ns;

		A <= '0';
		B <= '1';
		Cin <= '1';
		wait for 100 ns;

A <= '1';
B <= '1';
Cin <= '1';
wait for 100 ns;
			
      wait;
   end process;

END;
