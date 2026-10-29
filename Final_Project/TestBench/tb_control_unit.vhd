library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control_unit is
end tb_control_unit;

architecture Behavioral of tb_control_unit is

    signal OPCODE  : STD_LOGIC_VECTOR(3 downto 0) := "0000";

    signal ACC_WE  : STD_LOGIC;
    signal R_WE    : STD_LOGIC;
    signal Z_WE    : STD_LOGIC;

    signal ALU_SEL : STD_LOGIC_VECTOR(1 downto 0);
    signal ACC_SRC : STD_LOGIC_VECTOR(1 downto 0);

begin

    -- Instantiate the Control Unit
    uut : entity work.control_unit
        port map (
            OPCODE  => OPCODE,
            ACC_WE  => ACC_WE,
            R_WE    => R_WE,
            Z_WE    => Z_WE,
            ALU_SEL => ALU_SEL,
            ACC_SRC => ACC_SRC
        );

    stimulus : process
    begin
        -- LDI: opcode 0001
        OPCODE <= "0001";
        wait for 1 ns;

        assert ACC_WE = '1' and R_WE = '0' and
               Z_WE = '1' and ACC_SRC = "00"
            report "ERROR: LDI control signals"
            severity error;

        -- ADD: opcode 0010
        OPCODE <= "0010";
        wait for 1 ns;

        assert ACC_WE = '1' and R_WE = '0' and
               Z_WE = '1' and ALU_SEL = "00" and
               ACC_SRC = "01"
            report "ERROR: ADD control signals"
            severity error;

        -- STA: opcode 1010
        OPCODE <= "1010";
        wait for 1 ns;

        assert ACC_WE = '0' and R_WE = '1' and
               Z_WE = '0'
            report "ERROR: STA control signals"
            severity error;

        -- LDR: opcode 1011
        OPCODE <= "1011";
        wait for 1 ns;

        assert ACC_WE = '1' and R_WE = '0' and
               Z_WE = '1' and ACC_SRC = "10"
            report "ERROR: LDR control signals"
            severity error;

        -- AND: opcode 0100
        OPCODE <= "0100";
        wait for 1 ns;

        assert ACC_WE = '1' and R_WE = '0' and
               Z_WE = '1' and ALU_SEL = "01" and
               ACC_SRC = "01"
            report "ERROR: AND control signals"
            severity error;

        -- Unsupported opcode: safe defaults
        OPCODE <= "1111";
        wait for 1 ns;

        assert ACC_WE = '0' and R_WE = '0' and
               Z_WE = '0' and ALU_SEL = "00" and
               ACC_SRC = "00"
            report "ERROR: Default control signals"
            severity error;

        report "PASS: Control Unit tests passed."
            severity note;

        wait;
    end process;

end Behavioral;
