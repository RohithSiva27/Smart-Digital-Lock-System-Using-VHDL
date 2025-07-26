library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity smart_lock is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        pass_in : in  STD_LOGIC_VECTOR(3 downto 0);
        unlock  : out STD_LOGIC
    );
end smart_lock;

architecture Behavioral of smart_lock is
    constant correct_pass : STD_LOGIC_VECTOR(3 downto 0) := "1111";
begin
    process(clk, reset)
    begin
        if reset = '1' then
            unlock <= '0';
        elsif rising_edge(clk) then
            if pass_in = correct_pass then
                unlock <= '1';
            else
                unlock <= '0';
            end if;
        end if;
    end process;
end Behavioral;
