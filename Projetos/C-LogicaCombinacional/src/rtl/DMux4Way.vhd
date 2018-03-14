library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux4Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC);
end entity;

architecture rtl of DMux4Way is

signal sel_1v0, sel_1v1: STD_LOGIC;
begin
	sel_1v0 <= not sel(0);
	sel_1v1 <= not sel(1);
	q0 <= a and sel_1v0 and sel_1v1;
	q1 <= a and sel(0) and sel_1v1;
	q2 <= a and sel_1v0 and sel(1);
	q3 <= a and sel(0) and sel(1);
end rtl;
