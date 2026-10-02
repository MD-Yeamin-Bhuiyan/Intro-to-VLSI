library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--====================================================
-- Testbench for 1-Bit Register
--====================================================
entity register_1bit_tb is
end register_1bit_tb;


architecture Behavioral of register_1bit_tb is

    -- Component declaration
    component register_1bit
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

    --================================================
    -- Connect the 1-Bit Register
    --================================================
    UUT: register_1bit
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Q_n => Q_n
        );


    --================================================
    -- Test Process
    --================================================
    process
    begin

        --============================================
        -- TEST 1
        -- Initial value
        -- D = 0, CLK = 0
        --============================================
        D <= '0';
        CLK <= '0';
        wait for 100 ns;

        -- Expected:
        -- Q  = previous value
        -- Q_n = opposite of Q


        --============================================
        -- TEST 2
        -- Put 1 into the register
        -- D = 1
        --============================================
        D <= '1';
        CLK <= '0';
        wait for 100 ns;

        -- Master stores D = 1
        -- Q does not change yet


        --============================================
        -- TEST 3
        -- Clock goes HIGH
        -- Stored value moves to Q
        --============================================
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q   = 1
        -- Q_n = 0


        --============================================
        -- TEST 4
        -- Change D to 0 while CLK is HIGH
        --============================================
        D <= '0';
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q   = 1
        -- Q_n = 0
        --
        -- Q does not immediately change because
        -- the Master is disabled.


        --============================================
        -- TEST 5
        -- CLK goes LOW
        -- Master becomes enabled
        -- It captures D = 0
        --============================================
        CLK <= '0';
        wait for 100 ns;

        -- Expected:
        -- Q   = 1
        -- Q_n = 0
        --
        -- Slave is disabled, so Q still holds 1.


        --============================================
        -- TEST 6
        -- CLK goes HIGH again
        -- Stored D = 0 moves to Q
        --============================================
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q   = 0
        -- Q_n = 1


        --============================================
        -- TEST 7
        -- Put 1 into the register again
        --============================================
        D <= '1';
        CLK <= '0';
        wait for 100 ns;

        -- Master captures D = 1
        -- Q still remains 0


        --============================================
        -- TEST 8
        -- Clock goes HIGH
        -- New stored value appears at Q
        --============================================
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q   = 1
        -- Q_n = 0


        --============================================
        -- End simulation
        --============================================
        wait;

    end process;

end Behavioral;
