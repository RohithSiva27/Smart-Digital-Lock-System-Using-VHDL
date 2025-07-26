library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_smart_lock is
end tb_smart_lock;

architecture Behavioral of tb_smart_lock is
    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal pass_in : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal unlock  : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.smart_lock
        port map (
            clk     => clk,
            reset   => reset,
            pass_in => pass_in,
            unlock  => unlock
        );

    -- Clock process
    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial values
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Test wrong password
        pass_in <= "0001";
        wait for 20 ns;

        -- Test correct password
        pass_in <= "1010";
        wait for 20 ns;

        -- Test another wrong password
        pass_in <= "1111";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
