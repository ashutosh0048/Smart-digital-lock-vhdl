library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( clk       : in  STD_LOGIC;
           reset     : in  STD_LOGIC;
           row       : in  STD_LOGIC_VECTOR(3 downto 0);
           col       : out STD_LOGIC_VECTOR(3 downto 0);
           seg       : out STD_LOGIC_VECTOR(6 downto 0);
           lock_led  : out STD_LOGIC_VECTOR(1 downto 0));
end top_module;

architecture Structural of top_module is
    signal key_val   : STD_LOGIC_VECTOR(3 downto 0);
    signal key_valid : STD_LOGIC;
begin
    U1: entity work.keypad
        port map(clk => clk, row => row, col => col, key_value => key_val, key_valid => key_valid);

    U2: entity work.lock_control
        port map(clk => clk, reset => reset, key_value => key_val, key_valid => key_valid,
                 seg_out => seg, lock_status => lock_led);
end Structural;