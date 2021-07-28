library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity counter is
    generic(count_to: integer:=8);
	port (
		clk: in std_logic;
		reset: in std_logic;
		co: out std_logic
		);
end counter; 

architecture behavioral of counter is
	signal q: integer range 255 downto 0 := 0;
begin
	shift: process(reset, clk)
	begin
		if(reset = '1') then 
			q <= 0;
			co <= '0';
		elsif rising_edge(clk) then
			if q /= 1 then 
				co <= '0';
			end if;
			-- counter
			if q > count_to then
				co <= '1';
				q <= 0;
			else 
				q <= q + 1;
			end if;
		end if;
	end process;
end;
