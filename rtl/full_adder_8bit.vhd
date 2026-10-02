-- ============================================================
-- 8-BIT FULL ADDER
-- ============================================================
-- We already created a 1-bit Full Adder.
--
-- Now we reuse that 1-bit Full Adder 8 times to create
-- an 8-bit Full Adder.
--
-- Each Full Adder adds one bit of A and B.
-- The carry output of one Full Adder is connected to
-- the carry input of the next Full Adder.
--
-- Process:
--
-- A0 + B0 + Cin → FA0 → SUM0 + C1
-- A1 + B1 + C1  → FA1 → SUM1 + C2
-- A2 + B2 + C2  → FA2 → SUM2 + C3
-- ...
-- A7 + B7 + C7  → FA7 → SUM7 + Cout
--
-- Therefore:
-- 8-bit Full Adder = 8 × 1-bit Full Adder
--
-- This is called a Ripple Carry Adder because
-- the carry moves from one Full Adder to the next.
-- ============================================================


-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data types
use IEEE.STD_LOGIC_1164.ALL;


-- Entity declaration
entity full_adder_8bit is

    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input A
        B    : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input B
        Cin  : in  STD_LOGIC;                     -- Initial carry

        SUM  : out STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit result
        Cout : out STD_LOGIC                       -- Final carry
    );

end full_adder_8bit;


-- Architecture declaration
-- Structural modeling is used
architecture Structural of full_adder_8bit is

    -- Internal carry signals
    -- These connect the 8 Full Adders together
    signal C1 : STD_LOGIC;
    signal C2 : STD_LOGIC;
    signal C3 : STD_LOGIC;
    signal C4 : STD_LOGIC;
    signal C5 : STD_LOGIC;
    signal C6 : STD_LOGIC;
    signal C7 : STD_LOGIC;

begin

    -- Full Adder 0
    -- A(0) + B(0) + Cin
    -- Output: SUM(0), carry C1
    FA0: entity work.full_adder
        port map (
            A    => A(0),
            B    => B(0),
            Cin  => Cin,
            SUM  => SUM(0),
            Cout => C1
        );


    -- Full Adder 1
    -- A(1) + B(1) + C1
    FA1: entity work.full_adder
        port map (
            A    => A(1),
            B    => B(1),
            Cin  => C1,
            SUM  => SUM(1),
            Cout => C2
        );


    -- Full Adder 2
    -- A(2) + B(2) + C2
    FA2: entity work.full_adder
        port map (
            A    => A(2),
            B    => B(2),
            Cin  => C2,
            SUM  => SUM(2),
            Cout => C3
        );


    -- Full Adder 3
    -- A(3) + B(3) + C3
    FA3: entity work.full_adder
        port map (
            A    => A(3),
            B    => B(3),
            Cin  => C3,
            SUM  => SUM(3),
            Cout => C4
        );


    -- Full Adder 4
    -- A(4) + B(4) + C4
    FA4: entity work.full_adder
        port map (
            A    => A(4),
            B    => B(4),
            Cin  => C4,
            SUM  => SUM(4),
            Cout => C5
        );


    -- Full Adder 5
    -- A(5) + B(5) + C5
    FA5: entity work.full_adder
        port map (
            A    => A(5),
            B    => B(5),
            Cin  => C5,
            SUM  => SUM(5),
            Cout => C6
        );


    -- Full Adder 6
    -- A(6) + B(6) + C6
    FA6: entity work.full_adder
        port map (
            A    => A(6),
            B    => B(6),
            Cin  => C6,
            SUM  => SUM(6),
            Cout => C7
        );


    -- Full Adder 7
    -- A(7) + B(7) + C7
    -- Final carry becomes Cout
    FA7: entity work.full_adder
        port map (
            A    => A(7),
            B    => B(7),
            Cin  => C7,
            SUM  => SUM(7),
            Cout => Cout
        );

end Structural;
