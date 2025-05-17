library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lock_control is
    Port ( clk         : in  STD_LOGIC;
           reset       : in  STD_LOGIC;
           key_value   : in  STD_LOGIC_VECTOR(3 downto 0);
           key_valid   : in  STD_LOGIC;
           seg_out     : out STD_LOGIC_VECTOR(6 downto 0);
           lock_status : out STD_LOGIC_VECTOR(1 downto 0));
end lock_control;

architecture Behavioral of lock_control is
    signal password     : STD_LOGIC_VECTOR(15 downto 0) := "0001001000110100";
    signal input_buffer : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal digit_count  : integer range 0 to 4 := 0;
    signal attempts     : integer range 0 to 3 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            input_buffer <= (others => '0');
            digit_count <= 0;
            attempts <= 0;
            lock_status <= "00";
        elsif rising_edge(clk) then
            if key_valid = '1' then
                input_buffer(15 downto 4) <= input_buffer(11 downto 0);
                input_buffer(3 downto 0) <= key_value;
                digit_count <= digit_count + 1;

                if digit_count = 3 then
                    if input_buffer = password then
                        lock_status <= "01";
                    else
                        attempts <= attempts + 1;
                        if attempts = 2 then
                            lock_status <= "10";
                        else
                            lock_status <= "00";
                        end if;
                    end if;
                    digit_count <= 0;
                end if;
            end if;
        end if;
    end process;

    process(input_buffer)
    begin
        case input_buffer(3 downto 0) is
            when others =>
                seg_out <= "1111111";
        end case;
    end process;
end Behavioral;