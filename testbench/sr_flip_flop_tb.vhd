-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
entity sr_flip_flop_tb is
end sr_flip_flop_tb;


-- Testbench architecture
architecture Behavioral of sr_flip_flop_tb is


    -- Declare the SR flip-flop
    component sr_flip_flop
        Port (
            S   : in  STD_LOGIC;
            R   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Q_n : out STD_LOGIC
        );
    end component;


    -- Test signals
    signal S   : STD_LOGIC := '0';
    signal R   : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';

    signal Q   : STD_LOGIC;
    signal Q_n : STD_LOGIC;


begin


    ----------------------------------------------------------------
    -- Connect the testbench to the SR flip-flop
    ----------------------------------------------------------------
    UUT: sr_flip_flop
        port map (
            S   => S,
            R   => R,
            CLK => CLK,
            Q   => Q,
            Q_n => Q_n
        );


    ----------------------------------------------------------------
    -- Test process
    ----------------------------------------------------------------
    process
    begin

        ------------------------------------------------------------
        -- Test 1: Initial Hold
        --
        -- S = 0
        -- R = 0
        -- CLK = 0
        --
        -- No set or reset operation.
        ------------------------------------------------------------
        S <= '0';
        R <= '0';
        CLK <= '0';

        wait for 100 ns;


        ------------------------------------------------------------
        -- Test 2: Set
        --
        -- S = 1
        -- R = 0
        --
        -- The master captures SET while CLK is low.
        -- When CLK goes high, Q becomes 1.
        ------------------------------------------------------------
        S <= '1';
        R <= '0';
        CLK <= '0';

        wait for 50 ns;

        CLK <= '1';

        wait for 100 ns;


        ------------------------------------------------------------
        -- Test 3: Hold
        --
        -- S = 0
        -- R = 0
        --
        -- Q should remain 1.
        ------------------------------------------------------------
        S <= '0';
        R <= '0';
        CLK <= '0';

        wait for 100 ns;

        CLK <= '1';

        wait for 100 ns;


        ------------------------------------------------------------
        -- Test 4: Reset
        --
        -- S = 0
        -- R = 1
        --
        -- The master captures RESET while CLK is low.
        -- When CLK goes high, Q becomes 0.
        ------------------------------------------------------------
        S <= '0';
        R <= '1';
        CLK <= '0';

        wait for 50 ns;

        CLK <= '1';

        wait for 100 ns;


        ------------------------------------------------------------
        -- Test 5: Set Again
        --
        -- S = 1
        -- R = 0
        --
        -- Q should become 1 after the clock goes high.
        ------------------------------------------------------------
        S <= '1';
        R <= '0';
        CLK <= '0';

        wait for 50 ns;

        CLK <= '1';

        wait for 100 ns;


        ------------------------------------------------------------
        -- Test 6: Change S while CLK is HIGH
        --
        -- The master is disabled.
        -- Q should NOT immediately change.
        ------------------------------------------------------------
        S <= '0';
        R <= '0';
        CLK <= '1';

        wait for 100 ns;


        ------------------------------------------------------------
        -- Test 7: Reset on next clock cycle
        ------------------------------------------------------------
        S <= '0';
        R <= '1';
        CLK <= '0';

        wait for 50 ns;

        CLK <= '1';

        wait for 100 ns;


        ------------------------------------------------------------
        -- Test 8: Invalid condition
        --
        -- S = 1
        -- R = 1
        --
        -- This is an invalid condition for an SR flip-flop.
        ------------------------------------------------------------
        S <= '1';
        R <= '1';
        CLK <= '0';

        wait for 50 ns;

        CLK <= '1';

        wait for 100 ns;


        ------------------------------------------------------------
        -- End simulation
        ------------------------------------------------------------
        wait;

    end process;

end Behavioral;
