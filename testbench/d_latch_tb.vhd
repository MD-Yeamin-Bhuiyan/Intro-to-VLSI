-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
-- Testbench does not have any input or output ports
entity d_latch_tb is

end d_latch_tb;


-- Testbench architecture
architecture Behavioral of d_latch_tb is

    -- Declare the D Latch component
    component d_latch
        Port (
            D      : in  STD_LOGIC;
            ENABLE : in  STD_LOGIC;
            Q      : out STD_LOGIC;
            Q_n    : out STD_LOGIC
        );
    end component;


    -- Input signals
    signal D      : STD_LOGIC := '0';
    signal ENABLE : STD_LOGIC := '0';

    -- Output signals
    signal Q   : STD_LOGIC;
    signal Q_n : STD_LOGIC;

begin

    -- Instantiate the D Latch
    UUT: d_latch
        port map (
            D      => D,
            ENABLE => ENABLE,
            Q      => Q,
            Q_n    => Q_n
        );


    -- Apply test cases
    process
    begin

        -- Test 1
        -- Disable the latch
        -- D = 0 and ENABLE = 0
        -- Data cannot change the stored value
        -- Q holds its previous value
        -- Q_n holds the complement of Q
        D <= '0';
        ENABLE <= '0';
        wait for 100 ns;


        -- Test 2
        -- Enable the latch
        -- D = 1 and ENABLE = 1
        -- The latch is open
        -- Q follows D, so Q should become 1
        -- Q_n should become 0
        D <= '1';
        ENABLE <= '1';
        wait for 100 ns;


        -- Test 3
        -- Change D while ENABLE is active
        -- D = 0 and ENABLE = 1
        -- The latch is still open
        -- Q follows D, so Q should become 0
        -- Q_n should become 1
        D <= '0';
        ENABLE <= '1';
        wait for 100 ns;


        -- Test 4
        -- Disable the latch
        -- D = 1 and ENABLE = 0
        -- The latch is closed
        -- Q should keep its previous value, which is 0
        -- Q_n should remain 1
        -- Changing D does not change Q
        D <= '1';
        ENABLE <= '0';
        wait for 100 ns;


        -- Test 5
        -- Enable again
        -- D = 1 and ENABLE = 1
        -- The latch is open
        -- Q follows D, so Q should become 1
        -- Q_n should become 0
        D <= '1';
        ENABLE <= '1';
        wait for 100 ns;


        -- Test 6
        -- Disable again
        -- ENABLE = 0
        -- The latch is closed
        -- Q should hold its previous value, which is 1
        -- Q_n should remain 0
        -- Even if D changes later, Q will remain 1
        ENABLE <= '0';
        wait for 100 ns;


        -- Stop simulation
        wait;

    end process;

end Behavioral;
