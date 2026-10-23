
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registers is
    Port (
        CLK      : in  STD_LOGIC;
        RESET    : in  STD_LOGIC;

        ACC_WE   : in  STD_LOGIC;
        R_WE     : in  STD_LOGIC;
        Z_WE     : in  STD_LOGIC;

        ACC_NEXT : in  STD_LOGIC_VECTOR(7 downto 0);

        ACC_OUT  : out STD_LOGIC_VECTOR(7 downto 0);
        R_OUT    : out STD_LOGIC_VECTOR(7 downto 0);
        Z_OUT    : out STD_LOGIC
    );
end registers;

architecture Behavioral of registers is

    signal acc_reg : STD_LOGIC_VECTOR(7 downto 0)
                     := (others => '0');

    signal r_reg   : STD_LOGIC_VECTOR(7 downto 0)
                     := (others => '0');

    signal z_reg   : STD_LOGIC := '1';

begin

    process(CLK)
    begin
        if rising_edge(CLK) then

            if RESET = '1' then
                -- Synchronous reset
                acc_reg <= (others => '0');
                r_reg   <= (others => '0');
                z_reg   <= '1';

            else
                -- Update ACC only when enabled
                if ACC_WE = '1' then
                    acc_reg <= ACC_NEXT;
                end if;

                -- STA saves the current ACC into R
                if R_WE = '1' then
                    r_reg <= acc_reg;
                end if;

                -- Update Z from the new ACC value
                if Z_WE = '1' then
                    if ACC_NEXT = x"00" then
                        z_reg <= '1';
                    else
                        z_reg <= '0';
                    end if;
                end if;

            end if;
        end if;
    end process;

    ACC_OUT <= acc_reg;
    R_OUT   <= r_reg;
    Z_OUT   <= z_reg;

end Behavioral;
