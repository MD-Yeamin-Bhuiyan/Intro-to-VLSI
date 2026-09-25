-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type and logic operators
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the inputs and output of the NAND gate
entity nand_gate is

    Port (
        A : in  STD_LOGIC;   -- First input
        B : in  STD_LOGIC;   -- Second input
        Y : out STD_LOGIC    -- NAND output
    );

end nand_gate;


-- Architecture declaration
-- Dataflow modeling is used
architecture Dataflow of nand_gate is

begin

    -- NAND operation
    -- Y = NOT (A AND B)
    Y <= A NAND B;

end Dataflow;
