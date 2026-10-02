-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the inputs and outputs of the SR flip-flop
entity sr_flip_flop is
    Port (
        S   : in  STD_LOGIC;   -- Set input
        R   : in  STD_LOGIC;   -- Reset input
        CLK : in  STD_LOGIC;   -- Clock input
        Q   : out STD_LOGIC;   -- Main output
        Q_n : out STD_LOGIC    -- Complement output
    );
end sr_flip_flop;


-- Structural architecture
-- The SR flip-flop is built using:
-- 1. Two SR latches
-- 2. NAND gates
-- 3. One NOT gate
architecture Structural of sr_flip_flop is


    -- Previously created NAND gate
    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    -- Previously created NOT gate
    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    -- Previously created SR latch
    component sr_latch
        Port (
            S   : in  STD_LOGIC;
            R   : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Q_n : out STD_LOGIC
        );
    end component;


    -- Inverted clock
    signal CLK_n : STD_LOGIC;


    -- Master latch inputs
    signal MASTER_S : STD_LOGIC;
    signal MASTER_R : STD_LOGIC;


    -- Master latch outputs
    signal MASTER_Q   : STD_LOGIC;
    signal MASTER_Q_n : STD_LOGIC;


    -- Slave latch inputs
    signal SLAVE_S : STD_LOGIC;
    signal SLAVE_R : STD_LOGIC;

begin


    ----------------------------------------------------------------
    -- Invert the clock
    --
    -- CLK = 0 -> CLK_n = 1
    -- CLK = 1 -> CLK_n = 0
    ----------------------------------------------------------------
    U1: not_gate
        port map (
            A => CLK,
            Y => CLK_n
        );


    ----------------------------------------------------------------
    -- MASTER INPUT LOGIC
    --
    -- The master latch is enabled when CLK = 0.
    --
    -- Because the SR latch uses active-low S and R inputs,
    -- NAND gates are used to generate the active-low signals.
    ----------------------------------------------------------------

    U2: nand_gate
        port map (
            A => S,
            B => CLK_n,
            Y => MASTER_S
        );


    U3: nand_gate
        port map (
            A => R,
            B => CLK_n,
            Y => MASTER_R
        );


    ----------------------------------------------------------------
    -- MASTER SR LATCH
    --
    -- The master stores S and R while CLK = 0.
    ----------------------------------------------------------------

    U4: sr_latch
        port map (
            S   => MASTER_S,
            R   => MASTER_R,
            Q   => MASTER_Q,
            Q_n => MASTER_Q_n
        );


    ----------------------------------------------------------------
    -- SLAVE INPUT LOGIC
    --
    -- The slave becomes active when CLK = 1.
    -- It receives the value stored by the master.
    ----------------------------------------------------------------

    U5: nand_gate
        port map (
            A => MASTER_Q,
            B => CLK,
            Y => SLAVE_S
        );


    U6: nand_gate
        port map (
            A => MASTER_Q_n,
            B => CLK,
            Y => SLAVE_R
        );


    ----------------------------------------------------------------
    -- SLAVE SR LATCH
    --
    -- The slave transfers the master's stored value to Q.
    ----------------------------------------------------------------

    U7: sr_latch
        port map (
            S   => SLAVE_S,
            R   => SLAVE_R,
            Q   => Q,
            Q_n => Q_n
        );


end Structural;
