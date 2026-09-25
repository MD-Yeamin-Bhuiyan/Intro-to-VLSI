-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
-- Defines the inputs and outputs of the Full Adder
entity full_adder is

    Port (
        A    : in  STD_LOGIC;   -- First input
        B    : in  STD_LOGIC;   -- Second input
        Cin  : in  STD_LOGIC;   -- Carry input

        SUM  : out STD_LOGIC;   -- Sum output
        Cout : out STD_LOGIC    -- Carry output
    );

end full_adder;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of full_adder is

    -- Internal signals
    signal X1 : STD_LOGIC;   -- A XOR B
    signal X2 : STD_LOGIC;   -- X1 XOR Cin
    signal X3 : STD_LOGIC;   -- A AND B
    signal X4 : STD_LOGIC;   -- X1 AND Cin

begin

    -- XOR Gate 1
    -- X1 = A XOR B
    XOR1: entity work.xor_gate
        port map (
            A => A,
            B => B,
            Y => X1
        );


    -- XOR Gate 2
    -- X2 = X1 XOR Cin
    -- Therefore, X2 = A XOR B XOR Cin
    XOR2: entity work.xor_gate
        port map (
            A => X1,
            B => Cin,
            Y => X2
        );


    -- Connect X2 to SUM
    -- SUM = A XOR B XOR Cin
    SUM <= X2;


    -- AND Gate 1
    -- X3 = A AND B
    AND1: entity work.and_gate
        port map (
            A => A,
            B => B,
            Y => X3
        );


    -- AND Gate 2
    -- X4 = X1 AND Cin
    -- X4 = (A XOR B) AND Cin
    AND2: entity work.and_gate
        port map (
            A => X1,
            B => Cin,
            Y => X4
        );


    -- OR Gate
    -- Cout = X3 OR X4
    -- Cout = (A AND B) OR ((A XOR B) AND Cin)
    OR1: entity work.or_gate
        port map (
            A => X3,
            B => X4,
            Y => Cout
        );

end Structural;
