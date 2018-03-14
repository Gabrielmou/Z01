library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC);
end entity;

architecture rtl of Mux8Way is
begin

	process (a, b, c, d, e, f, g, h, sel)
	begin

		if (sel = "000") then
			q <= a;
		elsif (sel = "001") then
			q <= b;
		elsif (sel = "010") then
			q <= c;
		elsif (sel = "011") then
			q <= d;
		elsif (sel = "100") then
			q <= e;
		elsif (sel = "101") then
			q <= f;
		elsif (sel = "110") then
			q <= g;
		else
			q <= h;

		end if;
	end process;
end rtl;