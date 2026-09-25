-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
-- Testbench has no input or output ports
entity full_adder_tb is
end full_adder_tb;


-- Testbench architecture
architecture Behavioral of full_adder_tb is

    -- Component declaration of Full Adder
    component full_adder
        Port (
            A    : in  STD_LOGIC;   -- First input
            B    : in  STD_LOGIC;   -- Second input
            Cin  : in  STD_LOGIC;   -- Carry input

            SUM  : out STD_LOGIC;   -- Sum output
            Cout : out STD_LOGIC    -- Carry output
        );
    end component;


    -- Signals used to connect the testbench
    -- to the Full Adder
    signal A    : STD_LOGIC := '0';
    signal B    : STD_LOGIC := '0';
    signal Cin  : STD_LOGIC := '0';

    signal SUM  : STD_LOGIC;
    signal Cout : STD_LOGIC;


begin

    -- Instantiate the Full Adder
    -- UUT = Unit Under Test
    UUT: full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            SUM  => SUM,
            Cout => Cout
        );


    -- Test process
    process
    begin

        -- Test Case 1
        -- A=0, B=0, Cin=0
        -- Expected: SUM=0, Cout=0
        A   <= '0';
        B   <= '0';
        Cin <= '0';
        wait for 100 ns;


        -- Test Case 2
        -- A=0, B=0, Cin=1
        -- Expected: SUM=1, Cout=0
        A   <= '0';
        B   <= '0';
        Cin <= '1';
        wait for 100 ns;


        -- Test Case 3
        -- A=0, B=1, Cin=0
        -- Expected: SUM=1, Cout=0
        A   <= '0';
        B   <= '1';
        Cin <= '0';
        wait for 100 ns;


        -- Test Case 4
        -- A=0, B=1, Cin=1
        -- Expected: SUM=0, Cout=1
        A   <= '0';
        B   <= '1';
        Cin <= '1';
        wait for 100 ns;


        -- Test Case 5
        -- A=1, B=0, Cin=0
        -- Expected: SUM=1, Cout=0
        A   <= '1';
        B   <= '0';
        Cin <= '0';
        wait for 100 ns;


        -- Test Case 6
        -- A=1, B=0, Cin=1
        -- Expected: SUM=0, Cout=1
        A   <= '1';
        B   <= '0';
        Cin <= '1';
        wait for 100 ns;


        -- Test Case 7
        -- A=1, B=1, Cin=0
        -- Expected: SUM=0, Cout=1
        A   <= '1';
        B   <= '1';
        Cin <= '0';
        wait for 100 ns;


        -- Test Case 8
        -- A=1, B=1, Cin=1
        -- Expected: SUM=1, Cout=1
        A   <= '1';
        B   <= '1';
        Cin <= '1';
        wait for 100 ns;


        -- Stop the simulation
        -- Total simulation time = 800 ns
        wait;

    end process;

end Behavioral;
