library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			e:   in  STD_LOGIC_VECTOR(15 downto 0);
			f:   in  STD_LOGIC_VECTOR(15 downto 0);
			g:   in  STD_LOGIC_VECTOR(15 downto 0);
			h:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture rtl of Mux8Way16 is
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