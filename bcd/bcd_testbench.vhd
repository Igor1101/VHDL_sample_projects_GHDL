library ieee;
use ieee.std_logic_1164.all;

entity bcd_testbench is
end bcd_testbench;

architecture behavior of bcd_testbench is
    component bcd is
      port (
        b  : in  std_logic_vector(7 downto 0);
      d0 : out std_logic_vector(6 downto 0);
      d1 : out std_logic_vector(6 downto 0)
      );
    end component;

    signal input  : std_logic_vector(7 downto 0);
    signal output0: std_logic_vector(6 downto 0);
    signal output1: std_logic_vector(6 downto 0);
begin
    uut0: bcd port map (
        b => input,
        d0 => output0,
        d1 => output1 
    );

    stim_proc: process
    begin

        input <= X"10"; wait for 10 ns; 
        input <= X"11"; wait for 10 ns; 
        input <= X"1A"; wait for 10 ns; 
        report "testbench finished";
        wait;
    end process;
end;