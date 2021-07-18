library ieee;
use ieee.std_logic_1164.all;

entity func_or is
	    port (
	            a  : in  std_logic;
	            b  : in  std_logic;
	            s  : out std_logic
				);
	    end;

architecture behavioral of func_or is
begin
	s <= a or b ;
end;
