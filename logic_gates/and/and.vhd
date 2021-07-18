library ieee;
use ieee.std_logic_1164.all;

entity fand is
	    port (
	            a  : in  std_logic;
	            b  : in  std_logic;
	            s  : out std_logic
				);
	    end;

architecture behavioral of fand is
begin
	s <= a and b ;
end;
