-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the inputs and outputs of the D Flip-Flop
entity d_flip_flop is

    Port (
        D   : in  STD_LOGIC;   -- Data input
        CLK : in  STD_LOGIC;   -- Clock input
        Q   : out STD_LOGIC;   -- Main output
        Q_n : out STD_LOGIC    -- Complement output
    );

end d_flip_flop;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of d_flip_flop is

    -- Declare the previously created D Latch
    component d_latch
        Port (
            D      : in  STD_LOGIC;
            ENABLE : in  STD_LOGIC;
            Q      : out STD_LOGIC;
            Q_n    : out STD_LOGIC
        );
    end component;


    -- Declare the previously created NOT gate
    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    -- Internal signals
    signal CLK_n    : STD_LOGIC;   -- Inverted clock
    signal master_Q : STD_LOGIC;   -- Master latch output
    signal master_Qn : STD_LOGIC;  -- Master latch complement


begin

    -- NOT gate
    -- Creates the inverted clock
    -- CLK_n = NOT CLK
    U1: not_gate
        port map (
            A => CLK,
            Y => CLK_n
        );


    -- Master D Latch
    -- Master is enabled when CLK = 0
    U2: d_latch
        port map (
            D      => D,
            ENABLE => CLK_n,
            Q      => master_Q,
            Q_n    => master_Qn
        );


    -- Slave D Latch
    -- Slave is enabled when CLK = 1
    -- Slave receives the Master's stored value
    U3: d_latch
        port map (
            D      => master_Q,
            ENABLE => CLK,
            Q      => Q,
            Q_n    => Q_n
        );

end Structural;
