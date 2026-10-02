library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--====================================================
-- Testbench for 8-Bit Register
--====================================================
entity register_8bit_tb is
end register_8bit_tb;


architecture Behavioral of register_8bit_tb is

    --================================================
    -- Component declaration
    --================================================
    component register_8bit
        Port (
            D   : in  STD_LOGIC_VECTOR(7 downto 0);
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(7 downto 0);
            Q_n : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    --================================================
    -- Testbench signals
    --================================================
    signal D   : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal CLK : STD_LOGIC := '0';

    signal Q   : STD_LOGIC_VECTOR(7 downto 0);
    signal Q_n : STD_LOGIC_VECTOR(7 downto 0);

begin

    --================================================
    -- Connect the 8-bit Register
    --================================================
    UUT: register_8bit
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
        -- Initial input
        -- D = 00000000
        --============================================
        D <= "00000000";
        CLK <= '0';
        wait for 100 ns;

        -- Expected:
        -- Q holds previous value


        --============================================
        -- TEST 2
        -- Load 10101010
        -- CLK = 0
        -- Master registers capture the input
        --============================================
        D <= "10101010";
        CLK <= '0';
        wait for 100 ns;

        -- Expected:
        -- Q has not changed yet


        --============================================
        -- TEST 3
        -- CLK goes HIGH
        -- Stored data moves to output
        --============================================
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q = 10101010
        -- Q_n = 01010101


        --============================================
        -- TEST 4
        -- Change input to 11001100
        -- while CLK is HIGH
        --============================================
        D <= "11001100";
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q = 10101010
        -- Q does NOT change yet


        --============================================
        -- TEST 5
        -- CLK goes LOW
        -- Master captures new input
        --============================================
        CLK <= '0';
        wait for 100 ns;

        -- Expected:
        -- Q = 10101010
        -- Slave is disabled


        --============================================
        -- TEST 6
        -- CLK goes HIGH
        -- New value moves to Q
        --============================================
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q = 11001100
        -- Q_n = 00110011


        --============================================
        -- TEST 7
        -- Load another value
        -- D = 11110000
        --============================================
        D <= "11110000";
        CLK <= '0';
        wait for 100 ns;

        -- Expected:
        -- Q = 11001100
        -- New value is stored in master


        --============================================
        -- TEST 8
        -- CLK goes HIGH
        -- New value appears at Q
        --============================================
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q = 11110000
        -- Q_n = 00001111


        --============================================
        -- TEST 9
        -- Load 01010101
        --============================================
        D <= "01010101";
        CLK <= '0';
        wait for 100 ns;


        --============================================
        -- TEST 10
        -- CLK goes HIGH
        --============================================
        CLK <= '1';
        wait for 100 ns;

        -- Expected:
        -- Q = 01010101
        -- Q_n = 10101010


        --============================================
        -- End simulation
        --============================================
        wait;

    end process;

end Behavioral;
