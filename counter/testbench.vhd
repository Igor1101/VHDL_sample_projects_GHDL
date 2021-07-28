library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavior of testbench is
    component counter is
        generic(count_to: integer:=8);
        port (
            clk: in std_logic;
            reset: in std_logic;
            co: out std_logic
            );
    end component;

    signal co: std_logic;
    signal reset : std_logic := '0';
    signal clk: std_logic :='0';
begin
    uut0: counter 
    generic map (count_to=>8)
    port map (
      co => co,
      reset => reset,
      clk => clk 
    );

    stim_proc: process
    begin
        Reset <='1', '0' after 2 ns;

        report "testbench finished";
        wait;
    end process;
    clkock: process
    begin
        for i in 1 to 100 loop
            wait for 4 ns;
            clk <= not clk;
        end loop;
        wait;
    end process;

end;