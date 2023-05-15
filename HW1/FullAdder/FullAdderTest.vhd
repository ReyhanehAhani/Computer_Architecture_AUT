LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FullAdderTest IS
END FullAdderTest;
 
ARCHITECTURE behavior OF FullAdderTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FullAdder
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FullAdder PORT MAP (
          I0 => I0,
          I1 => I1,
          Cin => Cin,
          S => S,
          Cout => Cout
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		
      -- insert stimulus here 
	
I0 <= '0';
I1 <= '0';
Cin <= '0';
wait for 100 ns;

I0 <= '1';
I1 <= '0';
Cin <= '0';
wait for 100 ns;

I0 <= '0';
I1 <= '1';
Cin <= '0';
wait for 100 ns;

I0 <= '1';
I1 <= '1';
Cin <= '0';
wait for 100 ns;

I0 <= '0';
I1 <= '0';
Cin <= '1';
wait for 100 ns;

I0 <= '1';
I1 <= '0';
Cin <= '1';
wait for 100 ns;

I0 <= '0';
I1 <= '1';
Cin <= '1';
wait for 100 ns;

I0 <= '1';
I1 <= '1';
Cin <= '1';
wait for 100 ns;

      wait;
   end process;

END;
