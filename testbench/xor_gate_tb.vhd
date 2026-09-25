-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
-- Testbench has no input or output ports
entity xor_gate_tb is
end xor_gate_tb;


-- Testbench architecture
architecture Behavioral of xor_gate_tb is

    -- Component declaration of XOR gate
    component xor_gate
        Port (
            A : in  STD_LOGIC;   -- First input
            B : in  STD_LOGIC;   -- Second input
            Y : out STD_LOGIC    -- XOR output
        );
    end component;


    -- Signals used to connect the testbench
    -- to the XOR gate
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;


begin

    -- Instantiate the XOR gate
    -- UUT = Unit Under Test
    UUT: xor_gate
        port map (
            A => A,
            B => B,
            Y => Y
        );


    -- Test process
    process
    begin

        -- Test Case 1
        -- A = 0, B = 0
        -- Expected XOR output: Y = 0
        A <= '0';
        B <= '0';
        wait for 100 ns;


        -- Test Case 2
        -- A = 0, B = 1
        -- Expected XOR output: Y = 1
        A <= '0';
        B <= '1';
        wait for 100 ns;


        -- Test Case 3
        -- A = 1, B = 0
        -- Expected XOR output: Y = 1
        A <= '1';
        B <= '0';
        wait for 100 ns;


        -- Test Case 4
        -- A = 1, B = 1
        -- Expected XOR output: Y = 0
        A <= '1';
        B <= '1';
        wait for 100 ns;


        -- Stop the simulation
        -- Total simulation time = 400 ns
        wait;

    end process;

end Behavioral;
