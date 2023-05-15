LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Testbench IS
END Testbench;
 
ARCHITECTURE behavior OF Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarryLookAhead
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarryLookAhead PORT MAP (
          A => A,
          B => B,
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
		
		A <= "0101";
		B <= "1101";
		Cin <= '0';
		wait for 100 ns;
		
		A <= "1111";
		B <= "0000";
		Cin <= '0';
		wait for 100 ns;
		
		A <= "1110";
		B <= "0011";
		Cin <= '0';
		wait for 100 ns;
		
		A <= "0111";
		B <= "0101";
		Cin <= '0';
		wait for 100 ns;
		
		
		A <= "0101";
		B <= "0101";
		Cin <= '1';
		wait for 100 ns;
		
		A <= "1101";
		B <= "1011";
		Cin <= '0';
		wait for 100 ns;


      wait;
   end process;

END;
