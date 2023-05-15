LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY HalfAdderTest IS
END HalfAdderTest;
 
ARCHITECTURE behavior OF HalfAdderTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HalfAdder
    PORT(
         In1 : IN  std_logic;
         In2 : IN  std_logic;
         Out1 : OUT  std_logic;
         Out2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal In1 : std_logic := '0';
   signal In2 : std_logic := '0';

 	--Outputs
   signal Out1 : std_logic;
   signal Out2 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HalfAdder PORT MAP (
          In1 => In1,
          In2 => In2,
          Out1 => Out1,
          Out2 => Out2
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here
		In1 <= '0';
		In2 <= '0';
		wait for 100 ns;
		
		In1 <= '1';
		In2 <= '0';
		wait for 100 ns;
		
		In1 <= '0';
		In2 <= '1';
		wait for 100 ns;
		
		In1 <= '1';
		In2 <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
