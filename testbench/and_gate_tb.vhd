-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
-- Testbench has no input or output ports
entity and_gate_tb is
end and_gate_tb;


-- Testbench architecture
architecture Behavioral of and_gate_tb is

    -- Component declaration of AND gate
    component and_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- Signals used to connect to AND gate
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin

    -- Instantiate the AND gate
    UUT: and_gate
        port map (
            A => A,
            B => B,
            Y => Y
        );

    -- Test process
    process
    begin

        -- Test 1: A=0, B=0
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- Test 2: A=0, B=1
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test 3: A=1, B=0
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test 4: A=1, B=1
        A <= '1';
        B <= '1';
        wait for 100 ns;

        -- Stop simulation
        wait;

    end process;

end Behavioral;
