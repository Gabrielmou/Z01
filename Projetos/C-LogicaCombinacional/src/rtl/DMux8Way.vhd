library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux8Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
end entity;

architecture rtl of DMux8Way is
signal sel0, sel1, sel2: STD_LOGIC;
begin
	sel0 <= not sel(0);
	sel1 <= not sel(1);
	sel2 <= not sel(2);

	q0 <= a and sel0 and sel1;
	q1 <= a and sel(0) and sel1;
	q2 <= a and sel0 and sel(1);
	q3 <= a and sel(0) and sel(1);

	q4 <= a and sel2 and sel1;
	q5 <= a and sel(2) and sel1;
	q6 <= a and sel2 and sel(1);
	q7 <= a and sel(2) and sel(1);
end rtl;