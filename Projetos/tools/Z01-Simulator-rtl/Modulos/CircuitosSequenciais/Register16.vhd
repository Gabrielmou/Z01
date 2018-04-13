-- Elementos de Sistemas
-- by Luciano Soares
-- Register16.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Register16 is
	port(
		clock:   in STD_LOGIC;
    reset:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;
  
architecture arch of Register16 is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
      reset:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;
	
begin 

	u1:BinaryDigit  port map ( clock, reset,  input(0), load, output(0)  );
	u2:BinaryDigit  port map ( clock, reset,  input(1), load, output(1)  );
	u3:BinaryDigit  port map ( clock, reset,  input(2), load, output(2)  );
	u4:BinaryDigit  port map ( clock, reset,  input(3), load, output(3)  );
	u5:BinaryDigit  port map ( clock, reset,  input(4), load, output(4)  );
	u6:BinaryDigit  port map ( clock, reset,  input(5), load, output(5)  );
	u7:BinaryDigit  port map ( clock, reset,  input(6), load, output(6)  );
	u8:BinaryDigit  port map ( clock, reset,  input(7), load, output(7)  );
	u9:BinaryDigit  port map ( clock, reset,  input(8), load, output(8)  );
	u10:BinaryDigit port map ( clock, reset,  input(9), load, output(9)  );
	u11:BinaryDigit port map ( clock, reset, input(10), load, output(10) );
	u12:BinaryDigit port map ( clock, reset, input(11), load, output(11) );
	u13:BinaryDigit port map ( clock, reset, input(12), load, output(12) );
	u14:BinaryDigit port map ( clock, reset, input(13), load, output(13) );
	u15:BinaryDigit port map ( clock, reset, input(14), load, output(14) );
	u16:BinaryDigit port map ( clock, reset, input(15), load, output(15) );

end architecture;
