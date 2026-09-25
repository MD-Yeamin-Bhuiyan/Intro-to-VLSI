-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the inputs and output of the OR gate
entity or_gate is

    Port (
        A : in  STD_LOGIC;   -- First input
        B : in  STD_LOGIC;   -- Second input
        Y : out STD_LOGIC    -- OR output
    );

end or_gate;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of or_gate is

    -- Internal signals
    signal X1 : STD_LOGIC;
    signal X2 : STD_LOGIC;

begin

    -- NAND gate 1
    -- X1 = NOT A
    NAND1: entity work.nand_gate
        port map (
            A => A,
            B => A,
            Y => X1
        );

    -- NAND gate 2
    -- X2 = NOT B
    NAND2: entity work.nand_gate
        port map (
            A => B,
            B => B,
            Y => X2
        );

    -- NAND gate 3
    -- Y = NOT(X1 AND X2)
    -- Therefore, Y = A OR B
    NAND3: entity work.nand_gate
        port map (
            A => X1,
            B => X2,
            Y => Y
        );

end Structural;
