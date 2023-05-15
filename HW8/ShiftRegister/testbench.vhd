LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftRegister
    PORT(
         sel : IN  std_logic;
         p : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic;
         data : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic := '0';
   signal p : std_logic_vector(3 downto 0) := (others => '0');
   signal data : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftRegister PORT MAP (
          sel => sel,
          p => p,
          q => q,
          data => data,
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
	
		-- Ser test
		sel <= '1';
		data <= '1';
		wait for clk_period;
		data <= '0';
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;		
		
		-- Pal test
		sel <= '0';
		P <= "1010";
		wait for clk_period;
		sel <= '1';
		P <= "0000";
		wait for clk_period;
		wait for clk_period;
		wait for clk_period;
		
      wait;
   end process;

END;
