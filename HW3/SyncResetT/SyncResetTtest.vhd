LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SyncResetTtest IS
END SyncResetTtest;
 
ARCHITECTURE behavior OF SyncResetTtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SyncResetT
    PORT(
         CLK : IN  std_logic;
         T : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic;
         Qb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal T : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Qb : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SyncResetT PORT MAP (
          CLK => CLK,
          T => T,
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		
		T <= '0';
		R <= '0';
		wait for CLK_period;
		
		
		-- Toggle
		T <= '1';
		R <= '0';
		wait for CLK_period;
		
		T <= '1';
		R <= '0';
		wait for CLK_period;
		
		
		-- Reset
		T <= '0';
		R <= '1';
		wait for CLK_period;
		
		-- Sync reset
		T <= '1';
		R <= '1';
		wait for CLK_period;

      wait;
   end process;

END;
