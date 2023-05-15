library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
	port (
		I : in std_logic_vector(7 downto 0);
		O : out std_logic_vector(7 downto 0);
		CLK : in std_logic;
		RES : in STD_LOGIC
	);
end Reg;

architecture Behavioral of Reg is
	component DFlipFlop is
		port (
			Q : out std_logic;    
			CLK : in std_logic;   
			D : in std_logic;
			RES : in std_logic
		);
	end component;
begin
	
	GEN_REG: for J in 0 to 7 generate
		DX : DFlipFlop port map(CLK => CLK, RES => RES, D => I(J), Q => O(J));	
	end generate GEN_REG;

end Behavioral;

