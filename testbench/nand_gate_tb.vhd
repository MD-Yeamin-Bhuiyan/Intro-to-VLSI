LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Testbench entity
ENTITY nand_gate_tb IS
END nand_gate_tb;

-- Testbench architecture
ARCHITECTURE behavior OF nand_gate_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT nand_gate
    PORT(
         A : IN std_logic;   -- First input
         B : IN std_logic;   -- Second input
         Y : OUT std_logic   -- NAND output
        );
    END COMPONENT;

    -- Input signals
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Output signal
    signal Y : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    -- Connect testbench signals to NAND gate ports
    uut: nand_gate PORT MAP (
          A => A,
          B => B,
          Y => Y
        );

    -- Stimulus process
    -- This process applies different input combinations
    process
    begin

        -- Test Case 1: A = 0, B = 0
        -- Expected output: Y = 1
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- Test Case 2: A = 0, B = 1
        -- Expected output: Y = 1
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test Case 3: A = 1, B = 0
        -- Expected output: Y = 1
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test Case 4: A = 1, B = 1
        -- Expected output: Y = 0
        A <= '1';
        B <= '1';
        wait for 100 ns;

        -- Stop the simulation
        wait;

    end process;

END behavior;
