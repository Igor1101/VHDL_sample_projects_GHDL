library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavior of testbench is
    component automata is
      port (
        clk: in std_logic;
        reset: in std_logic;
        x1: in std_logic;
        x2: in std_logic;
        y: out std_logic_vector(2 downto 0)
        );
    end component;

    signal x1 : std_logic := '0';
    signal x2 : std_logic := '0';
    signal y : std_logic_vector(2 downto 0);
    signal reset : std_logic := '0';
    signal clk: std_logic:= '0';
begin
    uut0: automata port map (
      x1 => x1,
      x2 => x2,
      y => y,
      reset => reset,
      clk => clk 
    );

    stim_proc: process
    begin

        x1 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
        x2 <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 50 ns;
        Reset <='0', '1' after 220 ns;

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