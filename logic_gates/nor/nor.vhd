library ieee;
use ieee.std_logic_1164.all;

entity func_nor is
	    port (
	            a  : in  std_logic;
	            b  : in  std_logic;
	            s  : out std_logic
				);
	    end;

architecture behavioral of func_nor is
begin
	s <= a nor b ;
end;
