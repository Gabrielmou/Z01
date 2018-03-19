library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nor8Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture rtl of Nor8Way is
begin
	process (a,b,c,d,e,f,g,h)
	begin
		if (a='0' and b='0' and c ='0' and d='0' and e='0' and f='0' and g='0' and h='0') then
			q <= '1';
		else
			q <= '0';
		end if;
	end process;
end rtl;
