-- ============================================================
-- 8-BIT ALU (Arithmetic Logic Unit)
-- Operations: ADD, AND, OR, XOR
-- ============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit is
    Port (
        A       : in  STD_LOGIC_VECTOR(7 downto 0);
        B       : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_SEL : in  STD_LOGIC_VECTOR(1 downto 0);

        RESULT  : out STD_LOGIC_VECTOR(7 downto 0);
        COUT    : out STD_LOGIC
    );
end alu_8bit;

architecture Structural of alu_8bit is

    -- Internal signals for each operation
    signal add_result : STD_LOGIC_VECTOR(7 downto 0);
    signal add_carry  : STD_LOGIC;

    signal and_result : STD_LOGIC_VECTOR(7 downto 0);
    signal or_result  : STD_LOGIC_VECTOR(7 downto 0);
    signal xor_result : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- ========================================================
    -- 1. ADD OPERATION
    -- Reuse the existing 8-bit Full Adder
    -- Cin = 0 because no initial carry is required
    -- ========================================================

    ADDER: entity work.full_adder_8bit
        port map (
            A    => A,
            B    => B,
            Cin  => '0',
            SUM  => add_result,
            Cout => add_carry
        );

    -- ========================================================
    -- 2. LOGIC GATES
    -- Apply AND, OR and XOR to all 8 bits
    -- ========================================================

    GEN_GATES: for i in 0 to 7 generate

        AND1: entity work.and_gate
            port map (
                A => A(i),
                B => B(i),
                Y => and_result(i)
            );

        OR1: entity work.or_gate
            port map (
                A => A(i),
                B => B(i),
                Y => or_result(i)
            );

        XOR1: entity work.xor_gate
            port map (
                A => A(i),
                B => B(i),
                Y => xor_result(i)
            );

    end generate GEN_GATES;

    -- ========================================================
    -- 3. OPERATION SELECTOR
    -- ALU_SEL = 00 : ADD
    -- ALU_SEL = 01 : AND
    -- ALU_SEL = 10 : OR
    -- ALU_SEL = 11 : XOR
    -- ========================================================

    process(ALU_SEL, add_result, add_carry,
            and_result, or_result, xor_result)
    begin

        -- Default outputs
        RESULT <= (others => '0');
        COUT   <= '0';

        case ALU_SEL is

            when "00" =>
                RESULT <= add_result;
                COUT   <= add_carry;

            when "01" =>
                RESULT <= and_result;

            when "10" =>
                RESULT <= or_result;

            when "11" =>
                RESULT <= xor_result;

            when others =>
                RESULT <= (others => '0');
                COUT   <= '0';

        end case;

    end process;

end Structural;
