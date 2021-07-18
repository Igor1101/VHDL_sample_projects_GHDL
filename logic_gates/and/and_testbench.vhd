library ieee;
use ieee.std_logic_1164.all;

entity and_testbench is
end and_testbench;

architecture behavior of and_testbench is
    component fand is
        port (
            a  : in  std_logic;
            b  : in  std_logic;
            s  : out std_logic);
    end component;
    signal input  : std_logic_vector(1 downto 0);
    signal output : std_logic;
begin
    uut: fand port map (
        a => input(0),
        b => input(1),
        s => output
    );

    stim_proc: process
    begin
        input <= "00"; wait for 10 ns; assert output = '0' report "0&0 failed";
        input <= "01"; wait for 10 ns; assert output = '0' report "0&1 failed";
        input <= "10"; wait for 10 ns; assert output = '0' report "1&0 failed";
        input <= "11"; wait for 10 ns; assert output = '1' report "1&1 failed";
        report "Full adder testbench finished";
        wait;
    end process;
end;