-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the inputs and outputs of the SR Latch
entity sr_latch is

    Port (
        S   : in  STD_LOGIC;   -- Set input
        R   : in  STD_LOGIC;   -- Reset input
        Q   : out STD_LOGIC;   -- Main output
        Q_n : out STD_LOGIC    -- Complement output
    );

end sr_latch;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of sr_latch is

    -- Declare the NAND gate component
    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- Internal signals for cross-coupling
    signal q_int  : STD_LOGIC;
    signal qn_int : STD_LOGIC;

begin

    -- First NAND gate
    -- Q = S NAND Q_n
    NAND1: nand_gate
        port map (
            A => S,
            B => qn_int,
            Y => q_int
        );

    -- Second NAND gate
    -- Q_n = R NAND Q
    NAND2: nand_gate
        port map (
            A => R,
            B => q_int,
            Y => qn_int
        );

    -- Connect internal signals to the outputs
    Q   <= q_int;
    Q_n <= qn_int;

end Structural;
