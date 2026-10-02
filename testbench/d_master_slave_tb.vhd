library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_master_slave_tb is
end d_master_slave_tb;

architecture Behavioral of d_master_slave_tb is

    -- Component declaration
    component d_master_slave
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Q_n : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal D   : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';
    signal Q   : STD_LOGIC;
    signal Q_n : STD_LOGIC;

begin

    -- Connect the Master-Slave D Flip-Flop
    UUT: d_master_slave
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Q_n => Q_n
        );

    process
    begin

        --========================================
        -- TEST 1
        -- D = 0, CLK = 0
        -- Master is enabled
        -- Slave is disabled
        -- Expected: Q remains previous value
        --========================================
        D <= '0';
        CLK <= '0';
        wait for 100 ns;


        --========================================
        -- TEST 2
        -- Change D to 1 while CLK = 0
        -- Master captures D = 1
        -- Slave is still disabled
        -- Expected: Q does not change yet
        --========================================
        D <= '1';
        CLK <= '0';
        wait for 100 ns;


        --========================================
        -- TEST 3
        -- Change CLK from 0 to 1
        -- Master becomes disabled
        -- Slave becomes enabled
        -- Expected: Q becomes 1
        -- Q_n becomes 0
        --========================================
        CLK <= '1';
        wait for 100 ns;


        --========================================
        -- TEST 4
        -- D changes to 0 while CLK = 1
        -- Master is disabled
        -- Therefore new D cannot reach Q
        -- Expected: Q remains 1
        --========================================
        D <= '0';
        CLK <= '1';
        wait for 100 ns;


        --========================================
        -- TEST 5
        -- CLK changes from 1 to 0
        -- Master becomes enabled
        -- Master captures D = 0
        -- Slave becomes disabled
        -- Expected: Q remains 1
        --========================================
        CLK <= '0';
        wait for 100 ns;


        --========================================
        -- TEST 6
        -- CLK changes from 0 to 1
        -- Slave becomes enabled
        -- Expected: Q becomes 0
        -- Q_n becomes 1
        --========================================
        CLK <= '1';
        wait for 100 ns;


        --========================================
        -- TEST 7
        -- D changes to 1 while CLK = 1
        -- Master is disabled
        -- Expected: Q remains 0
        --========================================
        D <= '1';
        CLK <= '1';
        wait for 100 ns;


        --========================================
        -- TEST 8
        -- CLK changes from 1 to 0
        -- Master captures D = 1
        -- Slave is disabled
        -- Expected: Q remains 0
        --========================================
        CLK <= '0';
        wait for 100 ns;


        --========================================
        -- TEST 9
        -- CLK changes from 0 to 1
        -- Slave receives Master's value
        -- Expected: Q becomes 1
        -- Q_n becomes 0
        --========================================
        CLK <= '1';
        wait for 100 ns;


        -- End simulation
        wait;

    end process;

end Behavioral;
