-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the input and output of the NOT gate
entity not_gate is

    Port (
        A : in  STD_LOGIC;   -- Input
        Y : out STD_LOGIC    -- NOT output
    );

end not_gate;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of not_gate is

begin

    -- NAND gate is used to create NOT gate
    -- When both NAND inputs are connected to A:
    -- Y = A NAND A = NOT A

    NAND1: entity work.nand_gate
        port map (
            A => A,
            B => A,
            Y => Y
        );

end Structural;
