library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_master_slave is
    Port (
        D   : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Q_n : out STD_LOGIC
    );
end d_master_slave;

architecture Structural of d_master_slave is

    -- Use our previously created D Latch
    component d_latch
        Port (
            D      : in  STD_LOGIC;
            ENABLE : in  STD_LOGIC;
            Q      : out STD_LOGIC;
            Q_n    : out STD_LOGIC
        );
    end component;

    -- Use our previously created NOT gate
    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- Internal signals
    signal CLK_n    : STD_LOGIC;
    signal MASTER_Q : STD_LOGIC;
    signal MASTER_Qn : STD_LOGIC;

begin

    --====================================================
    -- NOT gate
    -- Generate inverted clock: CLK_n = NOT CLK
    --====================================================
    U1: not_gate
        port map (
            A => CLK,
            Y => CLK_n
        );

    --====================================================
    -- MASTER D LATCH
    -- Master is enabled when CLK = 0
    -- Therefore ENABLE = CLK_n
    --====================================================
    U2: d_latch
        port map (
            D      => D,
            ENABLE => CLK_n,
            Q      => MASTER_Q,
            Q_n    => MASTER_Qn
        );

    --====================================================
    -- SLAVE D LATCH
    -- Slave is enabled when CLK = 1
    -- Therefore ENABLE = CLK
    --====================================================
    U3: d_latch
        port map (
            D      => MASTER_Q,
            ENABLE => CLK,
            Q      => Q,
            Q_n    => Q_n
        );

end Structural;
