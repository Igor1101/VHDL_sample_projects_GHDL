library ieee;
use ieee.std_logic_1164.all;

entity adder_testbench is
end adder_testbench;

architecture behavior of adder_testbench is
    component full_adder is
        port (
            a  : in  std_logic;
            b  : in  std_logic;
            ci : in  std_logic;
            s  : out std_logic;
            co : out std_logic);
    end component;

    component half_adder is
        port (
            a  : in  std_logic;
            b  : in  std_logic;
            s  : out std_logic;
            co : out std_logic);
    end component;

    signal input  : std_logic_vector(2 downto 0);
    signal output_full_adder : std_logic_vector(1 downto 0);
    signal output_half_adder : std_logic_vector(1 downto 0);
begin
    uut0_full_adder: full_adder port map (
        a => input(0),
        b => input(1),
        ci => input(2),
        s => output_full_adder(0),
        co => output_full_adder(1)
    );

    uut1_half_adder: half_adder port map (
        a => input(0),
        b => input(1),
        s => output_half_adder(0),
        co => output_half_adder(1)
    );


    stim_proc: process
    begin

        input <= "000"; wait for 10 ns; 
        assert output_full_adder = "00" report "full adder 0+0+0 failed";
        assert output_half_adder = "00" report "half adder 0+0+0 failed";

        input <= "001"; wait for 10 ns; 
        assert output_full_adder  = "01" report "full adder 0+0+1 failed";
        assert output_half_adder  = "01" report "half adder 0+0+1 failed";
        input <= "010"; wait for 10 ns; 
        assert output_full_adder  = "01" report "full adder 0+1+0 failed";
        assert output_half_adder  = "01" report "half adder 0+1+0 failed";
        input <= "100"; wait for 10 ns; 
        assert output_full_adder  = "01" report "full adder 1+0+0 failed";
        assert output_half_adder  = "00" report "half adder 1+0+0 failed";
        input <= "011"; wait for 10 ns; 
        assert output_full_adder  = "10" report "full adder 0+1+1 failed";
        assert output_half_adder  = "10" report "half adder 0+1+1 failed";
        input <= "110"; wait for 10 ns; 
        assert output_full_adder = "10" report "full adder 1+1+0 failed";
        assert output_half_adder = "01" report "half adder 1+1+0 failed";
        input <= "111"; wait for 10 ns; 
        assert output_full_adder = "11" report "full adder 1+1+1 failed";
        assert output_half_adder = "10" report "half adder 1+1+1 failed";
        report "adder testbench finished";
        wait;
    end process;
end;