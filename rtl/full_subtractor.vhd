library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_subtractor is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Bin  : in  STD_LOGIC;
        D    : out STD_LOGIC;
        Bout : out STD_LOGIC
    );
end full_subtractor;

architecture Structural of full_subtractor is

    component xor_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component and_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component not_gate
        Port (
            A : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component or_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal X1 : STD_LOGIC;
    signal X2 : STD_LOGIC;
    signal X3 : STD_LOGIC;
    signal X4 : STD_LOGIC;
    signal X5 : STD_LOGIC;

begin

    -- Difference
    U1: xor_gate
        port map (
            A => A,
            B => B,
            Y => X1
        );

    U2: xor_gate
        port map (
            A => X1,
            B => Bin,
            Y => D
        );

    -- Borrow
    U3: not_gate
        port map (
            A => A,
            Y => X2
        );

    U4: and_gate
        port map (
            A => X2,
            B => B,
            Y => X3
        );

    U5: not_gate
        port map (
            A => X1,
            Y => X4
        );

    U6: and_gate
        port map (
            A => X4,
            B => Bin,
            Y => X5
        );

    U7: or_gate
        port map (
            A => X3,
            B => X5,
            Y => Bout
        );

end Structural;
