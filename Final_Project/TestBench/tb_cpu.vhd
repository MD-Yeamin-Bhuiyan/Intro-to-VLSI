
-- =========================================================
-- Testbench: Complete 8-bit Accumulator CPU
-- Set 4: LDI, ADD, STA, LDR, AND
-- =========================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_cpu is
end tb_cpu;

architecture Behavioral of tb_cpu is

    -- Signals connected to cpu_top
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '1';

    signal Z     : STD_LOGIC;
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);
    signal PC    : STD_LOGIC_VECTOR(3 downto 0);
    signal R_DBG : STD_LOGIC_VECTOR(7 downto 0);

    -- Clock period = 20 ns
    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instantiate the complete CPU
    uut: entity work.cpu_top
        port map (
            CLK   => CLK,
            RESET => RESET,
            Q     => Q,
            Z     => Z,
            PC    => PC,
            R_DBG => R_DBG
        );

    -- Generate a continuous clock
    CLK <= not CLK after CLK_PERIOD / 2;

    -- Apply reset and verify the ROM program
    stimulus: process
    begin

        -- RESET is active-high and synchronous.
        -- Keep RESET high across exactly one rising edge.
        RESET <= '1';
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"00" and Z = '1' and
               R_DBG = x"00" and PC = x"0"
            report "ERROR: Reset state is incorrect"
            severity error;

        -- Release reset between rising edges
        wait until falling_edge(CLK);
        RESET <= '0';

        -- Cycle 1: PC=0, LDI 0x1E
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"1E" and Z = '0' and
               R_DBG = x"00" and PC = x"1"
            report "ERROR: Cycle 1 - LDI 1E failed"
            severity error;

        -- Cycle 2: PC=1, STA
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"1E" and Z = '0' and
               R_DBG = x"1E" and PC = x"2"
            report "ERROR: Cycle 2 - STA failed"
            severity error;

        -- Cycle 3: PC=2, ADD 0x22
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"40" and Z = '0' and
               R_DBG = x"1E" and PC = x"3"
            report "ERROR: Cycle 3 - ADD 22 failed"
            severity error;

        -- Cycle 4: PC=3, AND 0x60
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"40" and Z = '0' and
               R_DBG = x"1E" and PC = x"4"
            report "ERROR: Cycle 4 - AND 60 failed"
            severity error;

        -- Cycle 5: PC=4, LDR
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"1E" and Z = '0' and
               R_DBG = x"1E" and PC = x"5"
            report "ERROR: Cycle 5 - LDR failed"
            severity error;

        -- Cycle 6: PC=5, ADD 0x01
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"1F" and Z = '0' and
               R_DBG = x"1E" and PC = x"6"
            report "ERROR: Cycle 6 - ADD 01 failed"
            severity error;

        -- Cycle 7: PC=6, AND 0x0F
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"0F" and Z = '0' and
               R_DBG = x"1E" and PC = x"7"
            report "ERROR: Cycle 7 - AND 0F failed"
            severity error;

        -- Cycle 8: PC=7, STA
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"0F" and Z = '0' and
               R_DBG = x"0F" and PC = x"8"
            report "ERROR: Cycle 8 - STA failed"
            severity error;

        -- Cycle 9: PC=8, LDI 0x00
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"00" and Z = '1' and
               R_DBG = x"0F" and PC = x"9"
            report "ERROR: Cycle 9 - LDI 00 failed"
            severity error;

        -- Cycle 10: PC=9, LDR
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"0F" and Z = '0' and
               R_DBG = x"0F" and PC = x"A"
            report "ERROR: Cycle 10 - LDR failed"
            severity error;

        report "PASS: All Set 4 CPU tests passed."
            severity note;

        -- Stop the testbench after the last instruction
        wait;
    end process;

end Behavioral;
