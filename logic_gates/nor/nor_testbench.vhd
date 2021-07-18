library ieee;
use ieee.std_logic_1164.all;

entity nor_testbench is
end nor_testbench;

architecture behavior of nor_testbench is
    component func_nor is
        port (
            a  : in  std_logic;
            b  : in  std_logic;
            s  : out std_logic);
    end component;
    signal input  : std_logic_vector(1 downto 0);
    signal output : std_logic;
begin
    uut: func_nor port map (
        a => input(0),
        b => input(1),
        s => output
    );

    stim_proc: process
    begin
        input <= "00"; wait for 10 ns; assert output = '1' report "0&0 failed";
        input <= "01"; wait for 10 ns; assert output = '0' report "0&1 failed";
        input <= "10"; wait for 10 ns; assert output = '0' report "1&0 failed";
        input <= "11"; wait for 10 ns; assert output = '0' report "1&1 failed";
        report "NOR testbench finished";
        wait;
    end process;
end;