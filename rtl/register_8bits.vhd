library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--====================================================
-- Entity: 8-Bit Register
-- Stores 8 bits of data
--====================================================
entity register_8bit is
    Port (
        D   : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input
        CLK : in  STD_LOGIC;                     -- Clock
        Q   : out STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit output
        Q_n : out STD_LOGIC_VECTOR(7 downto 0)   -- Complement output
    );
end register_8bit;


--====================================================
-- Structural Architecture
-- Uses eight previously created 1-bit registers
--====================================================
architecture Structural of register_8bit is

    --================================================
    -- Component declaration
    -- Our previously created 1-bit register
    --================================================
    component register_1bit
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Q_n : out STD_LOGIC
        );
    end component;

begin

    --================================================
    -- Bit 0
    --================================================
    REG0: register_1bit
        port map (
            D   => D(0),
            CLK => CLK,
            Q   => Q(0),
            Q_n => Q_n(0)
        );

    --================================================
    -- Bit 1
    --================================================
    REG1: register_1bit
        port map (
            D   => D(1),
            CLK => CLK,
            Q   => Q(1),
            Q_n => Q_n(1)
        );

    --================================================
    -- Bit 2
    --================================================
    REG2: register_1bit
        port map (
            D   => D(2),
            CLK => CLK,
            Q   => Q(2),
            Q_n => Q_n(2)
        );

    --================================================
    -- Bit 3
    --================================================
    REG3: register_1bit
        port map (
            D   => D(3),
            CLK => CLK,
            Q   => Q(3),
            Q_n => Q_n(3)
        );

    --================================================
    -- Bit 4
    --================================================
    REG4: register_1bit
        port map (
            D   => D(4),
            CLK => CLK,
            Q   => Q(4),
            Q_n => Q_n(4)
        );

    --================================================
    -- Bit 5
    --================================================
    REG5: register_1bit
        port map (
            D   => D(5),
            CLK => CLK,
            Q   => Q(5),
            Q_n => Q_n(5)
        );

    --================================================
    -- Bit 6
    --================================================
    REG6: register_1bit
        port map (
            D   => D(6),
            CLK => CLK,
            Q   => Q(6),
            Q_n => Q_n(6)
        );

    --================================================
    -- Bit 7
    --================================================
    REG7: register_1bit
        port map (
            D   => D(7),
            CLK => CLK,
            Q   => Q(7),
            Q_n => Q_n(7)
        );

end Structural;
