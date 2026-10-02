-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
-- Testbench does not have any input or output ports
entity d_flip_flop_tb is

end d_flip_flop_tb;


-- Testbench architecture
architecture Behavioral of d_flip_flop_tb is

    -- Declare the D Flip-Flop component
    component d_flip_flop
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Q_n : out STD_LOGIC
        );
    end component;


    -- Input signals
    signal D   : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';

    -- Output signals
    signal Q   : STD_LOGIC;
    signal Q_n : STD_LOGIC;


begin

    -- Instantiate the D Flip-Flop
    UUT: d_flip_flop
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Q_n => Q_n
        );


    -- Apply test cases
    process
    begin

        -- Test 1
        -- D = 0 and CLK = 0
        -- Master latch is enabled
        -- Q keeps its previous value
        D <= '0';
        CLK <= '0';
        wait for 100 ns;


        -- Test 2
        -- Rising edge of CLK
        -- D = 0 is transferred to Q
        -- Expected: Q = 0, Q_n = 1
        CLK <= '1';
        wait for 100 ns;


        -- Test 3
        -- Change D while CLK is high
        -- Flip-Flop should not change Q
        -- Expected: Q remains 0
        D <= '1';
        wait for 100 ns;


        -- Test 4
        -- Falling edge of CLK
        -- Output remains unchanged
        CLK <= '0';
        wait for 100 ns;


        -- Test 5
        -- Rising edge of CLK
        -- D = 1 is transferred to Q
        -- Expected: Q = 1, Q_n = 0
        CLK <= '1';
        wait for 100 ns;


        -- Test 6
        -- Change D while CLK is high
        -- Q should remain 1
        -- Expected: Q = 1, Q_n = 0
        D <= '0';
        wait for 100 ns;


        -- Test 7
        -- Falling edge of CLK
        -- Output remains unchanged
        CLK <= '0';
        wait for 100 ns;


        -- Test 8
        -- Rising edge of CLK
        -- D = 0 is transferred to Q
        -- Expected: Q = 0, Q_n = 1
        CLK <= '1';
        wait for 100 ns;


        -- Stop simulation
        wait;

    end process;

end Behavioral;
