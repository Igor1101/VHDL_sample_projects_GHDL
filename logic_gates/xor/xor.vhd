library ieee;
use ieee.std_logic_1164.all;

entity func_xor is
	    port (
	            a  : in  std_logic;
	            b  : in  std_logic;
	            s  : out std_logic
				);
	    end;

architecture behavioral of func_xor is
begin
	s <= a xor b ;
end;
