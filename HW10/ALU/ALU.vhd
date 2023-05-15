
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY ALU IS
	PORT
	(
		a   : IN std_logic_vector(7 DOWNTO 0);
		b   : IN std_logic_vector(7 DOWNTO 0);
		o   : OUT std_logic_vector(7 DOWNTO 0);
		sel : IN std_logic_vector(2 DOWNTO 0);
		c   : OUT std_logic
	);
END ALU;
ARCHITECTURE Behavioral OF ALU IS
BEGIN
	PROCESS (a, b, sel)
	VARIABLE alu_result : std_logic_vector(8 DOWNTO 0);
	BEGIN
		CASE(sel) IS
			WHEN "000" =>
				-- std_numeric produces the same bit width as the left operand, therefore requiering a zero concatination
				alu_result := '0' & a + b;
			WHEN "001" =>
				alu_result(7 downto 0) := a OR b;
				alu_result(8) := '0'; -- OR can not have carry, but alu_result is required to be in a stable state
			WHEN "010" =>
				alu_result(7 downto 0) := a AND b;
				alu_result(8) := '0'; -- the same is true with and
			WHEN "011" =>
				alu_result := '0' & a; -- a is 8 bits and alu_result 9 bits, therefore requiering a zero concatination 
			WHEN "100" =>
				alu_result := '0' & a + 1; -- the same situation with std_numeric is true here
			WHEN "101" =>
				alu_result := '0' & b + 1;
			WHEN "110" =>
				alu_result := a & '0';
			WHEN OTHERS =>
				alu_result := (OTHERS => '0');
		END CASE;
		
		c <= alu_result(8);
		o <= alu_result(7 downto 0);
		
	END PROCESS;
END Behavioral;