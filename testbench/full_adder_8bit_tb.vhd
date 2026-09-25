-- ============================================================
-- TESTBENCH FOR 8-BIT FULL ADDER
-- ============================================================
-- We test the 8-bit Full Adder using different inputs.
--
-- Each test case runs for 500 ns.
--
-- Process:
--
-- Give A, B and Cin
--       ↓
-- 8-bit Full Adder
--       ↓
-- Check SUM and Cout
--
-- Test cases:
--
-- 1.  0   + 0   + 0 = 0
-- 2.  1   + 1   + 0 = 2
-- 3.  5   + 3   + 0 = 8
-- 4.  15  + 1   + 0 = 16
-- 5.  255 + 0   + 0 = 255
-- 6.  255 + 1   + 0 = 256
-- 7.  128 + 127 + 0 = 255
-- 8.  255 + 255 + 0 = 510
-- ============================================================


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity has no input or output ports
entity full_adder_8bit_tb is
end full_adder_8bit_tb;


architecture Behavioral of full_adder_8bit_tb is

    -- Input signals
    signal A   : STD_LOGIC_VECTOR(7 downto 0);
    signal B   : STD_LOGIC_VECTOR(7 downto 0);
    signal Cin : STD_LOGIC;

    -- Output signals
    signal SUM  : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout : STD_LOGIC;

begin

    -- Instantiate the 8-bit Full Adder
    DUT: entity work.full_adder_8bit
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            SUM  => SUM,
            Cout => Cout
        );


    -- Test process
    process
    begin

        -- Test 1: 0 + 0 + 0 = 0
        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        wait for 100 ns;


        -- Test 2: 1 + 1 + 0 = 2
        A <= "00000001";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;


        -- Test 3: 5 + 3 + 0 = 8
        A <= "00000101";
        B <= "00000011";
        Cin <= '0';
        wait for 100 ns;


        -- Test 4: 15 + 1 + 0 = 16
        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;


        -- Test 5: 255 + 0 + 0 = 255
        A <= "11111111";
        B <= "00000000";
        Cin <= '0';
        wait for 100 ns;


        -- Test 6: 255 + 1 + 0 = 256
        -- SUM = 00000000
        -- Cout = 1
        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;


        -- Test 7: 128 + 127 + 0 = 255
        A <= "10000000";
        B <= "01111111";
        Cin <= '0';
        wait for 100 ns;


        -- Test 8: 255 + 255 + 0 = 510
        -- SUM = 11111110
        -- Cout = 1
        A <= "11111111";
        B <= "11111111";
        Cin <= '0';
        wait for 100 ns;


        -- Stop simulation
        wait;

    end process;

end Behavioral;
