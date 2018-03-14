library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC);
end entity;

architecture rtl of DMux2Way is
begin 
	process (sel, a)
	begin
		if (sel = '0') then
			q0 <= a;
		else
			q1 <= a;
		end if;
	end process;

end rtl;