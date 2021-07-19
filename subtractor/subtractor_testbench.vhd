library ieee;
use ieee.std_logic_1164.all;

entity subtractor_testbench is
end subtractor_testbench;

architecture behavior of subtractor_testbench is
    component full_subtractor is
        port (
            a  : in  std_logic;
            b  : in  std_logic;
	        diff : out std_logic;
	        borrow : out std_logic);
    end component;

    component half_subtractor is
        port (
            a  : in  std_logic;
            b  : in  std_logic;
	        diff : out std_logic;
	        borrow : out std_logic);
    end component;

    signal input  : std_logic_vector(2 downto 0);
    signal output_half_subtractor : std_logic_vector(1 downto 0);
begin
    uut0_half_subtractor: half_subtractor port map (
        a => input(0),
        b => input(1),
        diff => output_half_subtractor(0),
        borrow => output_half_subtractor(1)
    );


    stim_proc: process
    begin

        input <= "000"; wait for 10 ns; 
        assert output_half_subtractor = "00" report "half subtractor 0+0+0 failed";

        input <= "001"; wait for 10 ns; 
        assert output_half_subtractor  = "01" report "half subtractor 0+0+1 failed";
        input <= "010"; wait for 10 ns; 
        assert output_half_subtractor  = "11" report "half subtractor 0+1+0 failed";
        input <= "100"; wait for 10 ns; 
        assert output_half_subtractor  = "00" report "half subtractor 1+0+0 failed";
        input <= "011"; wait for 10 ns; 
        assert output_half_subtractor  = "00" report "half subtractor 0+1+1 failed";
        input <= "110"; wait for 10 ns; 
        assert output_half_subtractor = "11" report "half subtractor 1+1+0 failed";
        input <= "111"; wait for 10 ns; 
        assert output_half_subtractor = "00" report "half subtractor 1+1+1 failed";
        report "subtractor testbench finished";
        wait;
    end process;
end;