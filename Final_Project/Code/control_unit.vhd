
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port (
        OPCODE : in  STD_LOGIC_VECTOR(3 downto 0);

        ACC_WE : out STD_LOGIC;
        R_WE   : out STD_LOGIC;
        Z_WE   : out STD_LOGIC;

        ALU_SEL : out STD_LOGIC_VECTOR(1 downto 0);
        ACC_SRC : out STD_LOGIC_VECTOR(1 downto 0)
    );
end control_unit;

architecture Behavioral of control_unit is
begin

    process(OPCODE)
    begin
        -- Safe defaults: unsupported instructions act as NOP
        ACC_WE  <= '0';
        R_WE    <= '0';
        Z_WE    <= '0';
        ALU_SEL <= "00";
        ACC_SRC <= "00";

        case OPCODE is

            when "0001" =>
                -- LDI: load immediate into ACC
                ACC_WE  <= '1';
                Z_WE    <= '1';
                ACC_SRC <= "00";

            when "0010" =>
                -- ADD: ACC + immediate
                ACC_WE  <= '1';
                Z_WE    <= '1';
                ACC_SRC <= "01";
                ALU_SEL <= "00";

            when "1010" =>
                -- STA: copy ACC into R
                R_WE <= '1';

            when "1011" =>
                -- LDR: copy R into ACC
                ACC_WE  <= '1';
                Z_WE    <= '1';
                ACC_SRC <= "10";

            when "0100" =>
                -- AND: ACC AND immediate
                ACC_WE  <= '1';
                Z_WE    <= '1';
                ACC_SRC <= "01";
                ALU_SEL <= "01";

            when others =>
                null;

        end case;
    end process;

end Behavioral;
