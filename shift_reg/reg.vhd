library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity reg is
	port (
		clk: in std_logic;
		reset: in std_logic;
		d: in std_logic_vector(7 downto 0);
		q: out std_logic_vector(7 downto 0);
		-- mode of operation
		s: in std_logic_vector(2 downto 0)
		);
end reg; 

architecture behavioral of reg is
	signal tmps: std_logic_vector(7 downto 0);
begin
	shift: process(reset, clk)
	begin
		if(reset = '1') then 
			q <= X"00";
			tmps <= X"00";
		elsif rising_edge(clk) then
			-- select mode
			case s is 
				when "000" => null;
				when "001" => -- input reg
					tmps <= d;
				when "010" => -- output reg
					q <= tmps;
				when "011" => -- shift right
					for i  in 0 to 6 loop
						tmps(i+1) <= tmps(i);
					end loop;
				when "100" => -- shift left
					for i  in 7 downto 1 loop
						tmps(i-1) <= tmps(i);
					end loop;
				when others => null;
			end case;
		end if;
	end process;
end;
