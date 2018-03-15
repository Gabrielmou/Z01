library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture rtl of Mux2Way is
begin
	process (sel,a,b)
	begin
		case sel is
			when '0'=> q <= a;
			when others => q <= b;
		end case;
	end process;
end rtl;
