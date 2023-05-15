LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY SequenceDetectorMoore IS
	PORT
	(
		clock : IN STD_LOGIC;
		din : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		dout : OUT STD_LOGIC
	);
END SequenceDetectorMoore;
ARCHITECTURE Behavioral OF SequenceDetectorMoore IS
	TYPE state_t IS (s0, s1, s2, s3, s4);
	SIGNAL present_state, next_state : state_t;
BEGIN
	REG : PROCESS (clock)
	BEGIN
		IF (clock'EVENT AND clock = '1')
		 THEN
		 present_state <= next_state;
		 END IF;
	 END PROCESS;
	 output_decoder : PROCESS (present_state, din)
	 BEGIN
		 next_state <= s0;
		 CASE (present_state) IS
			 WHEN s0 =>
				 IF (din = '1') THEN
						next_state <= s1;
					ELSE
						next_state <= s0;
					END IF;
			WHEN s1 =>

						IF (din = '1') THEN
							next_state <= s2;
						ELSE
							next_state <= s0;
						END IF;
			WHEN s2 =>

						IF (din = '1') THEN
							next_state <= s3;
						ELSE
							next_state <= s0;
						END IF;
			WHEN s3 =>

						IF (din = '1') THEN
							next_state <= s3;
						ELSE
							next_state <= s4;
						END IF;
			WHEN s4 =>
						IF (din = '1') THEN
							next_state <= s1;
						ELSE
							next_state <= s0;
						END IF;
			WHEN OTHERS =>

						next_state <= s0;
			END CASE;
		END PROCESS;
		next_state_decoder : PROCESS (present_state)
		BEGIN
			CASE (present_state) IS
				WHEN s0 =>

					dout <= '0';
				WHEN s1 =>

					dout <= '0';
				WHEN s2 =>

					dout <= '0';
				WHEN s3 =>

					dout <= '0';
				WHEN s4 =>

					dout <= '1';
				WHEN OTHERS =>

					dout <= '0';
			END CASE;
		END PROCESS;
END Behavioral;