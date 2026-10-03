library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor_8bit is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        B : in  STD_LOGIC_VECTOR(7 downto 0);
        D : out STD_LOGIC_VECTOR(7 downto 0)
    );
end subtractor_8bit;

architecture Structural of subtractor_8bit is

    component full_subtractor
        Port (
            A    : in STD_LOGIC;
            B    : in STD_LOGIC;
            Bin  : in STD_LOGIC;
            D    : out STD_LOGIC;
            Bout : out STD_LOGIC
        );
    end component;

    signal B1 : STD_LOGIC;
    signal B2 : STD_LOGIC;
    signal B3 : STD_LOGIC;
    signal B4 : STD_LOGIC;
    signal B5 : STD_LOGIC;
    signal B6 : STD_LOGIC;
    signal B7 : STD_LOGIC;

begin

    FS0: full_subtractor
        port map (
            A    => A(0),
            B    => B(0),
            Bin  => '0',
            D    => D(0),
            Bout => B1
        );

    FS1: full_subtractor
        port map (
            A    => A(1),
            B    => B(1),
            Bin  => B1,
            D    => D(1),
            Bout => B2
        );

    FS2: full_subtractor
        port map (
            A    => A(2),
            B    => B(2),
            Bin  => B2,
            D    => D(2),
            Bout => B3
        );

    FS3: full_subtractor
        port map (
            A    => A(3),
            B    => B(3),
            Bin  => B3,
            D    => D(3),
            Bout => B4
        );

    FS4: full_subtractor
        port map (
            A    => A(4),
            B    => B(4),
            Bin  => B4,
            D    => D(4),
            Bout => B5
        );

    FS5: full_subtractor
        port map (
            A    => A(5),
            B    => B(5),
            Bin  => B5,
            D    => D(5),
            Bout => B6
        );

    FS6: full_subtractor
        port map (
            A    => A(6),
            B    => B(6),
            Bin  => B6,
            D    => D(6),
            Bout => B7
        );

    FS7: full_subtractor
        port map (
            A    => A(7),
            B    => B(7),
            Bin  => B7,
            D    => D(7),
            Bout => open
        );

end Structural;
