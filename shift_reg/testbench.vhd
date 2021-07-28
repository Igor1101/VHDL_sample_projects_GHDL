library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavior of testbench is
    component reg is
        port (
            clk: in std_logic;
            reset: in std_logic;
            d: in std_logic_vector(7 downto 0);
            q: out std_logic_vector(7 downto 0);
            -- mode of operation
            s: in std_logic_vector(2 downto 0)
            );
    end component;

    signal d: std_logic_vector(7 downto 0);
    signal q: std_logic_vector(7 downto 0);
            -- mode of operation
    signal s: std_logic_vector(2 downto 0);
    signal reset : std_logic := '0';
    signal clk: std_logic:= '0';
begin
    uut0: reg port map (
      q => q,
      d => d,
      s => s,
      reset => reset,
      clk => clk 
    );

    stim_proc: process
    begin
        d <= "00001000";
        s <= "000", 
        "001" after 20 ns, 
        "010" after 40 ns, 
        "011" after 60 ns,
        "100" after 80 ns,
        "010" after 100 ns;
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