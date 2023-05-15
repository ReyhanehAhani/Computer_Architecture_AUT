LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JKFlipFlopTestBench IS
END JKFlipFlopTestBench;
 
ARCHITECTURE behavior OF JKFlipFlopTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT JKFlipFlop
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         CLK : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic;
         Qb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';
   signal CLK : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qb : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JKFlipFlop PORT MAP (
          J => J,
          K => K,
          CLK => CLK,
          R => R,
          Q => Q,
          Qb => Qb
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
			J <= '0';
			K <= '0';
			R <= '0';
			wait for CLK_period;
			
			J <= '1';
			K <= '0';
			R <= '0';
			wait for CLK_period;
			
			J <= '0';
			K <= '1';
			R <= '0';
			wait for CLK_period;
			
			J <= '1';
			K <= '1';
			R <= '0';
			wait for CLK_period;
			
			J <= '0';
			K <= '0';
			R <= '1';
			wait for CLK_period;
			
			J <= '0';
			K <= '0';
			R <= '0';
			wait for CLK_period;
      wait;
   end process;

END;
