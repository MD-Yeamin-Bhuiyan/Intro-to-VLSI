-- ============================================================
-- TESTBENCH FOR 8-BIT ALU
-- ============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu_8bit is
end tb_alu_8bit;

architecture Behavioral of tb_alu_8bit is

    -- Input signals
    signal A       : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal B       : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal ALU_SEL : STD_LOGIC_VECTOR(1 downto 0) := "00";

    -- Output signals
    signal RESULT  : STD_LOGIC_VECTOR(7 downto 0);
    signal COUT    : STD_LOGIC;

begin

    -- Connect the ALU to the testbench
    UUT: entity work.alu_8bit
        port map (
            A       => A,
            B       => B,
            ALU_SEL => ALU_SEL,
            RESULT  => RESULT,
            COUT    => COUT
        );

    -- Apply test inputs
    stimulus: process
    begin

        -- TEST 1: ADD
        -- 1E + 22 = 40
        A <= x"1E";
        B <= x"22";
        ALU_SEL <= "00";
        wait for 20 ns;

        assert RESULT = x"40" and COUT = '0'
            report "ADD test FAILED"
            severity error;

        -- TEST 2: AND
        -- 40 AND 60 = 40
        A <= x"40";
        B <= x"60";
        ALU_SEL <= "01";
        wait for 20 ns;

        assert RESULT = x"40" and COUT = '0'
            report "AND test FAILED"
            severity error;

        -- TEST 3: OR
        -- 40 OR 60 = 60
        A <= x"40";
        B <= x"60";
        ALU_SEL <= "10";
        wait for 20 ns;

        assert RESULT = x"60" and COUT = '0'
            report "OR test FAILED"
            severity error;

        -- TEST 4: XOR
        -- 40 XOR 60 = 20
        A <= x"40";
        B <= x"60";
        ALU_SEL <= "11";
        wait for 20 ns;

        assert RESULT = x"20" and COUT = '0'
            report "XOR test FAILED"
            severity error;

        -- TEST 5: ADD WITH CARRY
        -- FF + 01 = 100
        -- 8-bit RESULT = 00, COUT = 1
        A <= x"FF";
        B <= x"01";
        ALU_SEL <= "00";
        wait for 20 ns;

        assert RESULT = x"00" and COUT = '1'
            report "Carry test FAILED"
            severity error;

        report "ALL ALU TESTS PASSED"
            severity note;

        wait;
    end process;

end Behavioral;
