-- Elementos de Sistemas
-- by Luciano Soares
-- Register64.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Register64 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(63 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(63 downto 0)
	);
end entity;

architecture rtl of Register64 is

begin

process(clock)

	begin 
		if(clock'event and clock ='1' and load='1') then
				output <= input;
		end if;
	end process;

end rtl;

