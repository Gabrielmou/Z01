-- Elementos de Sistemas
-- by Luciano Soares
-- zerador16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity zerador16 is
   port(z   : in STD_LOGIC;
	    a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
   );
end zerador16;

architecture strucZero16 of zerador16 is

begin

y <= a when (z = '0') else
	"0000000000000000";

end strucZero16;
