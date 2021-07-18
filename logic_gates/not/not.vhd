library ieee;
use ieee.std_logic_1164.all;

entity func_not is
	    port (
	            a  : in  std_logic;
				-- b ignored
	            b  : in  std_logic;
	            s  : out std_logic
				);
	    end;

architecture behavioral of func_not is
begin
	s <= not a ;
end;
