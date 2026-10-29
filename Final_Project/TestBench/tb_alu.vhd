library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu is
end tb_alu;

architecture Behavioral of tb_alu is

    signal ACC_IN  : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal OPERAND : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal ALU_SEL : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal ALU_OUT : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Instantiate the ALU
    uut : entity work.alu
        port map (
            ACC_IN  => ACC_IN,
            OPERAND => OPERAND,
            ALU_SEL => ALU_SEL,
            ALU_OUT => ALU_OUT
        );

    stimulus : process
    begin
        -- Test 1: 1E + 22 = 40
        ACC_IN  <= x"1E";
        OPERAND <= x"22";
        ALU_SEL <= "00";
        wait for 1 ns;

        assert ALU_OUT = x"40"
            report "ERROR: Addition 1E + 22"
            severity error;

        -- Test 2: 1F + 01 = 20
        ACC_IN  <= x"1F";
        OPERAND <= x"01";
        ALU_SEL <= "00";
        wait for 1 ns;

        assert ALU_OUT = x"20"
            report "ERROR: Addition 1F + 01"
            severity error;

        -- Test 3: FF + 01 = 00 (8-bit overflow)
        ACC_IN  <= x"FF";
        OPERAND <= x"01";
        ALU_SEL <= "00";
        wait for 1 ns;

        assert ALU_OUT = x"00"
            report "ERROR: 8-bit addition overflow"
            severity error;

        -- Test 4: 40 AND 60 = 40
        ACC_IN  <= x"40";
        OPERAND <= x"60";
        ALU_SEL <= "01";
        wait for 1 ns;

        assert ALU_OUT = x"40"
            report "ERROR: AND 40 with 60"
            severity error;

        -- Test 5: 1F AND 0F = 0F
        ACC_IN  <= x"1F";
        OPERAND <= x"0F";
        ALU_SEL <= "01";
        wait for 1 ns;

        assert ALU_OUT = x"0F"
            report "ERROR: AND 1F with 0F"
            severity error;

        -- Test 6: AND with zero
        ACC_IN  <= x"AB";
        OPERAND <= x"00";
        ALU_SEL <= "01";
        wait for 1 ns;

        assert ALU_OUT = x"00"
            report "ERROR: AND with zero"
            severity error;

        -- Test 7: Unsupported ALU selection
        ACC_IN  <= x"12";
        OPERAND <= x"34";
        ALU_SEL <= "10";
        wait for 1 ns;

        assert ALU_OUT = x"00"
            report "ERROR: Unsupported ALU selection"
            severity error;

        report "PASS: ALU tests passed."
            severity note;

        wait;
    end process;

end Behavioral;
