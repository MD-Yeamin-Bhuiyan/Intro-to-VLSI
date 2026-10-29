library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_program_rom is
end tb_program_rom;

architecture Behavioral of tb_program_rom is

    signal ADDR  : STD_LOGIC_VECTOR(3 downto 0) := x"0";
    signal INSTR : STD_LOGIC_VECTOR(11 downto 0);

begin

    -- Instantiate the Program ROM
    uut : entity work.program_rom
        port map (
            ADDR  => ADDR,
            INSTR => INSTR
        );

    stimulus : process
    begin
        ADDR <= x"0";
        wait for 1 ns;
        assert INSTR = x"11E"
            report "ERROR: ROM address 0"
            severity error;

        ADDR <= x"1";
        wait for 1 ns;
        assert INSTR = x"A00"
            report "ERROR: ROM address 1"
            severity error;

        ADDR <= x"2";
        wait for 1 ns;
        assert INSTR = x"222"
            report "ERROR: ROM address 2"
            severity error;

        ADDR <= x"3";
        wait for 1 ns;
        assert INSTR = x"460"
            report "ERROR: ROM address 3"
            severity error;

        ADDR <= x"4";
        wait for 1 ns;
        assert INSTR = x"B00"
            report "ERROR: ROM address 4"
            severity error;

        ADDR <= x"5";
        wait for 1 ns;
        assert INSTR = x"201"
            report "ERROR: ROM address 5"
            severity error;

        ADDR <= x"6";
        wait for 1 ns;
        assert INSTR = x"40F"
            report "ERROR: ROM address 6"
            severity error;

        ADDR <= x"7";
        wait for 1 ns;
        assert INSTR = x"A00"
            report "ERROR: ROM address 7"
            severity error;

        ADDR <= x"8";
        wait for 1 ns;
        assert INSTR = x"100"
            report "ERROR: ROM address 8"
            severity error;

        ADDR <= x"9";
        wait for 1 ns;
        assert INSTR = x"B00"
            report "ERROR: ROM address 9"
            severity error;

        -- Check unused ROM address
        ADDR <= x"A";
        wait for 1 ns;
        assert INSTR = x"000"
            report "ERROR: Unused ROM address should return 000"
            severity error;

        report "PASS: Program ROM tests passed."
            severity note;

        wait;
    end process;

end Behavioral;
