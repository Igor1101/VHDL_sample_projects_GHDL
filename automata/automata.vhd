library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity automata is
	port (
		clk: in std_logic;
		reset: in std_logic;
		x1: in std_logic;
		x2: in std_logic;
		y: out std_logic_vector(2 downto 0)
		);
end automata; 

architecture behavioral of automata is
	signal x : std_logic_vector(1 downto 0);
	signal st: std_logic_vector(2 downto 0) := "001";
begin
	x <= x2 & x1;
	auto: process(reset, clk)
	begin
		if(reset = '1') then 
			y <= "000";
			st <= "001";
		elsif rising_edge(clk) then
			case st is 
			 	when "001" => 
				 	if x = "00" then
						st <= "011";
						y <= st;
					end if;
				when "010" =>
					if x(0) = '1' then
						st <= "011";
						y <= st;
					end if;
				when "011" =>
					if x(1) = '0' then
						st <= "100";
						y <= st;
					end if;
				when "100" =>
					if x = "11" then
						st <= "001";
						y <= st;
					end if;
				when others => null;
				end case;
			end if;
		end process;
end;
