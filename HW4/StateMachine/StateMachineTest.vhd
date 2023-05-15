LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY StateMachineTest IS
END StateMachineTest;
 
ARCHITECTURE behavior OF StateMachineTest IS 

    COMPONENT StateMachine
    PORT(
         input : IN  std_logic;
         output : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';
	signal res : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: StateMachine PORT MAP (
          input => input,
          output => output,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		input <= '0';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period;
		
		input <= '1';
		wait for clk_period;
		
		input <= '0';
		wait for clk_period;
		
		input <= '0';
		wait for clk_period;
		
		wait;
   end process;

END;
