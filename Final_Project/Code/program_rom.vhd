
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_rom is
    Port (
        ADDR  : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTR : out STD_LOGIC_VECTOR(11 downto 0)
    );
end program_rom;

architecture Behavioral of program_rom is
begin

    process(ADDR)
    begin
        case ADDR is
            when "0000" => INSTR <= x"11E"; -- LDI 0x1E
            when "0001" => INSTR <= x"A00"; -- STA
            when "0010" => INSTR <= x"222"; -- ADD 0x22
            when "0011" => INSTR <= x"460"; -- AND 0x60
            when "0100" => INSTR <= x"B00"; -- LDR
            when "0101" => INSTR <= x"201"; -- ADD 0x01
            when "0110" => INSTR <= x"40F"; -- AND 0x0F
            when "0111" => INSTR <= x"A00"; -- STA
            when "1000" => INSTR <= x"100"; -- LDI 0x00
            when "1001" => INSTR <= x"B00"; -- LDR

            when others => INSTR <= x"000"; -- NOP
        end case;
    end process;

end Behavioral;
