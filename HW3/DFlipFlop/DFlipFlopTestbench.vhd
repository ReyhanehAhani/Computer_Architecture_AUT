LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DFlipFlopTestbench IS
END DFlipFlopTestbench;
 
ARCHITECTURE behavior OF DFlipFlopTestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DFlipFlop
    PORT(
         D : IN  std_logic;
         CLK : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic;
         Qb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal CLK : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qb : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DFlipFlop PORT MAP (
          D => D,
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
		D <= '0';
		R <= '0';
		-- hold reset state for 100 ns.
      wait for CLK_period*10;
		
		R <= '0';
		D <= '0';
		wait for CLK_period;
		
		R <= '0';
		D <= '1';
		wait for CLK_period;
		
		R <= '1';
		D <= '1';
		wait for CLK_period;

      wait;
   end process;

END;
