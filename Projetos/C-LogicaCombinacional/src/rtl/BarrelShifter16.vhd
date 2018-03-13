library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  STD_LOGIC_VECTOR(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

	architecture rtl of BarrelShifter16 is
	q <= std_logic_vector(unsigned(a) rol to_integer(unsigned(size))) when (dir = '0') else
	     std_logic_vector(unsigned(a) ror to_integer(unsigned(size)));
	
	
end rtl;
