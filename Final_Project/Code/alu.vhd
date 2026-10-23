
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (
        ACC_IN   : in  STD_LOGIC_VECTOR(7 downto 0);
        OPERAND  : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_OUT  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end alu;

architecture Behavioral of alu is
begin

    process(ACC_IN, OPERAND, ALU_SEL)
    begin
        case ALU_SEL is

            when "00" =>
                -- ADD: keep only the lower 8 bits
                ALU_OUT <= std_logic_vector(
                    unsigned(ACC_IN) + unsigned(OPERAND)
                );

            when "01" =>
                -- Bitwise AND
                ALU_OUT <= ACC_IN and OPERAND;

            when others =>
                ALU_OUT <= (others => '0');

        end case;
    end process;

end Behavioral;
