-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
-- Testbench does not have any input or output ports
entity sr_latch_tb is

end sr_latch_tb;


-- Testbench architecture
architecture Behavioral of sr_latch_tb is

    -- Declare the SR Latch component
    component sr_latch
        Port (
            S   : in  STD_LOGIC;
            R   : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Q_n : out STD_LOGIC
        );
    end component;

    -- Input signals for the SR Latch
    signal S : STD_LOGIC := '1';
    signal R : STD_LOGIC := '1';

    -- Output signals from the SR Latch
    signal Q   : STD_LOGIC;
    signal Q_n : STD_LOGIC;

begin

    -- Instantiate the SR Latch
    UUT: sr_latch
        port map (
            S   => S,
            R   => R,
            Q   => Q,
            Q_n => Q_n
        );


    -- Apply different input combinations
    process
    begin

        -- Hold condition
        -- S = 1 and R = 1
        S <= '1';
        R <= '1';
        wait for 100 ns;


        -- Set condition
        -- S = 0 and R = 1
        -- Q becomes 1
        S <= '0';
        R <= '1';
        wait for 100 ns;


        -- Hold condition
        -- The previous value is stored
        S <= '1';
        R <= '1';
        wait for 100 ns;


        -- Reset condition
        -- S = 1 and R = 0
        -- Q becomes 0
        S <= '1';
        R <= '0';
        wait for 100 ns;


        -- Hold condition
        -- The previous value is stored
        S <= '1';
        R <= '1';
        wait for 100 ns;


        -- Invalid condition
        -- S = 0 and R = 0
        S <= '0';
        R <= '0';
        wait for 100 ns;


        -- Return to hold condition
        S <= '1';
        R <= '1';
        wait for 100 ns;


        -- Stop the simulation
        wait;

    end process;

end Behavioral;
