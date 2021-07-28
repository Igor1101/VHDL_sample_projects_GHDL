library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity bcd is
	port (
	    b  : in  std_logic_vector(7 downto 0);
		d0 : out std_logic_vector(6 downto 0);
		d1 : out std_logic_vector(6 downto 0)
		);
end bcd; 

architecture behavioral of bcd is
	signal bint : integer range 255 downto 0;
	signal bint_low : integer range 255 downto 0;
	signal bint_high : integer range 255 downto 0;
	signal blow, bhigh : std_logic_vector(3 downto 0);
function conv_bcd(s: std_logic_vector(3 downto 0)) return std_logic_vector is
begin
	case s is 
		when "0000" => return "1111110";
		when "0001" => return "1001111";
		when "0010" => return "0010010";
		when "0011" => return "0000110";
		when "0100" => return "1001100";
		when "0101" => return "0100100";
		when "0110" => return "0100000";
		when "0111" => return "0001111";
		when "1000" => return "0000000";
		when "1001" => return "0000100";
	 	when others => return "1110000";
	end case;
end conv_bcd;


begin
	bint <= to_integer(unsigned(b));
	bint_low <= bint mod 10;
	bint_high <= (bint - bint_low) / 10;
	blow <= std_logic_vector(to_unsigned(bint_low, blow'length));
	bhigh <= std_logic_vector(to_unsigned(bint_high, bhigh'length));
	d0 <= conv_bcd(blow);
	d1 <= conv_bcd(bhigh);
end;
