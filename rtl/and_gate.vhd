-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the inputs and output of the AND gate
entity and_gate is

    Port (
        A : in  STD_LOGIC;   -- First input
        B : in  STD_LOGIC;   -- Second input
        Y : out STD_LOGIC    -- AND output
    );

end and_gate;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of and_gate is

    -- Internal signal
    signal X : STD_LOGIC;

begin

    -- NAND gate 1
    -- X = A NAND B
    NAND1: entity work.nand_gate
        port map (
            A => A,
            B => B,
            Y => X
        );

    -- NAND gate 2
    -- Y = X NAND X
    -- This inverts X and produces A AND B
    NAND2: entity work.nand_gate
        port map (
            A => X,
            B => X,
            Y => Y
        );

end Structural;
