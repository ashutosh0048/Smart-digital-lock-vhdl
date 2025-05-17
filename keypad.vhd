library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keypad is
    Port ( clk       : in  STD_LOGIC;
           row       : in  STD_LOGIC_VECTOR(3 downto 0);
           col       : out STD_LOGIC_VECTOR(3 downto 0);
           key_value : out STD_LOGIC_VECTOR(3 downto 0);
           key_valid : out STD_LOGIC);
end keypad;

architecture Behavioral of keypad is
    signal scan : integer range 0 to 3 := 0;
    signal key_map : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            col <= (others => '1');
            col(scan) <= '0';
            case scan is
                when 0 => key_map <= row;
                when 1 => key_map <= row;
                when 2 => key_map <= row;
                when 3 => key_map <= row;
                when others => null;
            end case;

            scan <= (scan + 1) mod 4;
        end if;
    end process;

    process(key_map)
    begin
        key_valid <= '0';
        case key_map is
            when "1110" => key_value <= "0001"; key_valid <= '1';
            when "1101" => key_value <= "0010"; key_valid <= '1';
            when "1011" => key_value <= "0011"; key_valid <= '1';
            when "0111" => key_value <= "0000"; key_valid <= '1';
            when others => key_value <= "1111"; key_valid <= '0';
        end case;
    end process;
end Behavioral;