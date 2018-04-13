-- Elementos de Sistemas
-- by Luciano Soares
-- Register32.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Register32 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(31 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(31 downto 0)
	);
end entity;
  
architecture arch of Register32 is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;
	
begin 

	u1:BinaryDigit  port map ( clock, input(0),  load, output(0)  );
	u2:BinaryDigit  port map ( clock, input(1),  load, output(1)  );
	u3:BinaryDigit  port map ( clock, input(2),  load, output(2)  );
	u4:BinaryDigit  port map ( clock, input(3),  load, output(3)  );
	u5:BinaryDigit  port map ( clock, input(4),  load, output(4)  );
	u6:BinaryDigit  port map ( clock, input(5),  load, output(5)  );
	u7:BinaryDigit  port map ( clock, input(6),  load, output(6)  );
	u8:BinaryDigit  port map ( clock, input(7),  load, output(7)  );
	u9:BinaryDigit  port map ( clock, input(8),  load, output(8)  );
	u10:BinaryDigit port map ( clock, input(9),  load, output(9)  );
	u11:BinaryDigit port map ( clock, input(10), load, output(10) );
	u12:BinaryDigit port map ( clock, input(11), load, output(11) );
	u13:BinaryDigit port map ( clock, input(12), load, output(12) );
	u14:BinaryDigit port map ( clock, input(13), load, output(13) );
	u15:BinaryDigit port map ( clock, input(14), load, output(14) );
	u16:BinaryDigit port map ( clock, input(15), load, output(15) );
	u17:BinaryDigit port map ( clock, input(16), load, output(16) );
	u18:BinaryDigit port map ( clock, input(17), load, output(17) );
	u19:BinaryDigit port map ( clock, input(18), load, output(18) );
	u20:BinaryDigit port map ( clock, input(19), load, output(19) );
	u21:BinaryDigit port map ( clock, input(20), load, output(20) );
	u22:BinaryDigit port map ( clock, input(21), load, output(21) );
	u23:BinaryDigit port map ( clock, input(22), load, output(22) );
	u24:BinaryDigit port map ( clock, input(23), load, output(23) );
	u25:BinaryDigit port map ( clock, input(24), load, output(24) );
	u26:BinaryDigit port map ( clock, input(25), load, output(25) );
	u27:BinaryDigit port map ( clock, input(26), load, output(26) );
	u28:BinaryDigit port map ( clock, input(27), load, output(27) );
	u29:BinaryDigit port map ( clock, input(28), load, output(28) );
	u30:BinaryDigit port map ( clock, input(29), load, output(29) );
	u31:BinaryDigit port map ( clock, input(30), load, output(30) );
	u32:BinaryDigit port map ( clock, input(31), load, output(31) );

end architecture;