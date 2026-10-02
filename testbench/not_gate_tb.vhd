-- Import IEEE library
library IEEE;

-- Use STD_LOGIC data type
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench entity
-- Testbench has no input or output ports
entity not_gate_tb is
end not_gate_tb;


-- Testbench architecture
architecture Behavioral of not_gate_tb is

    -- Component declaration of NOT gate
    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    -- Signals used to connect to NOT gate
    signal A : STD_LOGIC := '0';
    signal Y : STD_LOGIC;


begin

    -- Instantiate the NOT gate
    UUT: not_gate
        port map (
            A => A,
            Y => Y
        );


    -- Test process
    process
    begin

        -- Test 1: A = 0
        -- Expected output: Y = 1
        A <= '0';
        wait for 100 ns;


        -- Test 2: A = 1
        -- Expected output: Y = 0
        A <= '1';
        wait for 100 ns;


        -- Stop simulation
        wait;

    end process;

end Behavioral;
