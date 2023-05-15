LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Machine IS
	PORT
	(
		clk : IN STD_LOGIC;
		din : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		dout : OUT STD_LOGIC
	);
END Machine;
ARCHITECTURE Behavioral OF Machine IS
	TYPE state IS (st0, st1, st2, st3);
	SIGNAL present_state, next_state : state;
BEGIN
	syncronous_process : PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (rst = '1') THEN
				present_state <= st0;
			ELSE
				present_state <= next_state;
			END IF;
		END IF;
	END PROCESS;
	next_state_and_output_decoder : PROCESS (present_state, din)
	BEGIN
		dout <= '0';
		CASE (present_state) IS WHEN st0 =>
			IF (din = '1') THEN
				next_state <= st1;
				dout <= '0';
			ELSE
				next_state <= st0;
				dout <= '0';
			END IF;
			WHEN St1 =>
				IF (din = '0') THEN
					next_state <= st2;
					dout <= '0';
				ELSE
					next_state <= st1;
					dout <= '0';
				END IF;
			WHEN St2 =>
				IF (din = '1') THEN
					next_state <= st3;
					dout <= '0';
				ELSE
					next_state <= st2;
					dout <= '0';
				END IF;
			WHEN St3 =>
				IF (din = '0') THEN
					next_state <= st0;
					dout <= '1';
				ELSE
					next_state <= st3;
					dout <= '0';
				END IF;
			WHEN OTHERS =>
				next_state <= st0;
				dout <= '0';
		END CASE;
	END PROCESS;
END Behavioral;