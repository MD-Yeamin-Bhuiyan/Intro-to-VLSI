-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
entity xor_gate is

    Port (
        A : in  STD_LOGIC;   -- First input
        B : in  STD_LOGIC;   -- Second input
        Y : out STD_LOGIC    -- XOR output
    );

end xor_gate;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of xor_gate is

    -- Internal signals
    signal X1 : STD_LOGIC;   -- A OR B
    signal X2 : STD_LOGIC;   -- A AND B
    signal X3 : STD_LOGIC;   -- NOT(A AND B)

begin

    -- OR gate
    -- X1 = A OR B
    OR1: entity work.or_gate
        port map (
            A => A,
            B => B,
            Y => X1
        );


    -- AND gate
    -- X2 = A AND B
    AND1: entity work.and_gate
        port map (
            A => A,
            B => B,
            Y => X2
        );


    -- NAND gate used as NOT gate
    -- X3 = NOT(X2)
    NAND1: entity work.nand_gate
        port map (
            A => X2,
            B => X2,
            Y => X3
        );


    -- AND gate
    -- Y = X1 AND X3
    AND2: entity work.and_gate
        port map (
            A => X1,
            B => X3,
            Y => Y
        );

end Structural;
