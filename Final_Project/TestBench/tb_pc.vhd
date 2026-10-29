library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pc is
end tb_pc;

architecture Behavioral of tb_pc is

    signal CLK    : STD_LOGIC := '0';
    signal RESET  : STD_LOGIC := '1';
    signal PC_OUT : STD_LOGIC_VECTOR(3 downto 0);

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instantiate the Program Counter
    uut : entity work.pc
        port map (
            CLK    => CLK,
            RESET  => RESET,
            PC_OUT => PC_OUT
        );

    -- Generate a 20 ns clock
    CLK <= not CLK after CLK_PERIOD / 2;

    stimulus : process
    begin
        -- Test synchronous reset
        RESET <= '1';
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert PC_OUT = x"0"
            report "ERROR: PC reset failed"
            severity error;

        -- Release reset
        wait until falling_edge(CLK);
        RESET <= '0';

        -- Test PC increment: 0 -> 1
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert PC_OUT = x"1"
            report "ERROR: PC did not increment to 1"
            severity error;

        -- Test PC increment: 1 -> 2
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert PC_OUT = x"2"
            report "ERROR: PC did not increment to 2"
            severity error;

        -- Test PC increment: 2 -> 3
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert PC_OUT = x"3"
            report "ERROR: PC did not increment to 3"
            severity error;

        -- Test PC increment: 3 -> 4
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert PC_OUT = x"4"
            report "ERROR: PC did not increment to 4"
            severity error;

        report "PASS: Program Counter tests passed."
            severity note;

        wait;
    end process;

end Behavioral;
