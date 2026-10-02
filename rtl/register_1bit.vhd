library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--====================================================
-- Entity: 1-Bit Register
-- Stores 1 bit of data
--====================================================
entity register_1bit is
    Port (
        D   : in  STD_LOGIC;   -- 1-bit data input
        CLK : in  STD_LOGIC;   -- Clock input
        Q   : out STD_LOGIC;   -- Stored data output
        Q_n : out STD_LOGIC    -- Complement of stored data
    );
end register_1bit;


--====================================================
-- Architecture
-- Uses our previously created D Master-Slave Flip-Flop
--====================================================
architecture Structural of register_1bit is

    -- Previous D Master-Slave Flip-Flop
    component d_master_slave
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Q_n : out STD_LOGIC
        );
    end component;

begin

    --================================================
    -- 1-Bit Register
    -- The register stores D on the clock transition
    --================================================
    U1: d_master_slave
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Q_n => Q_n
        );

end Structural;
