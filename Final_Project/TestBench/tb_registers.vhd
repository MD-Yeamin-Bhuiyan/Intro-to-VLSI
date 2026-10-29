library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_registers is
end tb_registers;

architecture Behavioral of tb_registers is

    signal CLK      : STD_LOGIC := '0';
    signal RESET    : STD_LOGIC := '1';

    signal ACC_WE   : STD_LOGIC := '0';
    signal R_WE     : STD_LOGIC := '0';
    signal Z_WE     : STD_LOGIC := '0';

    signal ACC_NEXT : STD_LOGIC_VECTOR(7 downto 0) := x"00";

    signal ACC_OUT  : STD_LOGIC_VECTOR(7 downto 0);
    signal R_OUT    : STD_LOGIC_VECTOR(7 downto 0);
    signal Z_OUT    : STD_LOGIC;

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instantiate the register module
    uut : entity work.registers
        port map (
            CLK      => CLK,
            RESET    => RESET,
            ACC_WE   => ACC_WE,
            R_WE     => R_WE,
            Z_WE     => Z_WE,
            ACC_NEXT => ACC_NEXT,
            ACC_OUT  => ACC_OUT,
            R_OUT    => R_OUT,
            Z_OUT    => Z_OUT
        );

    -- Generate clock
    CLK <= not CLK after CLK_PERIOD / 2;

    stimulus : process
    begin
        -- Test 1: Reset all registers
        RESET <= '1';

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert ACC_OUT = x"00" and
               R_OUT = x"00" and
               Z_OUT = '1'
            report "ERROR: Register reset failed"
            severity error;

        -- Release reset
        wait until falling_edge(CLK);
        RESET <= '0';

        -- Test 2: Load 1E into ACC
        ACC_NEXT <= x"1E";
        ACC_WE   <= '1';
        Z_WE     <= '1';

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert ACC_OUT = x"1E" and Z_OUT = '0'
            report "ERROR: ACC load failed"
            severity error;

        -- Test 3: Store ACC into R
        ACC_WE <= '0';
        Z_WE   <= '0';
        R_WE   <= '1';

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert R_OUT = x"1E"
            report "ERROR: R register store failed"
            severity error;

        -- Test 4: Load zero into ACC
        R_WE     <= '0';
        ACC_WE   <= '1';
        Z_WE     <= '1';
        ACC_NEXT <= x"00";

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert ACC_OUT = x"00" and Z_OUT = '1'
            report "ERROR: Zero detection failed"
            severity error;

        -- Test 5: Restore the stored value into ACC
        ACC_NEXT <= R_OUT;
        ACC_WE   <= '1';
        Z_WE     <= '1';

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert ACC_OUT = x"1E" and
               R_OUT = x"1E" and
               Z_OUT = '0'
            report "ERROR: Register restore failed"
            severity error;

        -- Test 6: Disable writes and verify ACC holds its value
        ACC_WE <= '0';
        Z_WE   <= '0';
        ACC_NEXT <= x"55";

        wait until rising_edge(CLK);
        wait for 1 ns;

        assert ACC_OUT = x"1E"
            report "ERROR: ACC changed when write enable was disabled"
            severity error;

        report "PASS: Register tests passed."
            severity note;

        wait;
    end process;

end Behavioral;
