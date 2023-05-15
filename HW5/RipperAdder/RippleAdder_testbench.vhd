
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

use ieee.numeric_std.all;
 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RippleAdder_testbench IS
END RippleAdder_testbench;
 
ARCHITECTURE behavior OF RippleAdder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RipplerAdder
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
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RipplerAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
		-- Examples
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
		
		
		-- All possible combinations
--		for i in 0 to 16 loop
--			for j in 0 to 16 loop
--				Cin <= '0';
--				A <= std_logic_vector(to_unsigned(i, 4));
--				B <= std_logic_vector(to_unsigned(j, 4));
--				wait for 1 ns;
--				
--				Cin <= '1';
--				A <= std_logic_vector(to_unsigned(i, 4));
--				B <= std_logic_vector(to_unsigned(j, 4));
--				wait for 1 ns;
--			end loop;
--		end loop;
		
		wait;
		
   end process;

END;